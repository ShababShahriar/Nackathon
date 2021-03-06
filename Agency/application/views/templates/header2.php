<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link rel="stylesheet" href="<?php echo base_url("assets/css/home.css"); ?>">
    <link rel="stylesheet" href="<?php echo base_url("assets/css/button.css"); ?>">

    <title>TourToise - Agency</title>

    <!-- Bootstrap core CSS -->
    <link href="<?php echo base_url("assets/css/bootstrap.min.css"); ?>" rel="stylesheet">
    <link href="<?php echo base_url("assets/css/dashboard.css"); ?>" rel="stylesheet">
    <script src="<?php echo base_url("assets/js/ie-emulation-modes-warning.js"); ?>"></script>
    <link href="<?php echo base_url("assets/css/mynavbar.css"); ?>" rel="stylesheet">
    
    <link href="<?php echo base_url("assets/css/fileinput.css"); ?>" media="all" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="<?php echo base_url("assets/css/myMap.css"); ?>" rel="stylesheet">
     <script src="<?php echo base_url("assets/js/myMap.js"); ?>"></script>
  </head>

  <body>

    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a id="logo" class="navbar-brand" href="">TourToise</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="<?php echo site_url('agency'); ?>" > <strong>Home</strong></a></li>
            <li><a href="<?php echo site_url('agency/addOffer');?>"><b>Add New Offer</b></a></li>
            <li><a href="<?php echo site_url('agency/addHotel');?>"><b>Add New Hotel</b></a></li>
            <li><a href="<?php echo site_url('agency/settings');?>"><b>Settings</b></a></li>
            <li><a href="<?php echo site_url('agency/logout'); ?>" ><b>LogOut</b></a></li>
          </ul>
          
        </div>
      </div>
    </nav>

  </body>

</html>