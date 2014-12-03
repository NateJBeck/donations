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
