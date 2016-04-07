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
	
	public function getCategoryName($catId)
	{
		$sql = 'SELECT cat FROM category WHERE `id` = ?';
		$query= $this->db->query($sql,$catId)->row_array();
		return $query['cat'];
	}
}
?>