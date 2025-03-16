<?php
include 'classes/user.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user = new user();
    $_POST['fullName'] = trim($_POST['fullName']);
    $_POST['email'] = trim($_POST['email']);
    $_POST['password'] = trim($_POST['password']);
    $_POST['repassword'] = trim($_POST['repassword']);
    $_POST['phone'] = trim($_POST['phone']);
    $_POST['address'] = trim($_POST['address']);
    $_POST['dob'] = trim($_POST['dob']);
    if(trim($_POST['fullName']) == "" ||trim($_POST['address']) == "" ){
        echo "<script>alert('Vui lòng nhập đầy đủ thông tin.');</script>";
    }
    if (strlen($_POST['phone']) < 9) {
        echo "<script>alert('Vui lòng nhập tối thiểu 9 kí tự.');</script>";
    } else {
        $result = $user->insert($_POST);
    }
    if ($result == true) {
        $userId = $user->getLastUserId(); 
        echo '<script type="text/javascript">alert("Đăng ký thành công! Vui lòng đăng nhập."); window.location.href = "./login.php";</script>';
    }
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
    <title>Đăng ký</title>
</head>

<body>
    <?php include './inc/header.php'; ?>
    <section class="banner"></section>
    <div class="featuredProducts">
        <h1>Đăng ký</h1>
    </div>
    <div class="container-single">
        <div class="login">
            <h2 style="margin-bottom: 20px;">Để lại thông tin để đăng ký</h2>
            <form action="register.php" method="post" class="form-login">
                <label for="fullName">Họ tên</label>
                <input type="text" id="fullName" name="fullName" placeholder="Họ tên..." required>

                <label for="email">Email</label>
                <p class="error"><?= !empty($result) ? $result : '' ?></p>
                <input type="email" id="email" name="email" placeholder="Email..." required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">

                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Mật khẩu..." required>

                <label for="repassword">Nhập lại mật khẩu</label>
                <input type="password" id="repassword" name="repassword" required placeholder="Nhập lại mật khẩu..." oninput="check(this)">

                <label for="phone">Số điện thoại</label>
                <input type="tel" id="phone" name="phone" class="phone" placeholder="Số điện thoại..." required>

                <label for="address">Địa chỉ</label>
                <input type="text" id="address" name="address" placeholder="Địa chỉ..." required>

                <label for="dob">Ngày sinh</label>
                <input type="date" name="dob" id="dob" required>

                <div style="display: flex; padding-bottom: 10px; padding-top:20px; ">
                    <p>bạn đã có tài khoản?</p>
                    <a style="margin-left: 10px;" href="login.php">Đăng nhập</a>
                </div>
                <input type="submit" value="Đăng ký" name="submit">
            </form>
        </div>
    </div>
    </div>
    <?php include './inc/footer.php'; ?>
</body>
<script language='javascript' type='text/javascript'>
    function check(input) {
        if (input.value != document.getElementById('password').value) {
            input.setCustomValidity('Mật khẩu không trùng khớp.');
        }else{
            input.setCustomValidity('');
        }
    }
</script>
</html>