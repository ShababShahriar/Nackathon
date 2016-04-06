<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	 
	 public function __construct()		//DONE
     {
          parent::__construct();
		  
		  //Load Necessary Libraries and helpers
          
		  $this->load->library('session');
          $this->load->helper('form');
          $this->load->helper('url');
          $this->load->helper('html');
		  $this->load->library('form_validation');
		  
		  // <Load Admin Model>
		  $this->load->model('agencyModel');
     }
	 
	public function index()
	{
		
		if(isset($_SESSION["agencyName"]))
		{
			redirect('/admin', 'refresh');
		}
		else
		{
			$data = array(
               'login_error' => false
			);
			$this->load->view('agencyLogin',$data);
		}
	}
	
	public function login()		
	{
		if(isset($_POST['agencyName']) && isset($_POST['password']))
		{
			$data = array('agencyName'=>trim($_POST['agencyName']),'password'=>md5($_POST["password"]));
			
			$query= $this->agencyModel->getLoginInfo($data);
			
			
			if($query->num_rows()==1)
			{
				//echo 'Welcome';
				$loginInfo=$query->row_array();
				$_SESSION["agencyName"]=$loginInfo['agencyName'];
				
				//Load User Admin Page
				redirect('/agency', 'refresh');
			}
			else
			{
				$data = array(
				   'login_error' => true
				);
				$this->load->view('agencyLogin',$data);
			}
			
		}
		else
		{
			$data = array(
				   'login_error' => false
				);
			$this->load->view('agencyLogin',$data);
		}
		
	}
}
