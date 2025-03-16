<?php
include 'classes/user.php';
$user = new user();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = trim($_POST['email']);
    $password = md5(trim($_POST['password']));
    $phone = trim($_POST['tel']);
    if (empty($email) || empty($password) || empty($phone)) {
        echo "<script>alert('Vui lòng nhập đầy đủ thông tin.');</script>";
    } 
    if (strlen($phone) < 8) {
        echo "<script>alert('Số điện thoại phải có ít nhất 8 kí tự.');</script>";
    }
    $login_check = $user->login($email, $password, $phone);

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
    <title>Đăng nhập</title>
</head>

<body>
    <?php include './inc/header.php'; ?>
    <section class="banner"></section>
    <div class="featuredProducts">
        <h1>Đăng nhập</h1>
    </div>
    <div class="container-single">
        <div class="login">
        <h2 style="margin-bottom: 20px;">Để lại thông tin để đăng nhập</h2>
            <form action="login.php" method="post" class="form-login">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Email..." required>

                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Mật khẩu..." required>
                <label for="tel">Số điện thoai:</label>
                <input type="text" id="tel" name="tel" placeholder="Số điện thoại..." required>
                <p style="color: red;"><?= !empty($login_check) ? $login_check : '' ?></p>
                <div style="display: flex; padding-bottom: 10px; padding-top:20px;">
                    <p>bạn chưa có tài khoản?</p>
                    <a style="margin-left: 10px;" href="register.php">Đăng ký</a>
                </div>
                <input type="submit" value="Đăng nhập">
            </form>
        </div>
    </div>
    </div>
    <?php include './inc/footer.php'; ?>
</body>

</html>