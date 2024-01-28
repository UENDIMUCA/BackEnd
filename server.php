<?php

// Database configuration
$host = 'localhost';
$db   = 'project';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

// PDO (PHP Data Objects) connection
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}

// Allow requests from any origin
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

// Handle preflight requests for CORS
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type');
    exit(0);
}

// Fetch all orders or a specific order
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['id'])) {
        // Get a specific order
        $orderId = $_GET['id'];
        $stmt = $pdo->prepare('SELECT * FROM orders WHERE ID = ?');
        $stmt->execute([$orderId]);
        $order = $stmt->fetch();

        if (!$order) {
            http_response_code(404);
            echo json_encode(["message" => "Order not found"]);
            exit;
        }

        echo json_encode($order);
    } else {
        // Get all orders
        $stmt = $pdo->query('SELECT * FROM orders');
        $orders = $stmt->fetchAll();

        echo json_encode($orders);
    }
}

// Add a new order
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);

    // Basic validation
    if (!isset($json_obj->fullname) || !isset($json_obj->email) || !isset($json_obj->phone) || !isset($json_obj->book) || !isset($json_obj->description)) {
        http_response_code(400);
        echo json_encode(["message" => "Invalid input, missing parameters"]);
        exit;
    }

    // Add the new order
    $stmt = $pdo->prepare('INSERT INTO orders (fullname, email, phone, book, description) VALUES (?, ?, ?, ?, ?)');
    $stmt->execute([
        htmlspecialchars($json_obj->fullname),
        htmlspecialchars($json_obj->email),
        htmlspecialchars($json_obj->phone),
        htmlspecialchars($json_obj->book),
        htmlspecialchars($json_obj->description)
    ]);
    $newOrderId = $pdo->lastInsertId();

    echo json_encode(["message" => "Order added successfully", "order" => ["id" => $newOrderId, "fullname" => $json_obj->fullname, "email" => $json_obj->email, "phone" => $json_obj->phone, "book" => $json_obj->book, "description" => $json_obj->description]]);
}

// Delete an order
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);

    if (!isset($_DELETE['id'])) {
        http_response_code(400);
        echo json_encode(["message" => "Invalid input, missing order ID"]);
        exit;
    }

    $orderId = $_DELETE['id'];

    $stmt = $pdo->prepare('DELETE FROM orders WHERE ID = ?');
    $stmt->execute([$orderId]);

    echo json_encode(["message" => "Order deleted successfully", "order_id" => $orderId]);
}

// Update an existing order (Edit)
if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    parse_str(file_get_contents("php://input"), $_PUT);

    if (!isset($_PUT['id'])) {
        http_response_code(400);
        echo json_encode(["message" => "Invalid input, missing order ID"]);
        exit;
    }

    $orderId = $_PUT['id'];

    // Fetch the existing order
    $stmt = $pdo->prepare('SELECT * FROM orders WHERE ID = ?');
    $stmt->execute([$orderId]);
    $existingOrder = $stmt->fetch();

    if (!$existingOrder) {
        http_response_code(404);
        echo json_encode(["message" => "Order not found"]);
        exit;
    }

    // Update order fields if provided
    if (isset($_PUT['fullname'])) {
        $existingOrder['fullname'] = htmlspecialchars($_PUT['fullname']);
    }
    if (isset($_PUT['email'])) {
        $existingOrder['email'] = htmlspecialchars($_PUT['email']);
    }
    if (isset($_PUT['phone'])) {
        $existingOrder['phone'] = htmlspecialchars($_PUT['phone']);
    }
    if (isset($_PUT['book'])) {
        $existingOrder['book'] = htmlspecialchars($_PUT['book']);
    }
    if (isset($_PUT['description'])) {
        $existingOrder['description'] = htmlspecialchars($_PUT['description']);
    }

    // Update the order in the database
    $stmt = $pdo->prepare('UPDATE orders SET fullname = ?, email = ?, phone = ?, book = ?, description = ? WHERE ID = ?');
    $stmt->execute([$existingOrder['fullname'], $existingOrder['email'], $existingOrder['phone'], $existingOrder['book'], $existingOrder['description'], $orderId]);

    echo json_encode(["message" => "Order updated successfully", "order" => $existingOrder]);
}
