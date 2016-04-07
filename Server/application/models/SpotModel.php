<?php
class SpotModel extends CI_Model 
{
	public function __construct()	
	{
        $this->load->database();
		define("SPOT_DESC",3);
	}	

	public function insertLocation($data)
	{
		$sql = 'SELECT COUNT(*) as cnt FROM `location` WHERE `googleId` = ?';
		$count = $this->db->query($sql,array($data['googleId']))->row_array();
		
		
		if($count['cnt'] == 0)
		{
			$sql = 'INSERT INTO `location`(`googleId`, `latitude`, `longitude`, `roadNo`, `district`) VALUES (?,?,?,?,?)';
			$query = $this->db->query($sql,array($data['googleId'],$data['lat'],$data['lon'],$data['roadNo'],$data['district']));
		}
		
		$sql = 'SELECT `id` FROM `location` WHERE `googleId` = ?';
		$query = $this->db->query($sql,array($data['googleId']))->row_array();
		return $query['id'];
	}
	
	public function getAllSpots()
	{
		$sql = 'SELECT * FROM `spot`';
		$query = $this->db->query($sql)->result_array();
		return $query;
	}
	
	public function getCategoryName($spotId)
	{
		$sql = 'SELECT cat FROM category WHERE `id` = `spot`.`id` and `spot`.`id` = ?';
		$query= $this->db->query($sql,$spotId)->row_array();
		return $query['cat'];
	}
	
	public function getSpotInfo($spotId)
	{
		$sql = 'SELECT * FROM `spot` WHERE `id` = ?';
		$query = $this->db->query($sql,array($spotId))->row_array();
		return $query;
	}
	
	public function insertSpot($spotData)
	{
		
		$sql = 'INSERT INTO `spot`(`name`, `locationId`, `howToGo`, `security`, `estimatedCost`, `food`, `policeContact`, `fireContact`, `checked`,`categoryId`)
				VALUES (?,?,?,?,?,?,?,?,?,?)';
		$query = $this->db->query($sql,array($spotData['spotName'],$spotData['locationId'],$spotData['howToGo'],$spotData['security'],$spotData['estimatedCost'],$spotData['food'],$spotData['policeContact'],
				$spotData['fireContact'],$spotData['checked'],$spotData['category']));
		
		
		$sql = 'SELECT `id` FROM `spot` WHERE `name` = ? AND `locationId` = ?';
		$query = $this->db->query($sql,array($spotData['spotName'],$spotData['locationId']))->row_array();
		return $query['id'];
		
	}
	/**
	public function currentTime()
	{
		$sql="SELECT current_timestamp() as curTime";
		$query=$this->db->query($sql);
		$result=$query->row_array();
		
		return $result['curTime'];
	}
	*/
	public function insertSpotDescription($descriptionData)
	{
		$sql = 'INSERT INTO `description`(`userId`, `type`, `entityId`, `text`, `time`) VALUES(?,?,?,?,?)';
		$query = $this->db->query($sql,array($descriptionData['userId'],
				$descriptionData['type'],$descriptionData['entityId'],
				$descriptionData['text'],$descriptionData['time']));
		
	}

	public function searchByDistrict($name)
	{
		$sql = 'SELECT * FROM `spot` JOIN `location` ON spot.`locationId`=location.`id` WHERE LOWER(TRIM(location.`district`))=?';
		$query = $this->db->query($sql,array(strtolower($name)))->result_array();
		return $query;
	}

	public function searchByDivision($name)
	{
		$sql = 'SELECT s.* FROM `spot` s,`location` l WHERE s.`locationId`=l.`id` AND LOWER(TRIM(l.`division`))=?';
		$query = $this->db->query($sql,array(strtolower($name)))->result_array();
		return $query;
	}
	
	public function getLocationInfo($spotId)
	{
		$sql = 'SELECT l.`latitude`, l.`longitude`, l.`roadNo`, l.`district` FROM `location` l,`spot` s WHERE s.`locationId` = l.`id` and s.`id` = ?';
		$query = $this->db->query($sql,$spotId)->row_array();
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