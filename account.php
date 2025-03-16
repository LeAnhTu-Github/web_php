<?php
include 'classes/user.php';
include_once 'lib/session.php';
Session::checkSession('client');
include 'classes/contact.php';
$user = new user();

$userId = Session::get('userId');
$userInfo = $user->get($userId);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $updateResult = $user->update($_POST, $userInfo["email"]); // Gọi phương thức update với dữ liệu từ form
    if ($updateResult) {
        echo "<script>alert('Cập nhật thông tin thành công!');</script>";
    } else {
        echo "<script>alert('Cập nhật thông tin thất bại!');</script>";
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
    <title>Tài khoản</title>
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
        <h1>Tài khoản</h1>
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
        <h2 style="margin-bottom: 20px;">Cập nhật thông tin cá nhân tại đây</h2>
        <form action="account.php" method="post" class="form-login" style="display: flex; flex-direction:column;" >
            <label for="fullName">Họ và tên</label>
            <input type="text" id="fullName" name="fullName" placeholder="Họ và tên..." value="<?php echo $userInfo['fullname']; ?>" required>

            <label for="phone">Số điện thoại</label>
            <input type="tel" id="phone" name="phone" class="phone" placeholder="Số điện thoại..." value="<?php echo $userInfo['phone']; ?>" required>

            <div>
                <label for="dob">Ngày sinh</label>
                <input type="date" name="dob" id="dob" value="<?php echo $userInfo['dob']; ?>" required>
            </div>

            <label for="address" style="margin-top: 10px;">Địa chỉ</label>
            <textarea name="address" id="address" cols="30" rows="5" required><?php echo $userInfo['address']; ?></textarea>

            

            <input type="submit" value="Cập nhật">
        </form>
    </div>
        </div>
    </div>
    </div>
    <?php include './inc/footer.php'; ?>
</body>

</html>