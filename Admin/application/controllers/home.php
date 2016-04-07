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
		  $this->load->model('adminModel');
     }
	 
	public function index()
	{
		
		if(isset($_SESSION["adminName"]))
		{
			redirect('/admin', 'refresh');
		}
		else
		{
			$data = array(
               'login_error' => false
			);
			$this->load->view('admin-login',$data);
		}
	}
	
	public function login()		
	{
		if(isset($_POST['adminName']) && isset($_POST['password']))
		{
			$data = array('adminName'=>trim($_POST['adminName']),'password'=>md5($_POST["password"]));
			
			$query= $this->adminModel->getLoginInfo($data);
			
			
			if($query->num_rows()==1)
			{
				$loginInfo=$query->row_array();
				$_SESSION["adminName"]=$loginInfo['userName'];
				
				//Load User Admin Page
				redirect('/admin', 'refresh');
			}
			else
			{
				$data = array(
				   'login_error' => true
				);
				$this->load->view('admin-login',$data);
			}
			
		}
		else
		{
			$data = array(
				   'login_error' => false
				);
			$this->load->view('admin-login',$data);
		}
		
	}
	
}
