<?php
$host = getenv('MYSQL_HOST');
$port = getenv('MYSQL_PORT');
$user = getenv('MYSQL_USER');
$password = getenv('MYSQL_PASSWORD');

$pdo = new PDO("mysql:host=$host;port=$port", $user, $password);
$stmt = $pdo->query('SHOW DATABASES');
$databases = $stmt->fetchAll(PDO::FETCH_COLUMN);
echo json_encode($databases);
phpinfo();