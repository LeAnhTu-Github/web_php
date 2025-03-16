<?php
include_once 'classes/user.php';
include_once 'lib/session.php';
Session::checkSession('client');
include 'classes/contact.php';
$user = new user();

$userId = Session::get('userId');
$userInfo = $user->get($userId);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $oldPassword = trim($_POST['oldPass']);
    $newPassword = trim($_POST['newPass']);
    $confirmPassword = trim($_POST['confirmPass']);

    if (empty($oldPassword) || empty($newPassword) || empty($confirmPassword)) {
        echo "<script>alert('Vui lòng nhập đầy đủ thông tin.');</script>";
    } else {
        $result = $user->changePassword($oldPassword, $newPassword, $confirmPassword);
        echo "<script>alert('$result');</script>";
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
    
    <script src="https://use.fontawesome.com/2145adbb48.js"></script>
    <script src="https://kit.fontawesome.com/a42aeb5b72.js" crossorigin="anonymous"></script>
    <title>Đổi mật khẩu</title>
    <style>
        .form_direc{
            display: flex;
            gap: 30px;
            padding-top: 20px;
            padding-left: 100px;
        }
        .form_direc .btn_change,  .form_direc .btn_pass{
            width: 120px;
            height: 40px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #3994e0;
        }
        .form_direc a{
            color: #fff !important;
        }
        .form_direc a:hover{
            background-color: #0d5b9d;
        }
        .form_direc .btn_change:hover,  .form_direc .btn_pass:hover{
            background-color: #0d5b9d;
        }
    </style>
</head>

<body>
    <?php include './inc/header.php'; ?>
    <section class="banner"></section>
    <div class="featuredProducts">
        <h1>Đổi mật khẩu</h1>
    </div>
    <div class="form_direc">
            <div class="btn_change">
                <a href="./account.php">Xem/Sửa</a>
            </div>
            <div class="btn_pass">
                <a href="./change_pass.php">Đổi mật khẩu</a>
            </div>
        </div>
    <div class="container-single">
        <div class="login">
        <h2 style="margin-bottom: 20px;">Đổi mật khẩu tại đây</h2>
        <form action="change_pass.php" method="post" class="form-login" style="display: flex; flex-direction:column;" >
            <label for="oldPass">Mật khẩu cũ</label>
            <input type="password" id="oldPass" name="oldPass" placeholder="Mật khẩu cũ..." required>

            <label for="newPass">Mật khẩu mới</label>
            <input type="password" id="newPass" name="newPass" placeholder="Mật khẩu mới..." required>

            <label for="confirmPass">Xác thực mật khẩu</label>
            <input type="password" id="confirmPass" name="confirmPass" placeholder="Xác thực mật khẩu..." required>

            <input type="submit" value="Thay đổi">
        </form>
    </div>
        </div>
    </div>
    </div>
    <?php include './inc/footer.php'; ?>
</body>

</html>