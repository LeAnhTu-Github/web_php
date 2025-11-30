<?php
include '../lib/session.php';
include '../classes/product.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    # code...
} else {
    header("Location:../index.php");
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $product = new product();
    if (isset($_POST['block'])) {
        $result = $product->block($_POST['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Khóa sản phẩm thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Khóa sản phẩm thất bại!");</script>';
        }
    } else if (isset($_POST['active'])) {
        $result = $product->active($_POST['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Kích hoạt sản phẩm thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Kích hoạt sản phẩm thất bại!");</script>';
        }
    } else {
        echo '<script type="text/javascript">alert("Có lỗi xảy ra!");</script>';
        die();
    }
}

$product = new product();
$list = $product->getAllAdmin((isset($_GET['page']) ? $_GET['page'] : 1));
$pageCount = $product->getCountPaging();
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
    <title>Danh sách sản phẩm</title>
</head>

<body>
    <nav>
        <img src="../images/logov2.png" style="margin-left: 20px; margin-top:16px;" alt="logo" width="50" height="50">
        <ul> 
            <li><a href="customerlist.php">Quản lý người dùng</a></li>
            <li><a href="reviewlist.php">Quản lý phản hồi</a></li>
            <li><a href="productlist.php" class="active">Quản lý sản phẩm</a></li>
            <li><a href="categoriesList.php">Danh mục sản phẩm</a></li>
            <li><a href="orderlist.php">Quản lý đơn hàng</a></li>
        </ul>
    </nav>
    <div class="title" style="margin-top: 80px;"> <!-- Adjusted margin-top to ensure the title is not hidden -->
        <div></div>
        <h1 >Danh sách sản phẩm</h1>
    </div>
    <div style="display:flex; align-items: flex-end; gap:30px; justify-content: space-between">
        <div class="addNew">
            <a href="add_product.php">Thêm mới</a>
        </div>
        <div style="width: 400px;">
            <form action="productlist.php" method="get" style="display: flex; gap:10px">
                <input style="height:40px ;margin:0; font-family: Mitr;" type="number" name="search" placeholder="Tìm kiếm theo mã sản phẩm">
                <input style="width:150px;height:40px ; margin-right: 30px; font-family: Mitr; background-color: #4299E1; " type="submit" value="Tìm kiếm">
            </form>
        </div>  
    </div>
    <div class="container">
        <?php $count = 1;
        if ($list) { ?>
            <table class="list">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Giá gốc</th>
                        <th>Giá khuyến mãi</th>
                        <th>Tạo bởi</th>
                        <th>Số lượng</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <?php foreach ($list as $key => $value) { ?>
                    <tbody>
                    <tr <?= $count % 2 == 0 ? 'style="background-color: #f3f3f3; color: #009879;"' : '' ?>>
                        <td><?= $count++ ?></td>
                        <td><?= $value['name'] ?></td>
                        <td><img class="image-cart" src="uploads/<?= $value['image'] ?>" alt=""></td>
                        <td><?= number_format($value['originalPrice'], 0, '', ',') ?> VND</td>
                        <td><?= number_format($value['promotionPrice'], 0, '', ',') ?> VND</td>
                        <td><?= $value['fullName'] ?></td>
                        <td><?= $value['qty'] ?></td>
                        <td><?= ($value['status']) ? "Hoạt động" : "Ngừng hoạt động" ?></td>
                        <td>
                            <a href="edit_product.php?id=<?= $value['id'] ?>">Xem/Sửa/Xoá</a>
                            <?php
                            if ($value['status']) { ?>
                                <form action="productlist.php" method="post">
                                    <input type="text" name="id" hidden value="<?= $value['id'] ?>" style="display: none;">
                                    <input type="submit" value="Khóa" name="block" id="btn-delete">
                                </form>
                            <?php } else { ?>
                                <form action="productlist.php" method="post">
                                    <input type="text" name="id" hidden value="<?= $value['id'] ?>" style="display: none;">
                                    <input type="submit" value="Mở" name="active" id="btn-delete">
                                </form>
                            <?php } ?>
                        </td>
                    </tr>
                    </tbody>
                <?php } ?>
            </table>
        <?php } else { ?>
            <h3>Chưa có sản phẩm nào...</h3>
        <?php } ?>
        <div class="pagination">
            <a href="productlist.php?page=<?= (isset($_GET['page'])) ? (($_GET['page'] <= 1) ? 1 : $_GET['page'] - 1) : 1 ?>">&laquo;</a>
            <?php
            for ($i = 1; $i <= $pageCount; $i++) {
                if (isset($_GET['page'])) {
                    if ($i == $_GET['page']) { ?>
                        <a class="active" href="productlist.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php } else { ?>
                        <a href="productlist.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php  }
                } else {
                    if ($i == 1) { ?>
                        <a class="active" href="productlist.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php  } else { ?>
                        <a href="productlist.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php   } ?>
                <?php  } ?>
            <?php }
            ?>
            <a href="productlist.php?page=<?= (isset($_GET['page'])) ? $_GET['page'] + 1 : 2 ?>">&raquo;</a>
        </div>
    </div>
    </div>
    <?php include '../inc/footer.php'; ?>
    
</body>

</html>