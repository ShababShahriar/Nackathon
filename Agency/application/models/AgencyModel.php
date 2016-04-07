<?php
class AgencyModel extends CI_Model 
{
	
    public function __construct()
	{
        $this->load->database();
	}
		
	public function getLoginInfo($data)
	{
		$sql='SELECT * FROM agency where `agencyName` = ? and `password` = ?';
		$query = $this->db->query($sql,array($data['agencyName'],$data['password']));
		return $query;
	}
}

?>