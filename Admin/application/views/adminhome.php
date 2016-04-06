    <br><br>
    <h2 style="text-align:center"><b>Alert Notifications </b></h2>
    
    <div class="row">
        <div class="col-md-6">
            <div class="col-md-3">
            </div>
            <div clas="col=-md-6">
            <table class="table table-hover">
                <thead>
                    <td></td>
                    <td></td>
                    <td></td>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td>
                            <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" ></span>
                            <span class="sr-only">Error:</span>
                            Some Tourist is in Danger!
                            </div>
                        </td>
                        <td><button type="submit" class="btn btn-danger" onclick="myMap(21.75,80.71)">Show Map</button></td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" ></span>
                            <span class="sr-only">Error:</span>
                            Some Tourist is in Danger!
                            </div>
                        </td>
                        <td><button type="submit" class="btn btn-danger" onclick="myMap(21.75,90.71)">Show Map</button></td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
        </div>
        <div class="col-md-6">
            <div id="map" ></div>
        </div>
    </div>
    
   

    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4LGcxa0bb_eUxxLYVv1sO6NRZ6UbPGsc&callback=myMap">
    </script>
  </body>
</html>