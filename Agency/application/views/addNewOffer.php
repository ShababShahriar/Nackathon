
      <h2 style="text-align:center"><b>Add New Offer</b></h2>  
      <div class="col-md-2"></div>
        <div class="col-md-8">
            <form class="addSpot" method="post">
                <br><br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label>Name of the Spot: </label></h4>
                    </div>
                    <div class="col-md-6">
                        <select class="form-control" name="spotName">
                            <option value="0"> Sajek Valley </option>
                            <option value="0"> Cox's Bazar </option>
                            <option value="0"> HumHum </option>
                            <option value="0"> NafaKum </option> 
                        </select>
                    </div>
                    <div class="col-md-1"></div>
                </div>
               
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label>Offer Details: </label></h4>
                    </div>
                    <div class="col-md-6">
                        <textarea class="form-control" name="offer" rows="3" placeholder="What's the offer? (e.g. We are offering a 3 day 4 nights package to Cox's Bazar at 30% off!!! )"></textarea>
                     </div>
                     <div class="col-md-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label class="control-label">Starting Date:</label></h4>
                    </div>
                    <div class="col-md-6">
                        <input type="date" class="form-control" name="startDate">
                    </div>
                     <div class="col-md-1"></div>
                </div>
    
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label class="control-label">End Date:</label></h4>
                    </div>
                    <div class="col-md-6" >
                            <input type="date" class="form-control" name="endDate">
                    </div>
                     <div class="col-md-1"></div>
                </div>
                 
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label class="control-label">Contact Number:</label></h4>
                    </div>
                    <div class="col-md-6">
                        <input type="text" class="form-control bfh-phone" data-country="BD" data-format="+(880) dddd-dddddd" name="agencyNumber">
                    </div>
                     <div class="col-md-1"></div>
                </div>
                
                <br>
                <div>
                    <div class="col-md-6" ></div>
                        <button type="Submit" class="btn btn-success">Submit</button>   
                </div>   
                <br>    
            </form>
        </div>
        <div class="col-md-2"></div>


     <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4LGcxa0bb_eUxxLYVv1sO6NRZ6UbPGsc&callback=getLat">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="<?php echo base_url("assets/js/bootstrap.min.js"); ?>"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
   
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<?php echo base_url("assets/js/ie10-viewport-bug-workaround.js"); ?>"></script>

    <script src="<?php echo base_url("assets/js/fileinput.js"); ?>" type="text/javascript"></script>
    <script src="<?php echo base_url("assets/js/fileinput_locale_fr.js"); ?>" type="text/javascript"></script>
    <link href="<?php echo base_url("assets/css/fileinput.css"); ?>" media="all" rel="stylesheet" type="text/css" />
  </body>
</html>
