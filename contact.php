<?php
include 'classes/user.php';
include_once 'lib/session.php';
Session::checkSession('client');
include 'classes/contact.php';
$user = new user();
$contact = new contact(); 
// $userInfo = $user->get();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = Session::get('userId');
    $data = [
        'userId' => $id,
        'fullName' => $_POST['fullName'],
        'email' => $_POST['email'],
        'phone' => $_POST['phone'],
        'message' => $_POST['message']
    ];
    
    // if (trim($data['message']) == '') {
    //     echo '<script type="text/javascript">alert("Vui lòng nhập đúng thông tin."); window.location.href = "./contact.php";</script>';
    //     exit();
    // }
    $insert_result = $contact->insert($data); 
    if ($insert_result == true) { 
        echo '<script type="text/javascript">alert("Gửi phản hồi thành công."); window.location.href = "./contact.php";</script>';
    }else{
        echo '<script type="text/javascript">alert("Gửi phản hồi không thành công."); window.location.href = "./contact.php";</script>';
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
    <title>Liên hệ</title>
</head>

<body>
    <?php include './inc/header.php'; ?>
    <section class="banner"></section>
    <div class="featuredProducts">
        <h1>Liên hệ</h1>
    </div>
    <div class="container-single">
        <div class="login">
        <h2>Liên hệ với chúng tôi</h2>
        <form action="contact.php" method="post" class="form-login">
            <label for="fullName">Họ và tên</label>
            <input type="text" id="fullName" name="fullName" value="<?php echo isset($userInfo['fullname']) ? htmlspecialchars($userInfo['fullname']) : ''; ?>" placeholder="Họ và tên..." required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<?php echo isset($userInfo['email']) ? htmlspecialchars($userInfo['email']) : ''; ?>" placeholder="Email..." required>

            <label for="phone">Số điện thoại</label>
            <input type="tel" id="phone" name="phone" class="phone" value="<?php echo isset($userInfo['phone']) ? htmlspecialchars($userInfo['phone']) : ''; ?>" placeholder="Số điện thoại..." required>

            <label for="message">Tin nhắn</label>
            <textarea id="message" name="message" placeholder="Nội dung tin nhắn..." required></textarea>

            <input type="submit" value="Gửi">
        </form>
    </div>
        </div>
    </div>
    </div>
    <?php include './inc/footer.php'; ?>
</body>

</html>