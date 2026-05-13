// script.js — Voyentra

function toggleMenu() {
    var navLinks = document.getElementById("nav-links");
    navLinks.classList.toggle("active");
}

// ─────────────────────────────────────────────────────────────
// switchTab(tabName, btnElement)
// Switches the visible search panel between Flights and Hotels.
// ─────────────────────────────────────────────────────────────
function switchTab(tabName, btnElement) {
    var contents = document.getElementsByClassName("tab-content");
    for (var i = 0; i < contents.length; i++) { contents[i].style.display = "none"; }

    var btns = document.getElementsByClassName("tab-btn");
    for (var j = 0; j < btns.length; j++) { btns[j].classList.remove("active"); }

    document.getElementById("tab-" + tabName).style.display = "block";
    btnElement.classList.add("active");
}


// ─────────────────────────────────────────────────────────────
// searchFlights()
// Submits the flight search form to search.php via fetch,
// renders the returned HTML cards in the results section.
// ─────────────────────────────────────────────────────────────
function searchFlights() {
    var fromVal = document.getElementById("f-from").value.trim();
    var toVal = document.getElementById("f-to").value.trim();
    var alertBox = document.getElementById("flight-alert");

    if (!fromVal || !toVal) {
        alertBox.textContent = "Hey! Please fill the cities.";
        alertBox.style.display = "block";
        alertBox.style.color = "red";
        alertBox.style.marginTop = "10px";
        return;
    }

    alertBox.style.display = "none";

    var params = new URLSearchParams({
        type: "flight",
        from: fromVal,
        to: toVal,
        date: document.getElementById("f-date").value,
        pass: document.getElementById("f-pass").value
    });

    fetch("search.php?" + params.toString())
        .then(function (r) { return r.text(); })
        .then(function (html) {
            document.getElementById("flight-results").innerHTML = html;
            document.getElementById("flight-results-section").style.display = "block";
            document.getElementById("flight-results-section").scrollIntoView({ behavior: "smooth" });
        });
}


// ─────────────────────────────────────────────────────────────
// searchHotels()
// Submits the hotel search form to search.php via fetch,
// renders the returned HTML cards in the results section.
// ─────────────────────────────────────────────────────────────
function searchHotels() {
    var city = document.getElementById("h-city").value.trim();
    var checkIn = document.getElementById("h-in").value;
    var days = document.getElementById("h-days").value;

    if (!city) { alert("Enter a city first!"); return; }

    // Keep the Bali peak-season easter egg
    if (city.toLowerCase().includes("bali") && checkIn === "2026-05-02") {
        document.getElementById("hotel-results").innerHTML =
            `<div style="padding:20px; text-align:center; color:#1a3c5e; font-weight:600;">
                sorry due to the season peak, all the hotels are booked for this date :(
             </div>`;
        document.getElementById("hotel-results-section").style.display = "block";
        return;
    }

    var params = new URLSearchParams({
        type: "hotel",
        city: city,
        checkin: checkIn,
        days: days || 1
    });

    fetch("search.php?" + params.toString())
        .then(function (r) { return r.text(); })
        .then(function (html) {
            document.getElementById("hotel-results").innerHTML = html;
            document.getElementById("hotel-results-section").style.display = "block";
            document.getElementById("hotel-results-section").scrollIntoView({ behavior: "smooth" });
        });
}


// ─────────────────────────────────────────────────────────────
// quickSearch(dest)
// Shortcut triggered by clicking a destination card.
// Pre-fills the hotel city input, switches to Hotels tab, fires a search.
// ─────────────────────────────────────────────────────────────
function quickSearch(dest) {
    document.getElementById("h-city").value = dest;
    var hotelBtn = document.querySelectorAll(".tab-btn")[1];
    switchTab('hotels', hotelBtn);
    searchHotels();
}


// ─────────────────────────────────────────────────────────────
// bookItem(type, id, price)
// Opens the payment page overlay when the user clicks a Book button.
// Stores the booking type, id, and price for submission.
// ─────────────────────────────────────────────────────────────
function bookItem(type, id, price) {
    document.getElementById("pay-subtitle").textContent = type + " Booking — Fill in your payment details below";

    // Store hidden values for PHP submission
    document.getElementById("pay-type").value = type;
    document.getElementById("pay-id").value = id;
    document.getElementById("pay-price").value = price;

    // Show calculated amount in the display div
    document.getElementById("pay-amount-display").textContent =
        "₹" + parseInt(price).toLocaleString('en-IN');

    // Reset form fields
    document.getElementById("pay-bank").value = "";
    document.getElementById("pay-name").value = "";

    document.getElementById("pay-error").classList.remove("show");
    document.getElementById("gpay-success").classList.remove("show");
    document.getElementById("payment-page").classList.add("show");
}


