<?php
include_once 'lib/session.php';
include_once 'classes/product.php';
include_once 'classes/categories.php';
include_once 'classes/cart.php';

$cart = new cart();
$totalQty = $cart->getTotalQtyByUserId();

$product = new product();
// Tìm kiếm theo tên
$searchTerm = isset($_GET['search']) ? $_GET['search'] : '';
$cateId = isset($_GET['cateId']) ? $_GET['cateId'] : null; // Lấy cateId từ GET

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1; // Đảm bảo biến $page được khởi tạo đúng

if ($searchTerm) {
    $list = $product->searchProductsByName($searchTerm, $page); // Sử dụng biến $page
} elseif ($cateId) {
    $sort = isset($_GET['sort']) ? $_GET['sort'] : 'asc'; // Lấy tham số sắp xếp từ GET
    $list = $product->getProductsByCateId($page, $cateId, 8, $sort); // Sử dụng biến $page
} else {
    $sort = isset($_GET['sort']) ? $_GET['sort'] : 'asc'; // Lấy tham số sắp xếp từ GET
    $list = $product->getAll($page, 8, $sort); // Sử dụng biến $page
}
// Phân trang
$pageCount = $product->getCountPaging(8); // Đảm bảo số trang được tính đúng

$categories = new categories();
$categoriesList = $categories->getAll();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://use.fontawesome.com/2145adbb48.js"></script>
    <script src="https://kit.fontawesome.com/a42aeb5b72.js" crossorigin="anonymous"></script>
    <title>Danh sách sản phẩm</title>
    <style>
        .box_search{
            width: 100%;
            height: auto;
            display: flex;
            padding: 0 120px;
            margin-top: 20px;
            gap:20px;
            justify-content: space-between;
        }
        .search{
            width: 100%;
            display: flex;
            
            padding-bottom: 12px;
        }
        .search form{
            display: flex; 
            align-items: flex-end;
            gap:10px;
        }
        .search input{
            width: 200px;
        }
        .search input[type=submit]{
            margin: 0 !important;
        }

        .container-main{
            display: flex;
        }
        .left-menu {
            width: 300px;
            height: 100%; /* Độ rộng của menu bên trái */
            float: left; /* Đặt menu bên trái */
            margin-right: 20px; /* Khoảng cách bên phải */
            background-color: white;
            padding: 15px;
            margin-top: 30px;
            border-radius: 10px;
        }
        .container-x {
            overflow: hidden; /* Để chứa các phần tử con */
        }
        .title{
            
            padding: 10px 0;
            display: flex;
            align-items: center;
            }
            .title div{
            width: 10px;
            height: 25px;
            background-color: #4299E1;
            border-radius: 3px;
            margin-right: 10px;
            }
        .category {
            width: 100%;
        }
        .category ul{
            width: 100%;
        }
        .category .cate_item{
            margin: 10px 0;
            padding: 5px;
            color: black;
        }
        .category .cate_item:hover{
            background: rgb(240, 234, 234);
        }
        
        
    </style>
</head>

<body>
    <?php include './inc/header.php'; ?>
    <section class="banner"></section>
    <div class="featuredProducts">
        <h1>Danh sách sản phẩm</h1>
    </div>
    <div class="container-main">
        <div class="container-x">
                <div class="left-menu">
                <div class="title" style="margin-top: 10px;"> <!-- Adjusted margin-top to ensure the title is not hidden -->
                    <div></div>
                    <h3 >Tìm kiếm theo tên</h3>
                </div>
                    <div class="search">
                        <form action="productList.php" method="get" style=" width: 100%;display: flex; flex-direction:column; align-items:flex-start" >
                            <input style="height:40px ;margin:0; font-family: Mitr; width: 100%;" type="text" name="search" placeholder="Tên sản phẩm...">
                            <input style="width:120px;height:40px ; margin-right: 30px; font-family: Mitr; background-color: #4299E1; " type="submit" value="Tìm kiếm">
                        </form>
                    </div>  

                    <div class="title" style="margin-top: 10px;"> <!-- Adjusted margin-top to ensure the title is not hidden -->
                    <div></div>
                    <h3 >Tìm kiếm theo danh mục</h3>
                    </div>
                    <div class="category">
                        <ul>
                            <?php foreach ($categoriesList as $key => $value) { ?>
                                <li class="cate_item">
                                    <a href="productList.php?cateId=<?= $value['id'] ?>" 
                                       <?= ($value['id'] == $_GET['cateId']) ? 'class="active"' : '' ?>>
                                       <?= $value['name'] ?>
                                    </a>
                                </li>
                            <?php } ?>
                        </ul>
                    </div>
                    <div class="title" style="margin-top: 10px;"> <!-- Adjusted margin-top to ensure the title is not hidden -->
                    <div></div>
                    <h3 >Sắp xếp</h3>
                    </div>
                    <div class="sort_price">
                        <select onchange="location = this.value;">
                            <option value="productList.php?sort=asc">Giá từ nhỏ đến lớn</option>
                            <option value="productList.php?sort=desc">Giá từ lớn đến nhỏ</option>
                        </select>
                    </div>
                    
                </div>
        </div>
        <div class="container">
        <?php if ($list) {
            foreach ($list as $key => $value) { ?>
                <div class="card">
                    <div class="imgBx">
                        <a href="detail.php?id=<?= $value['id'] ?>"><img src="admin/uploads/<?= $value['image'] ?>" alt=""></a>
                    </div>
                    <div class="content">
                        <div>
                        <div class="productName">
                            <a href="detail.php?id=<?= $value['id'] ?>">
                                <h3><?= $value['name'] ?></h3>
                            </a>
                        </div>
                        <div>
                            Đã bán: <?= $value['soldCount'] ?>
                        </div>
                        <div class="original-price">
                            <?php
                            if ($value['promotionPrice'] < $value['originalPrice']) { ?>
                                Giá gốc: <del><?= number_format($value['originalPrice'], 0, '', ',') ?>VND</del>
                            <?php } else { ?>
                                <p>.</p>
                            <?php } ?>
                        </div>
                        <div class="price">
                            Giá bán: <?= number_format($value['promotionPrice'], 0, '', ',') ?>VND
                        </div>
                        </div>
                        <div class="action">
                            <a class="add-cart" href="add_cart.php?id=<?= $value['id'] ?>">Thêm vào giỏ</a>
                            <a class="detail" href="detail.php?id=<?= $value['id'] ?>">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            <?php }
        } else { ?>
            <h3>Không có sản phẩm nào...</h3>
        <?php  }
        ?>
    </div>
            </div>
    
    <div class="pagination">
        <a href="productList.php?page=<?= (isset($_GET['page'])) ? (($_GET['page'] <= 1) ? 1 : $_GET['page'] - 1) : 1 ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : '' ?>">&laquo;</a>
        <?php
        for ($i = 1; $i <= $pageCount; $i++) {
            if (isset($_GET['page'])) {
                if ($i == $_GET['page']) { ?>
                    <a class="active" href="productList.php?page=<?= $i ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : '' ?>"><?= $i ?></a>
                <?php } else { ?>
                    <a href="productList.php?page=<?= $i ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : '' ?>"><?= $i ?></a>
                <?php  }
            } else { ?>
                <a href="productList.php?page=<?= $i ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : '' ?>"><?= $i ?></a>
            <?php  }
        }
        ?>
        <a href="productList.php?page=<?= (isset($_GET['page'])) ? $_GET['page'] + 1 : 2 ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : '' ?>">&raquo;</a>
    </div>
    <?php include './inc/footer.php'; ?>
</body>

</html>