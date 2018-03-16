function validate_findform(){
	start = document.getElementById('sel1').value;	
	end = document.getElementById('sel2').value;
	if(start == end){
		alert("Please choose different stations");
		return false;
	}
	return true;	
}

function validate_upload(){
	file_field = document.getElementById('file_id');	
	
	if(file_field.value==""){
		alert("Please select a .csv file to upload");
		return false;
	}
	return true;
	
}

 
var request;  
function getLoc_Update(sno)  
{    
	
var url="AsyncDetails?busno="+sno;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
	if(request.readyState==4){  
	var val=request.responseText;  
	console.log(val);
	if(val.length>9){
		locarray = val.split(';');
		if(locarray.length>0){
				lati = parseFloat(locarray[0]);
				lngi = parseFloat(locarray[1]);
				
				window.bus_loc = {lat: lati, lng: lngi}; 
				window.bus_marker.setPosition(window.bus_loc);
		}
	}
		
	}  
}





//simulate functions

function updateLocAsync(sno,lat,lng)  
{    
	
var url="UpdateLocation?busno="+sno+"&lat="+lat+"&lng="+lng;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getinf;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  

  
function getinf(){  
	if(request.readyState==4){  
	var val=request.responseText;  
	console.log(val);
		
	}  
}
  
var pointarray = [];
function simulatePoints(){
	window.startpoint = {lat: 29.200564, lng: 77.973238};	
	window.endpoint = {lat: 29.00852, lng: 77.745958};
	
	window.ipoint = {lat: 29.200564, lng: 77.973238};
	
			
		window.m = (window.endpoint.lng - window.startpoint.lng)/(window.endpoint.lat - window.startpoint.lat);
			
			stepsize =120.0;
			
			window.steplng = (window.endpoint.lng - window.startpoint.lng)/stepsize;
			window.steplat = (window.endpoint.lat - window.startpoint.lat)/stepsize;
			
			while(window.ipoint.lat > window.endpoint.lat){				
				
				var tmp = {lat: window.ipoint.lat, lng: window.ipoint.lng};
				pointarray.push(tmp);
				
				window.ipoint.lat += window.steplat;
				window.ipoint.lng += window.steplng;				
			}
	
	
}



function startsimulation(i){
	
	if(i<pointarray.length){
		console.log('124',pointarray[i].lat,pointarray[i].lng);
		updateLocAsync('124',pointarray[i].lat,pointarray[i].lng);
		setTimeout(startsimulation,1000,i+1);		
	}
	
}
