<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "com.ibm.dao.*" %>   
 <%@ page import="java.sql.*" %>  


    <html>
    <head>

      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="shortcut icon" href="assets/images/97-128x128.png" type="image/x-icon">
      <meta name="description" content="">

      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
      <link rel="stylesheet" href="assets/bootstrap-material-design-font/css/material.css">
      <link rel="stylesheet" href="assets/tether/tether.min.css">
      <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" href="assets/dropdown/css/style.css">
      <link rel="stylesheet" href="assets/animate.css/animate.min.css">
      <link rel="stylesheet" href="assets/socicon/css/styles.css">
      <link rel="stylesheet" href="assets/theme/css/style.css">
      <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
      <link rel="stylesheet" href="css/mainstyle.css">
 
    </head>
    <body onload="changezoom()">
    <section id="menu-0">

        <nav class="navbar navbar-dropdown navbar-fixed-top">
            <div class="container">

                <div class="mbr-table">
                    <div class="mbr-table-cell">

                        <div class="navbar-brand">
                            <a href="index.html" class="navbar-logo"><img src="assets/images/97-128x128.png" alt="Mobirise"></a>
                            <a class="navbar-caption" href="index.html">Track</a>
                        </div>

                    </div>
                    <div class="mbr-table-cell">
                        <button class="navbar-toggler pull-xs-right hidden-md-up" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                            <div class="hamburger-icon"></div>
                        </button>

                        <ul class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm" id="exCollapsingNavbar">
                          <li class="nav-item"><a class="nav-link link" href="index.html"></a></li><li class="nav-item dropdown">
                            <a class="nav-link link" href="index.html">Home</a></li>
                            <li class="nav-item"><a class="nav-link link" href="Find.jsp">Find Service No.</a></li>
                            <li class="nav-item"><a class="nav-link link" href="Track.jsp">Track Bus</a></li>
                            <li class="nav-item"><a class="nav-link link" href="BusDetails.jsp">Bus Details</a></li>
                            <li class="nav-item"><a class="nav-link link" href="Contact.html">Give Feedback</a></li>
                            <li class="nav-item nav-btn"><a class="nav-link btn btn-warning-outline btn-warning" href="Admin-Login.jsp">ADMIN</a>
                            </li></ul>
                        <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                            <div class="close-icon"></div>
                        </button>

                    </div>
                </div>

            </div>
        </nav>

    </section>

<section class="mbr-section mbr-after-navbar" id="form2-g" style="background-color: rgb(64, 63, 63); padding-top: 120px; padding-bottom: 20px;">
        <div class="mbr-section mbr-section__container mbr-section__container--middle">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">Track Bus by Service No.</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="mbr-section mbr-section-nopadding" style="margin-top:-45px;">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-lg-10 col-lg-offset-1" data-form-type="formoid">

                    <form class="mbr-form" action="" method="get">

                        <div class="mbr-subscribe mbr-subscribe-dark input-group">
                            <input type="text" class="form-control" name="ser" required=""  placeholder="Enter Bus Service No." id="form2-g-email">
                            <span class="input-group-btn"><input type="submit" class="btn btn-primary">Track Bus</span>
                        </div>
                    </form>
                </div>
            </div>
            <marquee style="color:white;">Important Message : Bus Service No. 123 has been cancelled for 03/07/2017. Sorry for inconvenience</marquee>
        </div>
    </div>
</section>

                      <%
 						if(request.getParameter("ser")!=null)
						{
 							 
				   	CABDAO obj=new CABDAO();
			    	ResultSet rs=obj.FetchLat(request.getParameter("ser"));    
		
			


%>
<script>
window.serviceno = <% out.print(request.getParameter("ser") +";"); %>
window.stationarray =[];
  <%  while(rs.next()){ 

 String coordinates = "{lat: " + rs.getString(4) + ", lng: " +  rs.getString(5) + "}"; 
  out.println("window.stationarray.push(" + coordinates +");");
 } %>
  </script>
  <%
  }                      
 %>
   
   
   <script>
   
   function modifiedinitMap(){
	   <%
	   if(request.getParameter("ser")!=null){
		%>  
		document.getElementById('noservice').hidden = true;
		initMap();	
		   
		  <% 
	   }
	   %>
   }
   
   </script>
   
   
