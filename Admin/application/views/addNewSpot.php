		<br><br>

        <h2 style="text-align:center"><b>Add New Spot</b></h2>	

        <div class="col-md-2"></div>
        <div class="col-md-8">
            <form>
                <br><br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label>Name of the Spot: </label></h4>
                    </div>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="Spot Name">
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label>Category: </label></h4>
                    </div>
                    <div class="col-md-6">
                        <select class="form-control" name="category_select">
                            <option value="0"> Occupied Footpath </option>
                            <option value="0"> Occupied Footpath </option>
                            <option value="0"> Occupied Footpath </option>
                            <option value="0"> Occupied Footpath </option>
                        </select>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label>How to go: </label></h4>
                    </div>
                    <div class="col-md-6">
                        <textarea class="form-control" rows="3" placeholder="How to go? (e.g. You can go to Rai bazar by bus from Bandarban, then go by Chander Gari to hillview.)"></textarea>
                    </div>
                     <div class="col-md-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label class="control-label">Select Image<span class="text-muted">(s)</span>:</label></h4>
                    </div>
                    <div class="col-md-6">
                        <input id="input-2" name="input2[]" type="file" class="file" multiple data-show-upload="false" data-show-caption="true" data-allowed-file-extensions='["jpg", "jpeg", "png"]'>
                    </div>
                     <div class="col-md-1"></div>
                </div>
    
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label class="control-label">Estimated Cost:</label></h4>
                    </div>
                    <div class="col-md-6" >
                        <div class="input-group">
                          <span class="input-group-addon">Tk.</span>
                          <input type="number" class="form-control" aria-label="Amount (to the nearest dollar)">
                          <span class="input-group-addon">.00</span>
                        </div>
                    </div>
                     <div class="col-md-1"></div>
                </div>
                 <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label class="control-label">Security Issues:</label></h4>
                    </div>
                    <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="Is there any risk?">
                    </div>
                     <div class="col-md-1"></div>
                </div>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label class="control-label">Police Contact Number:</label></h4>
                    </div>
                    <div class="col-md-6">
                        <input type="text" class="form-control bfh-phone" data-country="BD" data-format="+(880) dddd-dddddd">
                    </div>
                     <div class="col-md-1"></div>
                </div>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label class="control-label">Fire Station Contact Number:</label></h4>
                    </div>
                    <div class="col-md-6">
                        <input type="text" class="form-control bfh-phone" data-country="BD" data-format="+(880) dddd-dddddd">
                    </div>
                     <div class="col-md-1"></div>
                </div>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h4><label>Description: </label></h4>
                    </div>
                    <div class="col-md-6">
                        <textarea class="form-control" rows="3" placeholder="e.g. This place is very beautiful. It contains an impressive waterfall..."></textarea>
                    </div>
                     <div class="col-md-1"></div>
                </div>

                <br>
                <div>
                    <div class="col-md-6" ></div>
                        <button type="Submit" class="btn btn-success">Submit</button>   
                </div>   
                    
            </form>
        </div>
        <div class="col-md-2"></div>


		 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="<?php echo base_url("assets/js/bootstrap.min.js"); ?>"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="<?php echo base_url("assets/js/vendor/holder.min.js"); ?>"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<?php echo base_url("assets/js/ie10-viewport-bug-workaround.js"); ?>"></script>

    <script src="<?php echo base_url("assets/js/fileinput.js"); ?>" type="text/javascript"></script>
    <script src="<?php echo base_url("assets/js/fileinput_locale_fr.js"); ?>" type="text/javascript"></script>
    <link href="<?php echo base_url("assets/css/fileinput.css"); ?>" media="all" rel="stylesheet" type="text/css" />
  </body>
</html>