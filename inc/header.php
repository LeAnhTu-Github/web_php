
<nav>
    <img src="images/logo.png" alt="logo" width="140" height="70">
    <ul>
        <li><a href="index.php" class="active">Trang chủ</a></li>
        <li><a href="productList.php">Sản phẩm</a></li>
        <li><a href="contact.php">Liên hệ</a></li>
        <li><a href="order.php" id="order">Đơn hàng</a></li>
        <?php
        if (isset($_SESSION['user']) && $_SESSION['user']) { ?>
            <li><a href="account.php" id="order">Tài khoản</a></li>
            <li><a href="logout.php" id="signin">Đăng xuất</a></li>
        <?php } else { ?>
            <li><a href="login.php" id="signin">Đăng nhập</a></li>
            <li><a href="register.php" id="signup">Đăng ký</a></li>
        <?php } ?>
       
        <li>
            <a href="checkout.php">
                <i class="fa fa-shopping-bag"></i>
                <span class="sumItem">
                    <?= ($totalQty['total']) ? $totalQty['total'] : "0" ?>
                </span>
            </a>
        </li>
    </ul>
</nav>
