$(initialize);

function initialize(){
  var colors = [
    "|EFE8FF|", 
    "|BBBCFC|",
    "|CA3DE3|", 
    "|4DC0FC|",
    "|5DCF4E|",
    "|F595B5|",
    "|888888|"
  ];

  createMap();
  drawMap(colors);
}

function createMap(){
  var mapOptions = {
    zoom: 12,
  };

  window.map = new google.maps.Map($("#map_canvas")[0], mapOptions);
  window.mapBound = new google.maps.LatLngBounds();
}

function drawMap(colors) {
  if ($(".counter").length) {
    $(".town_route").each(function(i, town) {
      var count = $(".counter")[i].innerHTML;
      var numConfirmed = $(".conf")[i].innerHTML;
      var townAddress = $(town).find(".town_name").html();

      timer = setInterval(function() {
        geocodeMultiMarker(townAddress, colors[count], numConfirmed);
      }, 200);
    });
  }

  if ($(".pickup").length) {
    $(".pickup").each(function(i, pickup) {
      var listingAddress = $(pickup).find(".pickup_address").html();

      timer = setInterval(function() {
        geocodeAndAddMarker(listingAddress);
      }, 200);
    });
  }
};

function setBounds(latlng) {
  window.mapBound.extend(latlng);
  window.map.fitBounds(window.mapBound)
}
