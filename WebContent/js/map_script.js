var center_loc = window.stationarray[0];
window.bus_loc = window.stationarray[0];


function initMap() {	
  
	// Create a map and center it 
   map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: center_loc
  });
   
   window.map = map;   

  window.bus_marker = new google.maps.Marker({
  position: window.bus_loc,
  map: map,
  icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
});
  var markerArray =[]; 
  // Instantiate a directions service.
  var directionsService = new google.maps.DirectionsService;
  
  // Instantiate an info window to hold step text.
  var stepDisplay = new google.maps.InfoWindow;	  
  var i =0;
  var waypnts =[];
  for(i=1;i<window.stationarray.length-1;i++){
	  waypnts.push({
	        location: window.stationarray[i],
	        stopover: true
	    });
	  
  }	  
	// Create a renderer for directions and bind it to the map.
	  var directionsDisplay = new google.maps.DirectionsRenderer({map: map});
	 
	  startpoint = window.stationarray[0];
	  endpoint = window.stationarray[window.stationarray.length-1];

	  // Display the route between the initial start and end selections.
	  calculateAndDisplayRoute(directionsDisplay, directionsService, markerArray, stepDisplay, map,startpoint,endpoint,waypnts);
  
  
  
}

function calculateAndDisplayRoute(directionsDisplay, directionsService, markerArray, stepDisplay, map,_start,_end,waypnts) {

  // First, remove any existing markers from the map.
  for (var i = 0; i < markerArray.length; i++) {
    markerArray[i].setMap(null);
  }

  // Retrieve the start and end locations and create a DirectionsRequest using
  // WALKING directions.
  directionsService.route({
    origin: _start,
    destination: _end,
    waypoints: waypnts,
    optimizeWaypoints: true,    
    travelMode: 'DRIVING'    
    	
  }, function(response, status) {
    // Route the directions and pass the response to a function to create
    // markers for each step.
    if (status === 'OK') {
      //document.getElementById('warnings-panel').innerHTML =
        //  '<b>' + response.routes[0].warnings + '</b>';
      directionsDisplay.setDirections(response);
      
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });


  
}
