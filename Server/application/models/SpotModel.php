<?php
class SpotModel extends CI_Model 
{
	/**
		STATUS:
			0 -> PENDING
			1 -> VERIFIED
			2 -> REJECTED
			3 -> SOLVED
	*/
	public function __construct()	
	{
        $this->load->database();
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
	
	public function insertSpot($spotData)
	{
		$sql = 'INSERT INTO `spot`(`name`, `locationId`, `howToGo`, `security`, `estimatedCost`, `food`, `policeContact`, `fireContact`, `checked`)
				VALUES (?,?,?,?,?,?,?,?,?)';
		$query = $this->db->query($sql,array($spotData['spotName'],$spotData['locationId'],$spotData['howToGo'],$spotData['security'],$spotData['estimatedCost'],$spotData['food'],$spotData['policeContact'],
				$spotData['fireContact'],$spotData['checked']));
		
		
		$sql = 'SELECT `id` FROM `spot` WHERE `name` = ? AND `locationId` = ?';
		$query = $this->db->query($sql,array($spotData['spotName'],$spotData['locationId']))->row_array();
		return $query['id'];
		
	}
	
	public function currentTime()
	{
		$sql="SELECT current_timestamp() as curTime";
		$query=$this->db->query($sql);
		$result=$query->row_array();
		
		return $result['curTime'];
	}
	
	public function insertSpotDescription($descriptionData)
	{
		$sql = 'INSERT INTO `description`(`userId`, `type`, `entityId`, `text`, `time`) VALUES(?,?,?,?,?)';
		$query = $this->db->query($sql,array($descriptionData['userId'],
				$descriptionData['type'],$descriptionData['entityId'],
				$descriptionData['text'],$descriptionData['time']));
		
	}
}
?>