<?php
include '../lib/session.php';
include '../classes/contact.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    # code...
} else {
    header("Location:../index.php");
}

if (isset($_POST['response'])) {
    $contact = new contact();
    $updateSuccess = $contact->updateStatus($_POST['id']); // Lưu kết quả cập nhật
    if ($updateSuccess) {
        echo '<script type="text/javascript">alert("Đã phản hồi thành công!");</script>';
    } else {
        echo '<script type="text/javascript">alert("Cập nhật không thành công!");</script>'; // Thông báo nếu không thành công
    }
    
}
$contact = new contact();
$list = $contact->getAllContact();
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
    <title>Danh sách phản hồi</title>
</head>
<body>
    <nav>
        <img src="../images/logov2.png" style="margin-left: 20px; margin-top:16px;" alt="logo" width="50" height="50">
        <ul>
            <li><a href="customerlist.php">Quản lý Người dùng</a></li>
            <li><a href="reviewlist.php" class="active">Quản lý phản hồi</a></li>
            <li><a href="productlist.php">Quản lý Sản phẩm</a></li>
            <li><a href="categoriesList.php">Danh mục sản phẩm</a></li>
            <li><a href="orderlist.php">Quản lý Đơn hàng</a></li>
            <li><a href="logout.php">Đăng xuất</a></li>
        </ul>
    </nav>
    <div class="title" style="margin-top: 80px;"> <!-- Adjusted margin-top to ensure the title is not hidden -->
        <div></div>
        <h1 >Danh sách phản hồi</h1>
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
                        <th>Nội dung</th>
                        <th>Thời gian</th>
                        <th>Trạng thái</th>
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
                        <td><?= $value['message']?></td>
                        <td><?= $value['created_at']?></td>
                        <td><?= $value['status'] == 1 ? 'Đã phản hồi' : 'Chưa phản hồi' ?></td>
                        <td class="action_user">
                            <form action="reviewlist.php" method="post"s style="display:inline;">
                                <input type="hidden" name="id" hidden value="<?= $value['id'] ?>">
                                <?php if($value['status'] == 1): ?>
                                    <input type="submit" value="Xem" name="view" id="btn-view">
                                <?php else: ?>
                                    <input type="submit" value="Phản hồi" name="response" id="btn-res">
                                <?php endif; ?>
                            </form>
                        </td>
                    </tr>
                    </tbody>
                <?php } ?>
            </table>
        <?php } else { ?>
            <h3>Chưa có phản hồi nào...</h3>
        <?php } ?>
    </div>
    <div style="margin-top: 30px;"></div>
    </div>
    <?php include '../inc/footer.php'; ?>
</body>

</html>