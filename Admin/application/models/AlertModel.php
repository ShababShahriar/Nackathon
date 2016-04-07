<?php
class AlertModel extends CI_Model 
{
	
    public function __construct()
	{
        $this->load->database();
	}
	
	public function getAlerts()
	{
		$sql = 'SELECT * FROM alerts WHERE seen = 0';
		$query = $this->db->query($sql)->result_array();
		return $query;
	}
}

?>