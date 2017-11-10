document.addEventListener("DOMContentLoaded", function() {
    var zipcode;
    var x = document.getElementById("demo");

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(getZipcode);
        } else {
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }

    function getZipcode(position) {
        var lat= position.coords.latitude;
        var long= position.coords.longitude;

        var root = 'https://maps.googleapis.com/maps/api/geocode/json';
        var params = {
            latlng: lat+','+ long,
            key: 'AIzaSyCU4jZMm3PQtj9LQELyGrKL7Ji7CXVVvgc',
            result_type: 'postal_code'
        };

        $.ajax({
            url: root,
            type: 'GET',
            data: params,
            success: function(response){
              var zipcode = (response.results[0].address_components[0].short_name);
              console.log(zipcode);
              localStorage.setItem('zipcode', zipcode);
            },
            error: function(xhr){
                console.log('There was an error on the request: ' + xhr);
            }
        })
    }

    var button = document.getElementById("demobutton");

    button.addEventListener("click", function(){
        getLocation();
            });
})