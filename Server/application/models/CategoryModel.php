<?php
class CategoryModel extends CI_Model 
{
	public function __construct()	
	{
        $this->load->database();
	}	

	public function getAllCategory()
	{
		$sql = 'SELECT * FROM `category` ';
		$query = $this->db->query($sql)->result_array();
		return $query;
	}
}
?>