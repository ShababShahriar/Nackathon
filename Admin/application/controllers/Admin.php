<?php

/**
*	LAST MODIFIED : 29-06-2015 04:02 PM
*/

defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
	  
	 public function __construct()
     {
          parent::__construct();
		  
		  /**
		  *	Load Libraries , Models and Helpers
		  */
		  
          $this->load->library('session');
          $this->load->helper('form');
          $this->load->helper('url');
          $this->load->helper('html');
		  $this->load->library('form_validation');
		  
		if(!isset($_SESSION["adminName"]))
		{
			redirect('/home', 'refresh');
		}
		  
		//load models
		$this->load->model('adminModel');
		$this->load->model('categoryModel');
		$this->load->model('spotModel');
		
		$this->load->view('templates/header2');
     }
	 
	/**
	*	[ADMIN HOME PAGE]
	*/
	
	public function index()			
	{
		$this->load->view("adminHome");
	}
	
	public function addNewSpot()
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
		$spotData['checked'] = 1;
		$spotId = $this->spotModel->insertSpot($spotData);
		
		
		//insert description
		$descriptionData['text'] = $_POST['description'];
		$descriptionData['userId'] = $userId;
		$descriptionData['type'] = SPOT;
		$descriptionData['entityId'] = $spotId;
		$descriptionData['time'] = $this->staticModel->currentTime();
		$this->spotModel->insertSpotDescription($descriptionData);
		
		$data['success']=true;
		$this->load->view('status_message',$data);
	}
	
	public function newUserPosts()
	{
		$spots = array();
		
		$temp = $this->adminModel->getNewSpotsFromUser();
		foreach($temp as $t)
		{
			$spot = array();
			//print_r($t);
			$spot['spotName'] = $t['name'];
			$spot['id'] = $t['id'];
			
			$location = $this->spotModel->getLocationInfo($t['id']);
			$spot['location'] = $location;
			$spot['howToGo'] = $t['howToGo'];
			$spot['security'] = $t['security'];
			$spot['estimatedCost'] = $t['estimatedCost'];
			$spot['food'] = $t['food'];
			$spot['policeContact'] = $t['policeContact'];
			$spot['fireContact'] = $t['fireContact'];
			
			$spot['images'] = $this->spotModel->getImage($t['id']);
			$spot['description'] = $this->spotModel->getDescription($t['id']);
			$spot['category'] = $this->categoryModel->getCategoryName($t['id']);
			
			array_push($spots,$spot);
			print_r($spot);
			
			echo '';
			
		}
	}
	
	/**
	*	Admin Logs out
	*/
	
	public function logout()	
	{
		$this->session->sess_destroy();	//!Stop Session 
		
		/**
		*Redirect To Homepage
		*/
		
		redirect('/home', 'refresh');
	}
	
	public function test()
	{
		echo "OK";
	}
	
	public function addNewAgency()
	{
		$this->load->view("addAgency");
	}

	public function editInfo()
	{
		$this->load->view("editInfos");
	}

	public function settings()
	{
		$this->load->view("settings");
	}

	public function addNewSpot()
	{
		$this->load->view("addNewSpot");
	}

	public function approveSpot()
	{
		$this->load->view("approveSpot");
	}
}