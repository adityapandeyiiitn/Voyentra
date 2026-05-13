<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Voyentra - Travel Your Way</title>
<?php 
if (file_exists('config.php')) {
    require_once 'config.php';
} else {
    define('RAZORPAY_KEY_ID', getenv('RAZORPAY_KEY_ID') ?: 'rzp_test_SofkoLIvdfqfK4');
    define('RAZORPAY_KEY_SECRET', getenv('RAZORPAY_KEY_SECRET') ?: 'qfl3Vkm5BML6MelmqDNK9TLA');
}
?>
<link rel="stylesheet" href="style.css">
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    const RZP_KEY = "<?php echo RAZORPAY_KEY_ID; ?>";
</script>
</head>

<body>

<nav>
  <div class="logo">&#9992; Voyentra</div>
  <div class="nav-links" id="nav-links">
    <a href="#search-section">Search</a>
    <a href="#destinations">Destinations</a>
    <a href="#offers">Offers</a>
    <a href="#contact">Contact</a>
  </div>
  <div class="menu-toggle" onclick="toggleMenu()">&#9776;</div>
</nav>

<div class="hero">
  <h1>Find Your Perfect Journey</h1>
  <p>Flights, Hotels &amp; Destinations — all in one place</p>

  <div class="search-box" id="search-section">

    <div class="tabs">
      <button class="tab-btn active" onclick="switchTab('flights', this)">&#9992; Flights</button>
      <button class="tab-btn" onclick="switchTab('hotels', this)">&#127968; Hotels</button>
    </div>

    <!-- Flights tab -->
    <div id="tab-flights" class="tab-content active" style="display:block;">
      <div class="search-fields">
        <div class="field">
          <label>From</label>
          <input type="text" id="f-from" placeholder="e.g. Mumbai" />
        </div>
        <div class="field">
          <label>To</label>
          <input type="text" id="f-to" placeholder="e.g. Dubai" />
        </div>
        <div class="field">
          <label>Departure Date</label>
          <input type="date" id="f-date" />
        </div>
        <div class="field">
          <label>Passengers</label>
          <select id="f-pass">
            <option>1</option><option>2</option><option>3</option><option>4</option>
          </select>
        </div>
        <button class="search-btn" onclick="searchFlights()">Search Flights</button>
      </div>
      <div id="flight-alert" class="alert-msg"></div>
    </div>

    <!-- Hotels tab -->
    <div id="tab-hotels" class="tab-content" style="display:none;">
      <div class="search-fields">
        <div class="field">
          <label>City Name</label>
          <input type="text" id="h-city" placeholder="e.g. Paris" />
        </div>
        <div class="field">
          <label>Check-in</label>
          <input type="date" id="h-in" />
        </div>
        <div class="field">
          <label>No. of Days</label>
          <input type="number" id="h-days" placeholder="e.g. 3" min="1" />
        </div>
        <button class="search-btn" onclick="searchHotels()">Search Hotels</button>
      </div>
      <div id="hotel-alert" class="alert-msg"></div>
    </div>

  </div>
</div>

<!-- Flight Results -->
<section id="flight-results-section" style="display:none;">
  <h2 style="margin-bottom:20px;">Available Flights</h2>
  <div id="flight-results"></div>
</section>

<!-- Hotel Results -->
<section id="hotel-results-section" style="display:none;">
  <h2 style="margin-bottom:20px;">Recommended Hotels</h2>
  <div id="hotel-results"></div>
</section>

<!-- Destinations -->
<section id="destinations">
  <h2 style="font-size:32px; font-weight:800; margin-bottom:10px;">Popular Destinations</h2>
  <p style="color:#0b3412; margin-bottom:40px;">Top picks based on recent traveler reviews</p>

  <div class="destinations-grid">

    <div class="dest-card" onclick="quickSearch('Paris')">
      <img src="https://images.unsplash.com/photo-1502602898657-3e91760cbb34?q=80&w=1000" class="dest-img" alt="Paris">
      <div class="dest-info">
        <div class="dest-name">Paris, France</div>
        <div class="dest-price">From &#8377;42,000</div>
      </div>
    </div>

    <div class="dest-card" onclick="quickSearch('Dubai')">
      <img src="https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=1000" class="dest-img" alt="Dubai">
      <div class="dest-info">
        <div class="dest-name">Dubai, UAE</div>
        <div class="dest-price">From &#8377;18,500</div>
      </div>
    </div>

    <div class="dest-card" onclick="quickSearch('Bali')">
      <img src="https://images.unsplash.com/photo-1537996194471-e657df975ab4?q=80&w=1000" class="dest-img" alt="Bali">
      <div class="dest-info">
        <div class="dest-name">Bali, Indonesia</div>
        <div class="dest-price">From &#8377;22,000</div>
      </div>
    </div>

    <div class="dest-card" onclick="quickSearch('Tokyo')">
      <img src="https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?q=80&w=1000" class="dest-img" alt="Tokyo">
      <div class="dest-info">
        <div class="dest-name">Tokyo, Japan</div>
        <div class="dest-price">From &#8377;55,000</div>
      </div>
    </div>

  </div>
