<?php
include '../lib/session.php';
include '../classes/user.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    # code...
} else {
    header("Location:../index.php");
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user = new user(); 
    if (isset($_POST['delete'])) {
        $result = $user->deleteUser($_POST['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Xóa người dùng thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Xóa người dùng thất bại!");</script>';
        }
    }
}
$user = new user();
$list = $user->getAllUsers();
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
    <title>Danh sách nguời dùng</title>
</head>

<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <img src="../images/logov2.png" style="margin-left: 20px; margin-top:16px;" alt="logo" width="50" height="50">
        <ul>
            <li><a href="customerlist.php" class="active">Quản lý Người dùng</a></li>
            <li><a href="reviewlist.php">Quản lý phản hồi</a></li>
            <li><a href="productlist.php">Quản lý Sản phẩm</a></li>
            <li><a href="categoriesList.php">Danh mục sản phẩm</a></li>
            <li><a href="orderlist.php">Quản lý Đơn hàng</a></li>
            <li><a href="logout.php">Đăng xuất</a></li>
        </ul>
    </nav>
    <div class="title" style="margin-top: 80px;"> <!-- Adjusted margin-top to ensure the title is not hidden -->
        <div></div>
        <h1 >Danh sách người dùng</h1>
    </div>
    <div class="container">
        <?php 
        if ($list) { ?>
            <table class="list">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên người dùng</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Ngày sinh</th>
                        <th>Địa chỉ</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <?php foreach ($list as $key => $value) { ?>
                    <tbody>
                    <tr>
                        <td><?= $value['id'] ?></td>
                        <td><?= $value['fullname']?></td>
                        <td><?= $value['email']?></td>
                        <td><?= $value['phone']?></td>
                        <td><?= $value['dob']?></td>
                        <td><?= $value['address']?></td>
                        <td class="action_user">
                            <a href="edit_product.php?id=<?= $value['id'] ?>">Xem/Sửa</a>
                            <form action="customerlist.php" method="post"s style="display:inline;">
                                <input type="hidden" name="id" hidden value="<?= $value['id'] ?>">
                                <input type="submit" value="Xóa" name="delete" id="btn-delete">
                            </form>
                        </td>
                    </tr>
                    </tbody>
                <?php } ?>
            </table>
        <?php } else { ?>
            <h3>Chưa có khách hàng nào...</h3>
        <?php } ?>
    </div>
    <div style="margin-top: 30px;"></div>
    </div>
    <?php include '../inc/footer.php'; ?>
</body>

</html>