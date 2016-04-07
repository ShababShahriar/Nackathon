<?php
class HotelModel extends CI_Model 
{
	public function __construct()	
	{
        $this->load->database();
	}	

	public function insertHotel($hotelData)
	{
		$sql= 'INSERT INTO `hotel`(`name`, `locationId`, `locationDesc`, `websiteLink`) VALUES (?,?,?,?)';
		$query= $this->db->query($sql,array($hotelData['name'],$hotelData['locationId'],$hotelData['locationDescription'],$hotelData['siteLink']));
		
		$sql = 'SELECT `id` FROM `hotel` WHERE `name` = ? AND `locationId` = ?';
		$query = $this->db->query($sql,array($hotelData['name'],$hotelData['locationId']))->row_array();
		return $query['id'];
	}
	
	public function insertHotelDescription($descriptionData)
	{
		$sql = 'INSERT INTO `description`(`userId`, `type`, `entityId`, `text`, `time`) VALUES(?,?,?,?,?)';
		$query = $this->db->query($sql,array($descriptionData['userId'],
				$descriptionData['type'],$descriptionData['entityId'],
				$descriptionData['text'],$descriptionData['time']));
		
	}
	
	public function insertLocation($data)
	{
		$sql = 'SELECT COUNT(*) as cnt FROM `location` WHERE `googleId` = ?';
		$count = $this->db->query($sql,array($data['googleId']))->row_array();
		
		
		if($count['cnt'] == 0)
		{
			$sql = 'INSERT INTO `location`(`googleId`, `latitude`, `longitude`, `roadNo`) VALUES (?,?,?,?)';
			$query = $this->db->query($sql,array($data['googleId'],$data['lat'],$data['lon'],$data['roadNo']));
		}
		
		$sql = 'SELECT `id` FROM `location` WHERE `googleId` = ?';
		$query = $this->db->query($sql,array($data['googleId']))->row_array();
		return $query['id'];
	}
}
?>