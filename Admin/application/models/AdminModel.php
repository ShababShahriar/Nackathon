<?php
class AdminModel extends CI_Model 
{
	
    public function __construct()
	{
        $this->load->database();
	}
		
	public function getLoginInfo($data)
	{
		$sql='SELECT * FROM admin where `userName` = ? and `password` = ?';
		$query = $this->db->query($sql,array($data['adminName'],$data['password']));
		return $query;
	}
	
	public function getNewSpotsFromUser()
	{
		$sql = 'SELECT * FROM `spot` WHERE `checked` = 0';
		$query = $this->db->query($sql)->result_array();
		return $query;
	}
}

?>