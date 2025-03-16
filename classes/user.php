<?php
$filepath = realpath(dirname(__FILE__));
include_once($filepath . '/../lib/session.php');
include_once($filepath . '/../lib/database.php');

?>

<?php
class user
{
	private $db;
	public function __construct()
	{
		$this->db = new Database();
	}

	public function login($email, $password, $phone)
	{
		$query = "SELECT * FROM users WHERE email = '$email' AND password = '$password' AND phone='$phone' LIMIT 1 ";
		$result = $this->db->select($query);
		if ($result) {
			$value = $result->fetch_assoc();
			Session::set('user', true);
			Session::set('userId', $value['id']);
			Session::set('role_id', $value['role_id']);
			if ($value['role_id'] == 1) {
				header("Location:admin/index.php");
			} else {
				header("Location:index.php");
			}
		} else {
			$alert = "Tên đăng nhập hoặc mật khẩu không đúng!";
			return $alert;
		}
	}

	public function insert($data)
    {
        $fullName = $data['fullName'];
        $email = $data['email'];
        $dob = $data['dob'];
        $address = $data['address'];
		$phone = $data['phone'];
        $password = md5($data['password']);

        $check_email = "SELECT * FROM users WHERE email='$email' LIMIT 1";
        $result_check = $this->db->select($check_email);
        if ($result_check) {
            return 'Email đã tồn tại!';
        } else {
            $query = "INSERT INTO users VALUES (NULL,'$email','$fullName','$dob','$password',2,1,'$address','$phone') ";
            $result = $this->db->insert($query);
            if ($result) {
                return true; 
            } else {
                return false; 
            }
        }
	}

	public function get()
	{
		$userId = Session::get('userId');
		$query = "SELECT * FROM users WHERE id = '$userId' LIMIT 1";
		$mysqli_result = $this->db->select($query);
		if ($mysqli_result) {
			$result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC)[0];
			return $result;
		}
		return false;
	}

	public function getLastUserId()
	{
		$query = "SELECT * FROM users ORDER BY id DESC LIMIT 1";
		$mysqli_result = $this->db->select($query);
		if ($mysqli_result) {
			$result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC)[0];
			return $result;
		}
		return false;
	}

	public function getAllUsers()
    {
        $query =
            "SELECT * FROM users WHERE role_id !=1
			 ORDER BY users.id DESC";
        $result = $this->db->select($query);
        return $result;
    }
	public function deleteUser($id)
    {
        $query = "DELETE FROM users WHERE id = '$id'";
        $result = $this->db->delete($query); // Giả sử bạn có phương thức delete trong lớp Database
        return $result;
    }

	public function update($data, $mail)
	{
		$userId = Session::get('userId'); // Lấy ID người dùng từ session
		$fullName = $data['fullName'];
		$email = $mail;
		$dob = $data['dob'];
		$address = $data['address'];
		$phone = $data['phone'];

		$query = "UPDATE users SET fullname='$fullName', email='$email', dob='$dob', address='$address', phone='$phone' WHERE id='$userId'";
		$result = $this->db->update($query); // Giả sử bạn có phương thức update trong lớp Database
		return $result;
	}

	public function changePassword($oldPassword, $newPassword, $confirmPassword)
	{
		$userId = Session::get('userId');
		// Kiểm tra mật khẩu cũ
		$query = "SELECT * FROM users WHERE id = '$userId' LIMIT 1";
		$result = $this->db->select($query);
		if ($result) {
			$value = $result->fetch_assoc();
			// Hash the old password before comparison
			if (md5($oldPassword) != $value['password']) {
				return "Mật khẩu cũ không đúng!".md5($oldPassword);
			}
			if (md5($oldPassword) == $value['password']) {
				return "Mật khẩu mới không được trùng với mật khẩu cũ!";
			}
			// Kiểm tra mật khẩu mới và xác nhận mật khẩu
			if ($newPassword !== $confirmPassword) {
				return "Mật khẩu mới và xác nhận mật khẩu không trùng khớp!";
			}
			// Cập nhật mật khẩu mới
			$newPasswordHashed = md5($newPassword);
			$updateQuery = "UPDATE users SET password='$newPasswordHashed' WHERE id='$userId'";
			$this->db->update($updateQuery);
			return "Đổi mật khẩu thành công!";
		}
		return "Có lỗi xảy ra!";
	}
}
?>