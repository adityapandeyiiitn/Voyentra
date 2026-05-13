<?php
// payment.php
// Receives a POST from confirmPayment() in script.js via fetch().
// Saves the booking to flight_payment or hotel_payment and returns JSON.

header('Content-Type: application/json');

require 'db.php';
require 'config.php';

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