// ─────────────────────────────────────────────────────────────
// closePopup()
// Hides the generic success popup modal.
// ─────────────────────────────────────────────────────────────
function closePopup() { document.getElementById("popup-overlay").classList.remove("show"); }


// ─────────────────────────────────────────────────────────────
// subscribeEmail()
// Validates the newsletter email input and shows a confirmation or error.
// ─────────────────────────────────────────────────────────────
function subscribeEmail() {
    var email = document.getElementById("email-input").value;
    if (email.includes("@")) {
        var sm = document.getElementById("subscribe-msg");
        sm.textContent = "Thnx for subscribing! Check your inbox.";
        sm.style.display = "block"; sm.style.color = "green"; sm.style.marginTop = "15px";
    } else {
        alert("That's not a real email...");
    }
}


/* ========== PAYMENT LOGIC ========== */

// ─────────────────────────────────────────────────────────────
// confirmPayment()
// Validates form, then POSTs to payment.php via fetch.
// On success, shows the GPay-style overlay and saves to DB.
// ─────────────────────────────────────────────────────────────
function confirmPayment() {
    var name = document.getElementById("pay-name").value.trim();
    var bank = document.getElementById("pay-bank").value.trim(); // Placeholder for method/bank
    var amountRaw = document.getElementById("pay-price").value;
    var errorBox = document.getElementById("pay-error");

    if (!name || !bank) {
        errorBox.textContent = "Please fill in all fields.";
        errorBox.classList.add("show");
        return;
    }

    errorBox.classList.remove("show");

    // Clean amount (remove commas, currency symbols)
    var cleanAmount = amountRaw.toString().replace(/[^0-9.]/g, '');
    var amountInPaise = Math.round(parseFloat(cleanAmount) * 100);

    if (isNaN(amountInPaise) || amountInPaise <= 0) {
        errorBox.textContent = "Invalid amount detected.";
        errorBox.classList.add("show");
        return;
    }

    console.log("Initializing Razorpay with Amount (Paise):", amountInPaise);

    var options = {
        "key": RZP_KEY,
        "amount": amountInPaise,
        "currency": "INR",
        "name": "Voyentra Travel",
        "description": "Booking Payment",
        "image": "https://cdn-icons-png.flaticon.com/512/201/201623.png",
        "handler": function (response) {
            console.log("Payment Successful:", response);
            savePaymentToDB(name, bank, cleanAmount);
        },
        "prefill": {
            "name": name,
            "email": "customer@example.com",
            "contact": "9999999999"
        },
        "theme": {
            "color": "#1a3c5e"
        }
    };

    try {
        var rzp1 = new Razorpay(options);
        rzp1.on('payment.failed', function (response) {
            console.error("Payment Failed:", response.error);
            errorBox.textContent = "Payment Failed: " + response.error.description;
            errorBox.classList.add("show");
        });
        rzp1.open();
    } catch (err) {
        console.error("Razorpay Error:", err);
        alert("Razorpay failed to load. Check your internet or Key ID.");
    }
}

function savePaymentToDB(name, bank, amount) {
    var formData = new FormData();
    formData.append("type", document.getElementById("pay-type").value);
    formData.append("id", document.getElementById("pay-id").value);
    formData.append("customer_name", name);
    formData.append("bank_name", bank);
    formData.append("amount", amount);

    fetch("payment.php", { method: "POST", body: formData })
        .then(function (r) { return r.json(); })
        .then(function (data) {
            if (data.success) {
                var successSub = document.getElementById("gpay-success-sub");
                successSub.innerHTML = "&#8377;" + parseInt(amount).toLocaleString('en-IN') + " paid successfully. Transaction ID: " + (Math.random().toString(36).substring(2, 10).toUpperCase());
                document.getElementById("gpay-success").classList.add("show");
            } else {
                alert("Server error while saving booking: " + data.error);
            }
        })
        .catch(function () {
            alert("Connection error. Your payment was successful but recording failed. Please contact support.");
        });
}


// ─────────────────────────────────────────────────────────────
// closePaymentPage()
// Closes both the payment page overlay and the inner success overlay.
// ─────────────────────────────────────────────────────────────
function closePaymentPage() {
    document.getElementById("payment-page").classList.remove("show");
    document.getElementById("gpay-success").classList.remove("show");
}

/* ========== END PAYMENT LOGIC ========== */
