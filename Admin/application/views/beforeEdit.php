 <h2 style="text-align:center"><b>Search Reported Posts</b></h2>

    <div class="container-fluid">
        
        <div class="row">
            <form action="search" method="POST">
            <div class="col-md-3"></div>
            <div class="col-md-3">
                <h3 style="text-align: center"><span class="label label-danger">Resource Type:</span></h3>
                 <select class="form-control" name="type">
                    <option value="ANY"> - - - </option>
                    <option value="0">Spot</option>
                    <option value="1">Hotel</option>
                </select>
            </div>
            <div class="col-md-3">
                <h3 style="text-align: center"><span class="label label-danger">Division</span></h3>
                <select class="form-control" name="category_select">
                    <option value="ANY"> - - - </option>
                    <option value="0"> Dhaka </option>
                    <option value="1"> Chittagong </option>
                    <option value="2"> Sylhet </option>
                    <option value="3"> Barisal </option>
                    <option value="4"> Rajshahi </option>
                    <option value="5"> Rangpur </option>
                    <option value="6"> Khulna </option>
                </select>
            </div>
            
            <div class="col-md-2">
                <h3 style="visibility: hidden">.</h3>
                <button type="submit" class="btn btn-success"><span>Go</span></button>
            </div>
        </form>
        </div>

        <div class="row">
            <table class="table table-hover">
                <thead>
                    <th></th>
                    <th></th>
                    <th></th>
                </thead>
                <tbody>
                    <tr>
                        <form method="post" action="editInfo">
                            <td></td>
                            <td>
                                Sajek Valley
                            </td>
                            <td>
                                <button type="submit" class="form-action btn btn-warning">Edit Info</button>
                            </td>
                        </form>
                    </tr>
                    <tr>
                        <form method="post" action="editInfo">
                            <td></td>
                            <td>
                                Sundarban
                            </td>
                            <td>
                                <button type="submit" class="form-action btn btn-warning">Edit Info</button>
                            </td>
                        </form>
                    </tr>
                    <tr>
                        <form method="post" action="editInfo">
                            <td></td>
                            <td>
                                Jaflong
                            </td>
                            <td>
                                <button type="submit" class="form-action btn btn-warning">Edit Info</button>
                            </td>
                        </form>
                    </tr>
                    <tr>
                        <form method="post" action="editInfo">
                            <td></td>
                            <td>
                                Madhav Kundu
                            </td>
                            <td>
                                <button type="submit" class="form-action btn btn-warning">Edit Info</button>
                            </td>
                        </form>
                    </tr>
                    <tr>
                        <form method="post" action="editInfo">
                            <td></td>
                            <td>
                                Cox's Bazar
                            </td>
                            <td>
                                <button type="submit" class="form-action btn btn-warning">Edit Info</button>
                            </td>
                        </form>
                    </tr>
                </tbody>
            </table>
        </div>


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
