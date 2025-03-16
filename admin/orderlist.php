<?php
include_once '../lib/session.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    # code...
} else {
    header("Location:../index.php");
}
include '../classes/order.php';

$order = new order();
$processingOrderList = $order->getProcessingOrder();
$processedOrderList = $order->getProcessedOrder();
$deliveringOrderList = $order->getDeliveringOrder();
$completeOrderList = $order->getCompleteOrder();
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
    <title>Quản lý đơn đặt hàng</title>
</head>

<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <img src="img/logo.png" alt="logo" width="140" height="70">
        <ul>
            <li><a href="customerlist.php">Quản lý Người dùng</a></li>
            <li><a href="reviewlist.php">Quản lý phản hồi</a></li>
            <li><a href="productlist.php">Quản lý Sản phẩm</a></li>
            <li><a href="categoriesList.php">Danh mục sản phẩm</a></li>
            <li><a href="orderlist.php" class="active">Quản lý Đơn hàng</a></li>
        </ul>
    </nav>
    
    <div class="title" style="margin-top: 80px;"> <!-- Adjusted margin-top to ensure the title is not hidden -->
        <div></div>    
        <h1 >Danh sách đơn đặt hàng</h1>
    </div>
    <div class="container">
        <!-- Tab links -->
        
        <div style="display:flex; align-items: flex-end; gap:30px; justify-content: space-between">
        <div class="tab">
            <button class="tablinks" onclick="openTab(event, 'Processing')">Đang xử lý</button>
            <button class="tablinks" onclick="openTab(event, 'Processed')">Đã xử lý</button>
            <button class="tablinks" onclick="openTab(event, 'Delivering')">Đang giao hàng</button>
            <button class="tablinks" onclick="openTab(event, 'Complete')">Đã hoàn thành</button>
        </div>
        <div style="width: 400px; margin:8px 0;">
            <form action="productlist.php" method="get" style="display: flex; gap:10px">
                <input style="height:40px ;margin:0; " type="number" name="search" placeholder="Tìm kiếm theo mã đơn hàng">
                <input style="width:150px;height:40px ; background-color: #4299E1; " type="submit" value="Tìm kiếm">
            </form>
        </div>  
    </div>
        <!-- Tab content -->
        <div id="Processing" class="tabcontent">
            <?php
            if ($processingOrderList) { ?>
                <table class="list">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã đơn hàng</th>
                        <th>Ngày đặt</th>
                        <th>Ngày giao</th>
                        <th>Tình trạng</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <?php $count = 1;
                    foreach ($processingOrderList as $key => $value) { ?>
                        <tbody>
                            <tr>
                            <td><?= $count++ ?></td>
                            <td><?= $value['id'] ?></td>
                            <td><?= $value['createdDate'] ?></td>
                            <td><?= ($value['status'] != "Processing") ? $value['receivedDate'] : "Dự kiến 3 ngày sau khi đơn hàng đã được xử lý" ?> <?=  ($value['status'] != "Complete" && $value['status'] != "Processing") ? "(Dự kiến)" : "" ?> </td>
                            <td><?= $value['status'] ?></td>
                            <td>
                                <a href="orderlistdetail.php?orderId=<?= $value['id'] ?>">Chi tiết</a>
                            </td>
                        </tr></tbody>
                    <?php }
                    ?>
                </table>
            <?php } else { ?>
                <h3>Chưa có đơn hàng nào đang xử lý</h3>
            <?php }
            ?>
        </div>

        <div id="Processed" class="tabcontent">
            <?php
            if ($processedOrderList) { ?>
                <table class="list">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã đơn hàng</th>
                        <th>Ngày đặt</th>
                        <th>Ngày giao</th>
                        <th>Tình trạng</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <?php $count = 1;
                    foreach ($processedOrderList as $key => $value) { ?>
                        <tbody>
                        <tr>
                            <td><?= $count++ ?></td>
                            <td><?= $value['id'] ?></td>
                            <td><?= $value['createdDate'] ?></td>
                            <td><?= ($value['status'] != "Processing") ? $value['receivedDate'] : "Dự kiến 3 ngày sau khi đơn hàng đã được xử lý" ?> <?=  ($value['status'] != "Complete" && $value['status'] != "Processing") ? "(Dự kiến)" : "" ?> </td>
                            <td><?= $value['status'] ?></td>
                            <td>
                                <a href="delivering_order.php?orderId=<?= $value['id'] ?>">Giao hàng</a>
                            </td>
                        </tr>
                        </tbody>
                    <?php }
                    ?>
                </table>
            <?php } else { ?>
                <h3>Chưa có đơn hàng nào đã xử lý</h3>
            <?php }
            ?>
        </div>

        <div id="Delivering" class="tabcontent">
            <?php
            if ($deliveringOrderList) { ?>
                <table class="list">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã đơn hàng</th>
                        <th>Ngày đặt</th>
                        <th>Ngày nhận</th>
                        <th>Tình trạng</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <?php $count = 1;
                    foreach ($deliveringOrderList as $key => $value) { ?>
                        <tbody>
                        <tr>
                            <td><?= $count++ ?></td>
                            <td><?= $value['id'] ?></td>
                            <td><?= $value['createdDate'] ?></td>
                            <td><?= ($value['status'] != "Processing") ? $value['receivedDate'] : "Dự kiến 3 ngày sau khi đơn hàng đã được xử lý" ?> <?=  ($value['status'] != "Complete" && $value['status'] != "Processing") ? "(Dự kiến)" : "" ?> </td>
                            <td><?= $value['status'] ?></td>
                            <td>
                                <a href="orderlistdetail.php?orderId=<?= $value['id'] ?>">Chi tiết</a>
                            </td>
                        </tr>
                        </tbody>
                    <?php }
                    ?>
                </table>
            <?php } else { ?>
                <h3>Chưa có đơn hàng nào đang giao</h3>
            <?php }
            ?>
        </div>

        <div id="Complete" class="tabcontent">
            <?php
            if ($completeOrderList) { ?>
                <table class="list">
                   <thead>
                   <tr>
                        <th>STT</th>
                        <th>Mã đơn hàng</th>
                        <th>Ngày đặt</th>
                        <th>Ngày nhận</th>
                        <th>Tình trạng</th>
                        <th>Thao tác</th>
                    </tr>
                   </thead>
                    <?php $count = 1;
                    foreach ($completeOrderList as $key => $value) { ?>
                        <tbody>
                        <tr>
                            <td><?= $count++ ?></td>
                            <td><?= $value['id'] ?></td>
                            <td><?= $value['createdDate'] ?></td>
                            <td><?= ($value['status'] != "Processing") ? $value['receivedDate'] : "Dự kiến 3 ngày sau khi đơn hàng đã được xử lý" ?> <?=  ($value['status'] != "Complete" && $value['status'] != "Processing") ? "(Dự kiến)" : "" ?> </td>
                            <td><?= $value['status'] ?></td>
                            <td>
                                <a href="orderlistdetail.php?orderId=<?= $value['id'] ?>">Chi tiết</a>
                            </td>
                        </tr>
                        </tbody>
                    <?php }
                    ?>
                </table>
            <?php } else { ?>
                <h3>Chưa có đơn hàng nào đã hoàn thành</h3>
            <?php }
            ?>
        </div>
    </div>
    </div>
    
    <?php include '../inc/footer.php'; ?>
</body>
<script type="text/javascript">
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 1; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;

        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        document.getElementById(tabName).style.display = "block";
    }
</script>

</html>