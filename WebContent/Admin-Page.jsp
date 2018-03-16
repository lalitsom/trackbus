<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>  
<%@ page import="com.ibm.dao.*" %>  
<%

HttpSession session1=request.getSession();

	if(session1.getAttribute("uname")!="admin")
	{
        response.sendRedirect("Admin-Login.jsp");
	}
 %>

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

<section class="mbr-section mbr-section__container article mbr-after-navbar" id="header3-1i" style="background-color: rgb(255, 255, 255); padding-top: 100px; padding-bottom: 20px;">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h3 class="mbr-section-title display-2" >Welcome Admin
                  <a href="Logout.jsp" style="float:right;"> <button type="submit" id="form-submit" class="btn btn-danger">Log Out</button>  </a>
                </h3>


            </div>
        </div>
    </div>
</section>

<section class="mbr-section " id="form1-1c" style="background-color: rgb(239, 239, 239); padding-top: 12px; padding-bottom: 120px;">

    <div class="mbr-section mbr-section__container mbr-section__container--middle">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">Update Bus Details</h3>
                    <small class="mbr-section-subtitle">Using proper CSV file</small>
                </div>
            </div>
        </div>
    </div>
    <div class="mbr-section mbr-section-nopadding">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-lg-10 col-lg-offset-1" data-form-type="formoid">


                    <div data-form-alert="true">
                        <div hidden="" data-form-alert-success="true" class="alert alert-form alert-success text-xs-center">Thanks for filling out form!</div>
                    </div>



                <form method="post" action="store_data" enctype = "multipart/form-data" onsubmit="return validate_upload()">
                    <div class="row row-sm-offset">

                            <div class="col-xs-12 col-md-4">
                                <div class="form-group">

                                	<input type="file" id="file_id" name="fname"/></td>
                                </div>
                            </div>

                        <div><button type="submit" class="btn btn-primary">Upload</button></div>

                    </form>
                </div>
</br>
                <%
		if(request.getParameter("filestatus")!= null)
		{
			out.println("<h2 style='margin-left: 40px; color:green;'>"
		+request.getParameter("filestatus")+"</h2>");

		}
%>
            </div>
        </div>
    </div>
</section>	







<section class="mbr-section" id="form1-1c" style="background-color: rgb(239, 239, 239); padding-top: 12px; padding-bottom: 120px;">

    <div class="mbr-section mbr-section__container mbr-section__container--middle">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title ">Update Driver Details</h3>
                    <small class="mbr-section-subtitle">driver for each bus</small>
                </div>
            </div>
        </div>
    </div>
    <div class="mbr-section mbr-section-nopadding">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-lg-10 col-lg-offset-1" data-form-type="formoid">


                    <div data-form-alert="true">
                        <div hidden="" data-form-alert-success="true" class="alert alert-form alert-success text-xs-center">Thanks for filling out form!</div>
                    </div>
                    
                    <%
 String sql="select * from driver_bus";
 CABDAO obj=new CABDAO();
 ResultSet rs=obj.FetchAllDriver(sql);
%>




<form action="update_driver" method="post">
<table border="1">
  <tr>     
     <th>Service No</th>
     <th>Driver Name</th>
     <th>Contact</th>
     <th>Experience</th>
     <th>Age</th>
     <th>Shift Time</th>
     
  </tr>
  <%  while(rs.next()){ %>
   <tr>
        <td><input type="text" name="serno" value="<%=rs.getString(1)%>" readonly size="15" /> </td>
        <td><input type = "text" name="drivername" value="<%=rs.getString(2) %>"  size="20"></td>
        <td><input type = "text" name="contact" value="<%=rs.getString(3) %>"  size="20"></td>
        <td><input type = "text" name="exp" value="<%=rs.getString(4) %>"  size="15"></td>
        <td><input type = "text" name="age" value="<%=rs.getString(5) %>"  size="15"></td>
        <td><input type = "text" name="shifttime" value="<%=rs.getString(6) %>"  size="20"></td>        
    </tr>
  <%} %>
  
 </table>
 <br><br/>
  <input type="submit" class="btn btn-primary" value="Update Details" name="update" />

 </form>

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

  <input name="animation" type="hidden">
  </body>
</html>