</section>

<!-- Offers Section -->
<section id="offers">
  <h2 style="text-align:center; font-size:32px; font-weight:800; margin-bottom:40px;">Special Offers</h2>
  <div class="offers-container">
    
    <div class="offer-card">
      <div class="offer-badge">Limited Time</div>
      <h3>Summer Getaway</h3>
      <p>Enjoy up to 25% off on luxury stays in Bali and Tokyo. Book before May 30th!</p>
      <button class="search-btn" onclick="quickSearch('Bali')">Claim Offer</button>
    </div>

    <div class="offer-card" style="background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);">
      <div class="offer-badge">Early Bird</div>
      <h3>European Escape</h3>
      <p>Plan your Paris trip 3 months in advance and get flat ₹5,000 off on flights.</p>
      <button class="search-btn" onclick="quickSearch('Paris')">Learn More</button>
    </div>

    <div class="offer-card">
      <div class="offer-badge">Best Value</div>
      <h3>Dubai Stopover</h3>
      <p>Free city tour and 1-night stay on selected flight bookings to Dubai.</p>
      <button class="search-btn" onclick="quickSearch('Dubai')">View Details</button>
    </div>

  </div>
</section>

<!-- Newsletter -->
<section id="contact" style="padding:80px 20px; background:#fff; text-align:center; border-top:1px solid #e2e8f0;">
  <h3 style="font-size:24px; font-weight:800;">Subscribe to our Newsletter</h3>
  <p style="color:#64748b; margin-top:8px;">Get the best travel deals delivered to your inbox.</p>
  <br>
  <div style="display:inline-flex; gap:10px; margin-top:10px;">
    <input type="email" id="email-input" placeholder="Your email..." style="padding:12px 20px; border-radius:8px; border:1px solid #cbd5e1; outline:none; width:250px;">
    <button class="search-btn" onclick="subscribeEmail()">Join Now</button>
  </div>
  <div id="subscribe-msg" class="alert-msg"></div>
</section>

<!-- Generic popup -->
<div class="popup-overlay" id="popup-overlay">
  <div class="popup-box">
    <div style="font-size:50px; color:#155724;">&#10004;</div>
    <h2 style="margin:15px 0; font-weight:800;">Success!</h2>
    <p id="popup-message">Action completed successfully.</p>
    <button class="search-btn" style="margin-top:20px; width:100%;" onclick="closePopup()">Sweet</button>
  </div>
</div>

<footer>
  <p style="margin-bottom:10px; color:#fff; font-weight:600;">Voyentra Travel Agency</p>
  <p>&copy; 2026 Voyentra. All rights reserved. Web Dev Project.</p>
</footer>

<!-- ========== PAYMENT PAGE ========== -->
<div id="payment-page">
  <div class="payment-card">

    <!-- GPay-style success overlay -->
    <div class="gpay-success-overlay" id="gpay-success">
      <div class="gpay-tick-circle">
        <svg viewBox="0 0 24 24">
          <polyline points="4,13 9,18 20,7"></polyline>
        </svg>
      </div>
      <div class="gpay-success-title">Payment Successful!</div>
      <div class="gpay-success-sub" id="gpay-success-sub">Your booking is confirmed.</div>
      <button class="gpay-done-btn" onclick="closePaymentPage()">Back to Home</button>
    </div>

    <div class="pay-logo">&#9992; Voyentra</div>
    <h2>Secure Payment</h2>
    <p class="pay-subtitle" id="pay-subtitle">Complete your booking</p>
    <div class="pay-divider"></div>

    <!-- Hidden fields passed to payment.php -->
    <input type="hidden" id="pay-type">
    <input type="hidden" id="pay-id">
    <input type="hidden" id="pay-price">

    <div class="pay-field">
      <label>Full Name</label>
      <input type="text" id="pay-name" placeholder="e.g. Ishaan Sharma" />
    </div>

    <div class="pay-field">
      <label>Bank Name</label>
      <input type="text" id="pay-bank" placeholder="e.g. SBI, HDFC, ICICI" />
    </div>

    <div class="pay-field">
      <label>Amount to Pay (&#8377;)</label>
      <div class="pay-amount-display" id="pay-amount-display">&#8377; —</div>
    </div>

    <div class="pay-error" id="pay-error">Incorrect password. Please try again.</div>

    <button class="pay-confirm-btn" onclick="confirmPayment()">Confirm &amp; Pay</button>
    <button class="pay-back-btn" onclick="closePaymentPage()">&#8592; Go Back</button>

  </div>
</div>
<!-- ========== END PAYMENT PAGE ========== -->

<script src="script.js"></script>

</body>
</html>
