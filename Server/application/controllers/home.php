<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	 
	public function __construct()		//DONE
	{
          parent::__construct();
		  
		//$this->load->library('session');
		$this->load->helper('form');
		$this->load->helper('url');
		$this->load->helper('html');
		$this->load->library('form_validation');
		

		define ("SPOT",3);
		define ("HOTEL",1);
		define ("HOTEL_CONTACT",1);
		//load models
		$this->load->model('spotModel');
		$this->load->model('hotelModel');
		$this->load->model('staticModel');
		$this->load->model('categoryModel');
		$this->load->model('alertModel');
	}
	 
	public function index()
	{
		
	}
	
	public function insertAlert()
	{
		$alertData['lat'] = $_POST['latitude'];
		$alertData['long'] = $_POST['longitude'];
		$alertData['seen'] = 0;
		$this->alertModel->insertAlert($alertData);
		
		$jsonData['status'] = "OK";
		echo json_encode($jsonData);
	}
	
	public function addSpotFromUser()
	{
		$userId = $_POST['userId'];
		
		//Firstly , insert a location and get the id
		$data['googleId'] = $_POST['googleId'];
		$data['lat'] = $_POST['latitude'];
		$data['lon'] = $_POST['longitude'];
		$data['roadNo'] = trim($_POST['roadNo']);
		$data['district'] = trim($_POST['district']);
		
		
		$spotData['locationId'] = $this->spotModel->insertLocation($data);
		
		$spotData['category'] = $_POST['category'];
		
		
		//insert a spot and get spotId
		$spotData['spotName'] = $_POST['name'];
		$spotData['userId'] = $userId;
		$spotData['howToGo'] = $_POST['howToGo'];
		$spotData['security'] = $_POST['security'];
		$spotData['estimatedCost'] = $_POST['estimatedCost'];
		$spotData['food'] = $_POST['food'];
		$spotData['policeContact'] = $_POST['policeContact'];
		$spotData['fireContact'] = $_POST['fireContact'];
		$spotData['checked'] = 0;
		$spotId = $this->spotModel->insertSpot($spotData);
		
		
		//insert description
		$descriptionData['text'] = $_POST['description'];
		$descriptionData['userId'] = $userId;
		$descriptionData['type'] = SPOT;
		$descriptionData['entityId'] = $spotId;
		$descriptionData['time'] = $this->staticModel->currentTime();
		$this->spotModel->insertSpotDescription($descriptionData);
		
		
		//$jsonData = array();
		$jsonData['status'] = "OK";
		echo json_encode($jsonData);
	}
	
	public function addHotelFromUser()
	{
		$userId = $_POST['userId'];
		
		//Firstly , insert a location and get the id
		$data['googleId'] = $_POST['googleId'];
		$data['lat'] = $_POST['latitude'];
		$data['lon'] = $_POST['longitude'];
		
		$data['roadNo'] = trim($_POST['roadNo']);	//Address
		
		//$data['district'] = trim($_POST['district']);
		
		
		$hotelData['locationId'] = $this->hotelModel->insertLocation($data);
		
		$hotelData['name'] = $_POST['name'];
		//$hotelData['locationDescription'] = $_POST['locationDescription'];
		//$hotelData['rating'] = NULL ;
		$hotelData['siteLink'] = $_POST['websiteLink'];
		
		$hotelId = $this->hotelModel->insertHotel($hotelData);
		
		//insert description
		$descriptionData['text'] = $_POST['description'];
		$descriptionData['userId'] = $userId;
		$descriptionData['type'] = HOTEL;
		$descriptionData['entityId'] = $hotelId;
		$descriptionData['time'] = $this->staticModel->currentTime();
		
		
		$this->hotelModel->insertHotelDescription($descriptionData);
		
		//insert contact
		$contactData['entityId']=$hotelId;
		$contactData['details'] = $_POST['contact'];
		$contactData['type'] = HOTEL_CONTACT;
		$this->hotelModel->insertContact($contactData);
		
		
		//$jsonData = array();
		$jsonData['status'] = "OK";
		echo json_encode($jsonData);
	}
	
	public function getSearchPopulationData()
	{
		$jsonData = array();
		$spots = array();
		
		$temp = $this->spotModel->getAllSpots();
		foreach($temp as $t)
		{
			$spot = array();
			$spot['name'] = $t['name'];
			$spot['id'] = $t['id'];
			array_push($spots,$spot);
		}
		$jsonData['spots'] = $spots;
		
		
		$temp = $this->categoryModel->getAllCategory();
		$cats = array();
		
		foreach($temp as $t)
		{
			array_push($cats,$t['cat']);
		}
		$jsonData['categories'] = $cats;
		
		echo json_encode($jsonData);
	}
	
	/**
	public function getSpotData()
	{
		$name = 
		$howToGo = 
		$images = 
		$estimatedCost = 
		$policeContact = 
		$fireContact = 
		$cat = 
		$location = 
	}
	*/
	
	public function login()	
	{
		
		$email = $_GET['email'];
		$password = md5($_GET['password']);
		
		$jsonData = array();
		
		$data=$this->post_model->get_loginInfo($email,$password);
		$jsonData['userName'] = $data['userName'];
		$jsonData['userId'] = $data['userId'];
		$jsonData['isVerified'] = $data['isVerified'];
		echo json_encode($jsonData);
	}
	
	
	
	//
	//working ...
	//
	public function register()
	{
		$data['user_name'] = trim($_GET['userName']);
		$data['email'] = trim($_GET['email']);
		$data['password'] = md5($_GET['password']);
		
		$json_data = array();
		
		$json_data['status'] = $this->post_model->is_duplicate($data['email']);
		
		
		$data['user_rating']=500;
		$data['is_verified']=0;
		$data['is_suspended']=0;
		
		//GENERATE A VERIFICATION CODE AND SAVE IT TO DATABASE
		//$random_hash = md5(uniqid(rand(), true));
		$random_hash = substr(md5(uniqid(rand(), true)), 6, 6);
		
		$data['ver_code'] = $random_hash;
		
		
		
		//SAVE TO SERVER
		$json_data['userId'] = $this->post_model->register($data);
		echo json_encode($json_data);
		//send_mail();	
	}
	
	public function verify_registration()
	{
		$user_id = $_GET['userId'];
		$ver_code_input = $_GET['verCode'];
		$ver_code = $this->post_model->get_verification_code($user_id);
		$json_data = array();
		if($ver_code_input === $ver_code)
		{
			$json_data['status'] = 1;
			$this->post_model->verify($user_id);
		}
		else $json_data['status']=0;
		echo json_encode($json_data);
		
		//IF EQUALS, VERIFIED. INSERT INTO USER DATABASE; RETURN 1
		//ELSE , RETURN 0
	}
	
	public function send_mail()
	{
		$msg = "This is a test";
		mail("saiful_buet2011@yahoo.com","PHP Test",$msg,"From: saiful.11722@gmail.com");
	}
	
	/**
	public function getSearchByDistrictData()
	{
		$jsonData = array();
		$spots = array();
		
		$name=$_POST['$name']
		$temp = $this->spotModel->searchByDistrict($name);
		foreach($temp as $t)
		{
			$spot = array();
			$spot['name'] = $t['name'];
			$spot['id'] = $t['id'];
			array_push($spots,$spot);
		}
		$jsonData['spots'] = $spots;
		
		
		echo json_encode($jsonData);
	}
	*/
	
	public function searchByDivision()
	{
		$name=$_POST['name'];
		//$name = 'Dhaka';
		$jsonData = array();
		$spots = array();
		
		
		$temp = $this->spotModel->searchByDivision($name);
		
		foreach($temp as $t)
		{
			$spot = array();
			
			$spot = array();
			//print_r($t);
			$spot['name'] = $t['name'];
			$spot['id'] = $t['id'];
			
			$location = $this->spotModel->getLocationInfo($t['id']);
			$spot['location'] = $location;
			$spot['howToGo'] = $t['howToGo'];
			$spot['security'] = $t['security'];
			$spot['estimatedCost'] = $t['estimatedCost'];
			$spot['food'] = $t['food'];
			$spot['policeContact'] = $t['policeContact'];
			$spot['fireContact'] = $t['fireContact'];
			
			//$spot['images'] = $this->spotModel->getImage($t['id']);
			$spot['description'] = $this->spotModel->getDescription($t['id']);
			$spot['category'] = $this->categoryModel->getCategoryName($t['id']);
			
			array_push($spots,$spot);
			
			
			//array_push($spots,$spot);
		}
		$jsonData['spots'] = $spots;
		
		
		echo json_encode($jsonData);
	}
	
}
