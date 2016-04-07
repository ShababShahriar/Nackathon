
    <br><br><br>
    <h2 style="text-align:center"><b>Alert Notifications</b></h2>  

    <table>
        <tr>
            <div class="alert alert-danger " role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" ></span>
                <span class="sr-only">Error:</span>
                    Some Tourist is in Danger!
                     <button class="btn btn-danger" type="submit" onclick="myMap(25.7518,88.7109)">try it</button>
            </div>
            <div class="alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" ></span>
                <span class="sr-only">Error:</span>
                    Some Tourist is in Danger!
                    <button class="btn btn-danger" type="submit" onclick="myMap(23.7518,89.7109)">try it</button> 
            </div>

            
        
            <div id="map" ></div>
        
        </tr>
        
    </table>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4LGcxa0bb_eUxxLYVv1sO6NRZ6UbPGsc&callback=myMap">
    </script>
  </body>
</html>