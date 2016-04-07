<?php
class StaticModel extends CI_Model 
{
	public function __construct()	
	{
        $this->load->database();
	}	
	
	public function currentTime()
	{
		$sql="SELECT current_timestamp() as curTime";
		$query=$this->db->query($sql);
		$result=$query->row_array();
		
		return $result['curTime'];
	}
	
}
?>