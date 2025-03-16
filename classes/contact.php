<?php
$filepath = realpath(dirname(__FILE__));
include_once($filepath . '/../lib/database.php');
include_once($filepath . '/../lib/session.php');
include_once($filepath . '/../classes/product.php');
?>
<?php
class contact{
    private $db;
	public function __construct()
	{
		$this->db = new Database();
	}
    public function insert($data)
    {
        $userId = $data['userId'];
        $fullName = $data['fullName'];
        $email = $data['email'];
		$phone = $data['phone'];
        $message = $data['message'];
        $date = date('Y-m-d H:i:s');

        // Kiểm tra nếu message chứa nhiều phím space
        

        $query = "INSERT INTO contacts VALUES (null,'$userId','$fullName','$email','$phone','$message','$date', 0) ";
            $result = $this->db->insert($query);
            if ($result) {
                return true; 
            } else {
                return false; 
            }
        }
    public function getAllContact()
    {
        $query ="SELECT users.fullname, users.email, users.phone, contacts.* FROM contacts
                JOIN users ON contacts.userId = users.id WHERE contacts.userId IS NOT NULL;";
        $result = $this->db->select($query);
        return $result;
    }
    public function updateStatus($contactid) {
        $updateQuery = "UPDATE contacts SET status = 1 WHERE id = $contactid";
        $this->db->update($updateQuery);
        return true; 
    }
}
?>