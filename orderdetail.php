<?php
include_once 'lib/session.php';
Session::checkSession('client');
include_once 'classes/cart.php';
include_once 'classes/orderDetails.php';

$cart = new cart();
$orderDetails = new orderDetails();

$totalQty = $cart->getTotalQtyByUserId();
$result = $orderDetails->getOrderDetails($_GET['orderId']);
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
    <title>Order</title>
</head>

<body>
    <?php include './inc/header.php'; ?>
    <section class="banner"></section>
    <div class="featuredProducts">
        <h1>Chi tiết đơn hàng <?= $_GET['orderId'] ?></h1>
    </div>
    <div class="container_single">
        <table class="order">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên sản phẩm</th>
                    <th>Hình ảnh</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                </tr>
            </thead>
            <?php $count = 1;
            foreach ($result as $key => $value) { ?>
                <tbody>
                    <tr>
                        <td><?= $count++ ?></td>
                        <td><?= $value['productName'] ?></td>
                        <td><img class="image-cart" src="admin/uploads/<?= $value['productImage'] ?>" alt=""></td>
                        <td><?= number_format($value['productPrice'], 0, '', ',') ?>VND</td>
                        <td><?= $value['qty'] ?></td>
                    </tr>
                </tbody>
            <?php }
            ?>
        </table>

    </div>
    </div>
    <?php include './inc/footer.php'; ?>
</body>

</html>