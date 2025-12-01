<?php
include '../lib/session.php';
include '../classes/categories.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
        $category = new categories();
        $result = $category->insert($_POST['name']);
    }
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
    <title>Thêm mới danh mục</title>
</head>

<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <img src="../images/logov2.png" style="margin-left: 20px; margin-top:16px;" alt="logo" width="50" height="50">
        <ul>
            <li><a href="customerlist.php">Quản lý người dùng</a></li>
            <li><a href="reviewlist.php">Quản lý phản hồi</a></li>
            <li><a href="productlist.php">Quản lý sản phẩm</a></li>
            <li><a href="categoriesList.php" class="active">Danh mục sản phẩm</a></li>
            <li><a href="orderlist.php">Quản lý đơn hàng</a></li>
            <li><a href="logout.php">Đăng xuất</a></li>
        </ul>
    </nav>
    <div class="title" style="margin-top: 80px;"> <!-- Adjusted margin-top to ensure the title is not hidden -->
        <div></div>
        <h1>Thêm mới danh mục</h1>
    </div>
    <div class="container">
        <p style="color: green;"><?= !empty($result) ? $result : '' ?></p>
        <div class="form-add">
            <form action="add_category.php" method="post">
                <label for="name">Tên danh mục</label>
                <input type="text" id="name" name="name" placeholder="Tên danh mục.." required>

                <div style="display: flex; width:100%; height:40px; gap: 20px !important; margin-bottom:30px;">
                    <input type="submit" value="Lưu" name="submit" style="background-color: #4299E1;" >
                </div>
            </form>
        </div>
    </div>
    </div>
    <?php include '../inc/footer.php'; ?>
</body>

</html>