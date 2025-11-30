<?php
include '../lib/session.php';
include '../classes/product.php';
include '../classes/categories.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    $product = new product();
    $productUpdate = mysqli_fetch_assoc($product->getProductbyIdAdmin($_GET['id']));
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
        $result = $product->update($_POST, $_FILES);
        $productUpdate = mysqli_fetch_assoc($product->getProductbyIdAdmin($_GET['id']));
    }
} else {
    header("Location:../index.php");
}

$category = new categories();
$categoriesList = $category->getAll();
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
    <title>Chỉnh sửa sản phẩm</title>
</head>

<body>
    <nav>
        <img src="../images/logov2.png" style="margin-left: 20px; margin-top:16px;" alt="logo" width="50" height="50">
        <ul>
        <ul>
            <li><a href="customerlist.php">Quản lý người dùng</a></li>
            <li><a href="reviewlist.php">Quản lý phản hồi</a></li>
            <li><a href="productlist.php" class="active">Quản lý sản phẩm</a></li>
            <li><a href="categoriesList.php">Danh mục sản phẩm</a></li>
            <li><a href="orderlist.php">Quản lý đơn hàng</a></li>
        </ul>
        </ul>
    </nav>
    <div class="title">
        <h1>Chỉnh sửa sản phẩm</h1>
    </div>
    <div class="container">
        <?php
        if (isset($result)) {
            echo $result;
        }
        ?>
        <div class="form-add">
            <form action="edit_product.php?id=<?= $productUpdate['id'] ?>" method="post" enctype="multipart/form-data">
                <input type="text" hidden name="id" style="display: none;" value="<?= $productUpdate['id'] ?>">
                <label for="name">Tên sản phẩm</label>
                <input type="text" id="name" name="name" placeholder="Tên sản phẩm.." value="<?= $productUpdate['name'] ?>">

                <label for="originalPrice">Giá gốc</label>
                <input type="number" id="originalPrice" name="originalPrice" value="<?= $productUpdate['originalPrice'] ?>">

                <label for="promotionPrice">Giá khuyến mãi</label>
                <input type="number" id="promotionPrice" name="promotionPrice" value="<?= $productUpdate['promotionPrice'] ?>">

                <label for="image">Hình ảnh</label>
                <img src="uploads/<?= $productUpdate['image'] ?>" style="height: 200px;" id="image"> <br>

                <label for="imageNew">Chọn hình ảnh mới</label>
                <input type="file" id="imageNew" name="image">

                <label for="cateId">Loại sản phẩm</label>
                <select id="cateId" name="cateId">
                    <?php foreach ($categoriesList as $key => $value) {
                        if ($value['id'] == $productUpdate['cateId']) { ?>
                            <option selected value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                        <?php  } else { ?>
                            <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                        <?php   } ?>
                    <?php } ?>
                </select>

                <label for="qty">Số lượng</label>
                <input type="number" id="qty" name="qty" value="<?= $productUpdate['qty'] ?>">

                <label for="des">Mô tả</label>
                <textarea name="des" id="des" cols="30" rows="10"><?= $productUpdate['des'] ?></textarea>

                <div style="display: flex; width:100%; height:40px; gap: 20px !important;">
                    <input type="submit" value="Lưu" name="submit" style="background-color: #4299E1;" >
                    <input type="submit" value="Xoá" name="delete" >
                </div>
            </form>
        </div>
    </div>
    </div>
    
    <?php include '../inc/footer.php'; ?>
</body>

</html>