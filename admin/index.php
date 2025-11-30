<?php
include '../lib/session.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    header("Location:productlist.php");
} else {
    header("Location:../index.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://use.fontawesome.com/2145adbb48.js"></script>
    <script src="https://kit.fontawesome.com/a42aeb5b72.js" crossorigin="anonymous"></script>
    <title>Admin</title>
</head>

<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <img src="../images/logov2.png" style="margin-left: 20px; margin-top:16px;" alt="logo" width="50" height="50">
        <ul>
            <li><a href="productlist.php" class="active">Quản lý Sản phẩm</a></li>
            <li><a href="orderlist.php" id="order">Quản lý Đơn hàng</a></li>
        </ul>
    </nav>
    <?php include '../inc/footer.php'; ?>
</body>

</html>