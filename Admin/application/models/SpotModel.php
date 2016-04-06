<?php
class SpotModel extends CI_Model 
{	
    public function __construct()
	{
        $this->load->database();
		define ("SPOT_IMAGE",1);
		define ("SPOT_DESC",3);
	}
		
	public function getLocationInfo($spotId)
	{
		$sql = 'SELECT l.`latitude`, l.`longitude`, l.`roadNo`, l.`district` FROM `location` l,`spot` s WHERE s.`locationId` = l.`id` and s.`id` = ?';
		$query = $this->db->query($sql,$spotId)->row_array();
		return $query;
	}
	
	public function getImage($spotId)
	{
		$sql = 'SELECT i.`img`, i.`time` FROM `image` i WHERE i.`type`=? AND i.`entityId`=? ';
		$query = $this->db->query($sql,array(SPOT_IMAGE,$spotId))->result_array();
		return $query;
	}
	
	
	public function getDescription($spotId)
	{
		$sql = 'SELECT * FROM `description` WHERE `type`=? AND `entityID` = ?';
		$query = $this->db->query($sql,array(SPOT_DESC,$spotId))->result_array();
		return $query;
	}
}

?>