<section class="mbr-section mbr-section-nopadding " id="map1-h">
    <div class="mbr-map" id="map">
    
    <span id="noservice">
    <center></br></br>
    <h1>Please  Enter Bus Service Number to Start Tracking.
    </h1></br></br>
    <h1>Don't Know Service No.? <a href="Find.jsp" target="_blank">Click Here</a>
    </h1>
    </center>
    </span>
    
    
    
    
    </div>
</section>

<section class="mbr-section mbr-section-md-padding" id="social-buttons3-d" style="background-color: rgb(46, 46, 46); padding-top: 90px; padding-bottom: 90px;">

    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 text-xs-center">
                <h3 class="mbr-section-title display-2">SHARE THIS PAGE!</h3>
                <div>

                  <div class="mbr-social-likes" data-counters="false">
                    <span class="btn btn-social facebook" title="Share link on Facebook">
                        <i class="socicon socicon-facebook"></i>
                    </span>
                    <span class="btn btn-social twitter" title="Share link on Twitter">
                        <i class="socicon socicon-twitter"></i>
                    </span>
                    <span class="btn btn-social plusone" title="Share link on Google+">
                        <i class="socicon socicon-googleplus"></i>
                    </span>


                  </div>

                </div>
            </div>
        </div>
    </div>
</section>

<section class="mbr-section mbr-section-md-padding mbr-footer footer1" id="contacts1-6" style="background-color: rgb(46, 46, 46); padding-top: 90px; padding-bottom: 90px;">

    <div class="container">
        <div class="row">
            <div class="mbr-footer-content col-xs-12 col-md-3">
                <div><img src="assets/images/97-128x128.png"></div>
            </div>
            <div class="mbr-footer-content col-xs-12 col-md-3">
                <p><strong>Address</strong><br>
1234 India gate<br>
Delhi, AA 99999</p>
            </div>
            <div class="mbr-footer-content col-xs-12 col-md-3">
                <p><strong>Contacts</strong><br>
Email: support@track.com<br>
Phone: +1 (0) 000 0000 001<br>
Fax: +1 (0) 000 0000 002</p>
            </div>
            <div class="mbr-footer-content col-xs-12 col-md-3">
                <p><strong>Links</strong><br>
<a class="text-primary" href="Track.jsp">Track Bus</a><br>
<a class="text-primary" href="BusDetails.jsp">Get Bus Details</a><br>
<a class="text-primary" href="Contact.html">Give Feedback</a></p>
            </div>

        </div>
    </div>
</section>

<footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="footer1-2" style="background-color: rgb(50, 50, 50); padding-top: 1.75rem; padding-bottom: 1.75rem;">

    <div class="container">
        <p class="text-xs-center">Copyright (c) 2017 Bus Tracking.</p>
    </div>
</footer>


  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/tether/tether.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smooth-scroll/smooth-scroll.js"></script>
  <script src="assets/dropdown/js/script.min.js"></script>
  <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
  <script src="assets/viewport-checker/jquery.viewportchecker.js"></script>
  <script src="assets/jarallax/jarallax.js"></script>
  <script src="assets/social-likes/social-likes.js"></script>
  <script src="assets/theme/js/script.js"></script>
  <script src="js/mainscript.js"></script>

  <script src="js/map_script.js"></script>
  <script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDr4vrpaWBHC1crPOQAR3AwHakXIdaHkp0&callback=modifiedinitMap">
  </script>
<script>
  setInterval(getLoc_Update,1000,window.serviceno);
    
  function changezoom(){	 
	  window.map.setZoom(8);
	  window.map.setCenter(window.bus_loc);
  }
  
  
</script>

  <input name="animation" type="hidden">
  </body>
</html>
