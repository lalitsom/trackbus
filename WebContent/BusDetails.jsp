<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>  
<%@ page import="com.ibm.dao.*" %>  
    <html>
    <head>

      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="shortcut icon" href="assets/images/97-128x128.png" type="image/x-icon">
      <meta name="description" content="">

 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
      
      
		
		<style>
		
#details {
margin-left: 100px;
}		
		
	</style>
		
    </head>
    <body>
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
                    <h3 class="mbr-section-title display-2">Find Bus-Driver Details Using Service No.</h3>
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
                            <input type="text" class="form-control" name="busno" required=""  placeholder="Enter Bus Service No." id="form2-g-email">
                            <span class="input-group-btn"><input type="submit" class="btn btn-primary">Get Details</span>
                        </div>
                    </form>
                                        
                </div>
            </div>
        </div>
    </div>
</section>
<section class="mbr-section mbr-section-nopadding mbr-section-full">
    <div>

                      <%
                      System.out.println("enter busdetail");
			if(request.getParameter("busno")!=null)
			{
	   	CABDAO obj=new CABDAO();
    	ResultSet rs=obj.GetDriver(request.getParameter("busno"));    
		
			
%>

  <%  if(rs.next()){ %>
  <div style="padding: 20px;">
  <center>
        <h2>Driver Details for Bus :   <%=rs.getString(1) %></h2></br></center>
        <h3><span class="glyphicon glyphicon-user"></span>  Driver Name : <%=rs.getString(2) %> </br></br>
        <span class="glyphicon glyphicon-earphone"></span> Contact No. :  <%=rs.getString(3) %> </br></br>
        <span class="glyphicon glyphicon-star"></span>  Experience : <%=rs.getString(4) %> </br></br>
        <span class="glyphicon glyphicon-calendar"></span> Age :  <%=rs.getString(5) %></br>        </br>
        <span class="glyphicon glyphicon-time"></span> Shift Timing :   <%=rs.getString(6) %></h3></br>
   </dic>
    
  <%} }
			else
			{
				out.println("<center></br></br><h1>Enter a  valid Bus Service no. to obtain Driver Details</h1><center>");
			}
                      
 %>
                                         
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
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDr4vrpaWBHC1crPOQAR3AwHakXIdaHkp0&callback=initMap">
  </script>


  <input name="animation" type="hidden">
  </body>
</html>
