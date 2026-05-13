<?php
// search.php
// Called by script.js via fetch(). Returns HTML cards for flights or hotels.

if (file_exists('db.php')) {
    require 'db.php';
} else {
    $host     = getenv('MYSQLHOST') ?: getenv('DB_HOST') ?: "localhost";
    $user     = getenv('MYSQLUSER') ?: getenv('DB_USER') ?: "root";
    $password = getenv('MYSQLPASSWORD') ?: getenv('DB_PASSWORD') ?: "";
    $database = getenv('MYSQLDATABASE') ?: getenv('DB_NAME') ?: "voyentra";
    $port     = getenv('MYSQLPORT') ?: getenv('DB_PORT') ?: 3306;
    $ssl_ca   = getenv('DB_SSL_CA');

    $conn = mysqli_init();
    if ($ssl_ca) {
        $conn->ssl_set(NULL, NULL, $ssl_ca, NULL, NULL);
    }
    if (!$conn->real_connect($host, $user, $password, $database, $port, NULL, $ssl_ca ? MYSQLI_CLIENT_SSL : 0)) {
        die("Connection failed: " . mysqli_connect_error());
    }
}

$type = $_GET['type'] ?? '';

// ── FLIGHT SEARCH ─────────────────────────────────────────────────────────────
if ($type === 'flight') {
    $from = trim($_GET['from'] ?? '');
    $to   = trim($_GET['to']   ?? '');

    if (!$from || !$to) {
        echo "<p style='padding:20px;'>Please enter both cities.</p>";
        exit;
    }

    $stmt = $conn->prepare(
        "SELECT * FROM flights
         WHERE Start LIKE ? AND Destination LIKE ? AND Seats_available > 0
         ORDER BY Price ASC"
    );
    $likeFrom = "%$from%";
    $likeTo   = "%$to%";
    $stmt->bind_param("ss", $likeFrom, $likeTo);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        echo "<p style='padding:20px;'>No flights found for this route.</p>";
        exit;
    }

    while ($r = $result->fetch_assoc()) {
        $id    = htmlspecialchars($r['Flight_ID']);
        $price = (int)$r['Price'];
        echo "
        <div class='flight-card'>
            <div>
                <strong>" . htmlspecialchars($r['Airlines']) . "</strong>
                &nbsp;—&nbsp;
                " . htmlspecialchars($r['Start']) . " to " . htmlspecialchars($r['Destination']) . "
                <br>
                <span style='font-size:13px; color:#64748b;'>
                    " . htmlspecialchars($r['Date']) . " &nbsp;|&nbsp;
                    " . htmlspecialchars($r['Time']) . " &nbsp;|&nbsp;
                    " . htmlspecialchars($r['Class']) . " &nbsp;|&nbsp;
                    &#9992; " . htmlspecialchars($r['Duration']) . "
                </span>
            </div>
            <div>
                &#8377;" . number_format($price) . "
                <button class='search-btn'
                    style='padding:6px 15px; font-size:12px; margin-left:10px;'
                    onclick=\"bookItem('Flight', '$id', $price)\">
                    Book
                </button>
            </div>
        </div>";
    }
    $stmt->close();

// ── HOTEL SEARCH ──────────────────────────────────────────────────────────────
} elseif ($type === 'hotel') {
    $city = trim($_GET['city'] ?? '');
    $days = max(1, intval($_GET['days'] ?? 1));

    if (!$city) {
        echo "<p style='padding:20px;'>Please enter a city.</p>";
        exit;
    }

    $stmt = $conn->prepare(
        "SELECT * FROM hotels
         WHERE City LIKE ? AND Rooms_available > 0
         ORDER BY Rating DESC, Price_per_night ASC"
    );
    $likeCity = "%$city%";
    $stmt->bind_param("s", $likeCity);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        echo "<p style='padding:20px;'>No hotels found here.</p>";
        exit;
    }

    while ($r = $result->fetch_assoc()) {
        $id         = htmlspecialchars($r['Hotel_ID']);
        $perNight   = (int)$r['Price_per_night'];
        $total      = $perNight * $days;
        echo "
        <div class='hotel-card'>
            <div>
                <strong>" . htmlspecialchars($r['Hotel_name']) . "</strong>
                &nbsp;—&nbsp;
                " . $r['Rating'] . " Stars
                <br>
                <span style='font-size:13px; color:#64748b;'>
                    " . htmlspecialchars($r['City']) . " &nbsp;|&nbsp;
                    " . htmlspecialchars($r['Room_type']) . " &nbsp;|&nbsp;
                    " . $r['Rooms_available'] . " rooms left &nbsp;|&nbsp;
                    &#8377;" . number_format($perNight) . "/night &times; $days day(s)
                </span>
            </div>
            <div>
                &#8377;" . number_format($total) . " total
                <button class='search-btn'
                    style='padding:6px 15px; font-size:12px; margin-left:10px;'
                    onclick=\"bookItem('Hotel', '$id', $total)\">
                    Book
                </button>
            </div>
        </div>";
    }
    $stmt->close();

} else {
    echo "<p style='padding:20px;'>Invalid search type.</p>";
}

$conn->close();
?>
