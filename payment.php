<?php
// payment.php
// Receives a POST from confirmPayment() in script.js via fetch().
// Saves the booking to flight_payment or hotel_payment and returns JSON.

header('Content-Type: application/json');

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

if (file_exists('config.php')) {
    require 'config.php';
} else {
    if (!defined('RAZORPAY_KEY_ID')) define('RAZORPAY_KEY_ID', getenv('RAZORPAY_KEY') ?: getenv('RAZORPAY_KEY_ID') ?: 'rzp_test_SofkoLIvdfqfK4');
    if (!defined('RAZORPAY_KEY_SECRET')) define('RAZORPAY_KEY_SECRET', getenv('RAZORPAY_SECRET') ?: getenv('RAZORPAY_KEY_SECRET') ?: 'qfl3Vkm5BML6MelmqDNK9TLA');
}

$type   = trim($_POST['type']          ?? '');
$id     = trim($_POST['id']            ?? '');
$name   = trim($_POST['customer_name'] ?? '');
$bank   = trim($_POST['bank_name']     ?? '');
$amount = floatval($_POST['amount']    ?? 0);

// Basic validation
if (!$type || !$id || !$name || !$bank || $amount <= 0) {
    echo json_encode(['success' => false, 'error' => 'Missing required fields.']);
    exit;
}

$pay_date = date('Y-m-d');
$pay_time = date('H:i:s');

// Insert into correct table
if ($type === 'Flight') {
    $stmt = $conn->prepare(
        "INSERT INTO flight_payment (Flight_id, Costumer_name, Amount_paid, Payment_date, Payment_time, Bank_name)
         VALUES (?, ?, ?, ?, ?, ?)"
    );
    $stmt->bind_param("ssdsss", $id, $name, $amount, $pay_date, $pay_time, $bank);

} elseif ($type === 'Hotel') {
    $stmt = $conn->prepare(
        "INSERT INTO hotel_payment (Hotel_ID, Costumer_name, Amount_paid, Payment_date, Payment_time, Bank_name)
         VALUES (?, ?, ?, ?, ?, ?)"
    );
    $stmt->bind_param("ssdsss", $id, $name, $amount, $pay_date, $pay_time, $bank);

} else {
    echo json_encode(['success' => false, 'error' => 'Invalid booking type.']);
    exit;
}

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
