$(initialize);

function initialize(){
  createMap();
  drawMap();
}

function createMap(){
  var mapOptions = {
    zoom: 12,
  };

  window.map = new google.maps.Map($("#map_canvas")[0], mapOptions);
  window.mapBound = new google.maps.LatLngBounds();
}

function drawMap() {
  $.each($(".pickup"), function(i, pickup) {
    var listingAddress = $(pickup).find(".pickup_address").html()
    geocodeAndAddMarker(listingAddress);
  });
};

function geocodeAndAddMarker(address){
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode( { 'address': address }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var result_location = results[0].geometry.location;
      var marker = new google.maps.Marker({
        map: window.map,
        position: result_location,
      });

      var infowindow = new google.maps.InfoWindow({
        content: address
      });

      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
      });

      setBounds(result_location)
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });
}

function setBounds(latlng) {
  window.mapBound.extend(latlng);
  window.map.fitBounds(window.mapBound)
}

//google.maps.event.addDomListener(window, 'load', initialize);
