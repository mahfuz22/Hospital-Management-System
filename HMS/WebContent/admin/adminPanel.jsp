<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="dao.*,bean.*" %>
<%if(session.getAttribute("userEmail")!=null || session.getAttribute("userEmail")==""){%>
	<!DOCTYPE html>
	<html>
	<head>
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
	  	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	  	<link rel="stylesheet" type="text/css" href="../css/calendarview.css">
		<link rel="stylesheet" type="text/css" href="../css/style2.css">
	  	<link rel="stylesheet" type="text/css" href="../css/calendarview.css">
	  	<script type="text/javascript" src="../js/jquery-3.1.1.min.js" ></script>
	  	<script src="../js/nicEdit.js" type="text/javascript"></script>
		<script type="text/javascript" src="../js/prototype.js" ></script>
		<script type="text/javascript" src="../js/calendarview.js" ></script>
	  	<script type="text/javascript" src="../js/bootstrap.min.js" ></script>
		<script>
      function setupCalendars() {
        // Embedded Calendar
        Calendar.setup(
          {
            dateField: 'embeddedDateField',
            parentElement: 'embeddedCalendar'
          }
        )

        // Popup Calendar
        Calendar.setup(
          {
            dateField: 'popupDateField',
            triggerElement: 'popupDateField'
          }
        )
      }

      Event.observe(window, 'load', function() { setupCalendars() })
      
      
      /*for textarea*/
      bkLib.onDomLoaded(function() {
				new nicEditor().panelInstance('area1');
				new nicEditor({fullPanel : true}).panelInstance('area2');
				new nicEditor({iconsPath : '../nicEditorIcons.gif'}).panelInstance('area3');
				new nicEditor({buttonList : ['fontSize','bold','italic','underline','strikeThrough','subscript','superscript','html','image']}).panelInstance('area4');
				new nicEditor({maxHeight : 100}).panelInstance('area5');
			});
    </script>
    <!--  <style>
      body {
        font-family: Trebuchet MS;
      }
      
    </style> -->
	</head>
	<body>
	
	
	<div class="header">
	        <h1>Hospital Management System</h1>
	        <div class="link">
	        	<ul>
				  <li ><a href="../admin/adminPanel.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
				  <li ><a href="#">Profile</a></li>
				  <li ><a href="#">Messages</a></li>
				</ul>
	        </div>
	        <div class="dropdown">
	          <a class="dropbtn" href="#"><img alt="image not found" src="../images/adminProfile.jpg">
	          </a>
	          <div class="dropdown-content">
	            <img alt="image not found" src="../images/adminProfile.jpg">
	           
	            <div class="drop-a">
	              <a href="logout.jsp">Logout</a>
	              <a href="#">Profile</a>
	            </div>
	          </div>
	        </div>
	</div>
	<div class="nav-side-menu">
	    
	    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
	  
	        <div class="menu-list">
	  
	            <ul id="menu-content" class="menu-content collapse out">
	                <li class="collapsed active">
	                  <a href="../admin/adminPanel.jsp">
	                  <i class="fa fa-dashboard fa-lg"></i> Dashboard
	                  </a>
	                </li>
	
	                
					
					 <li>
		                  <a href="../department/department.jsp">
		                  <i class="fa fa-globe"></i> Department
		                  </a>
	                  </li>
					
	                 <li data-toggle="collapse" data-target="#patient" class="collapsed">
	                  <a href="#"><i class="fa fa-wheelchair-alt"></i> Patient <span class="arrow"></span></a>
	                </li>
	                <ul class="sub-menu collapse" id="patient">
	                    <li><a href="../patient/addPatient.jsp"><i class="fa fa-bars" aria-hidden="true"></i>Patient Information</a></li>
	                    <li><a href="#"><i class="fa fa-check-circle" aria-hidden="true"></i>Patient checkout</a></li>
	                </ul>
	
	                 
	
	                 <li data-toggle="collapse" data-target="#user" class="collapsed">
	                  <a href="#"><i class="fa fa-users fa-lg"></i> All Users <span class="arrow"></span></a>
	                </li>
	                <ul class="sub-menu collapse" id="user">
	                	<li><a href="../doctor/doctorInfo.jsp">Doctor</a></li>
	                    <li><a href="../nurse/nurseInfo.jsp">Nurse</a></li>
	                    <li><a href="../stuff/stuffInfo.jsp">Phermacist</a></li>
	                    <li><a href="../patient/patientInfo.jsp">Patient</a></li>
	                    <li><a href="../lobrotorist/labrotoristInfo.jsp">Labrotorist</a></li>
	                    <li><a href="../accountant/accountantInfo.jsp">Accountant</a></li>
	                </ul>
	
	                <li data-toggle="collapse" data-target="#adduser" class="collapsed">
	                  <a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>
	                  Add Users <span class="arrow"></span></a>
	                </li>
	                <ul class="sub-menu collapse" id="adduser">
	                	<li><a href="../doctor/addDoctor.jsp">Doctor</a></li>
	                    <li><a href="../nurse/addNurse.jsp">Nurse</a></li>
	                    <li><a href="../stuff/addStuff.jsp">Stuff</a></li>
	                </ul>
	
	                <li data-toggle="collapse" data-target="#service" class="collapsed">
	                  <a href="#"><i class="fa fa-globe fa-lg"></i> Services <span class="arrow"></span></a>
	                </li>  
	                <ul class="sub-menu collapse" id="service">
	                	<li><a href="#">View Appointment</a></li>
	                    <li><a href="#">View payment</a></li>
	                    <li><a href="#">View Bed Status</a></li>
	                    <li><a href="#">View Blood Bank</a></li>
	                    <li><a href="#">View Birth Report</a></li>
	                    <li><a href="#">View Death Report</a></li>
	                </ul>
	                
	                <li>
	                  <a href="../admin/manageNotice.jsp?page=1">
	                  <i class="fa fa-user fa-lg"></i> Manage Notice
	                  </a>
	                  </li>
	                
	                <li>
	                  <a href="../admin/adminProfile.jsp">
	                  <i class="fa fa-user fa-lg"></i> Profile
	                  </a>
	                  </li>
	
	            </ul>
	     </div>
	</div>
	
	<div class="status">
		  
	  	  <div class="count">
	  	  <h2>Current Status</h2>
	  	  <!-- this scriplet part for counting doctor, nurse and stuff -->
				<%
					Connection con=null;
					Statement stmStatement=null;
					Statement stm=null;
					Statement stm3=null;
					Statement stm4=null;
					ResultSet rs=null;
					ResultSet rs2=null;
					ResultSet rs3=null;
					ResultSet rs4=null;
					con=DbConnector.getConnection();
					stmStatement=con.createStatement();
					stm=con.createStatement();
					stm3=con.createStatement();
					stm4=con.createStatement();
					rs=stmStatement.executeQuery("select * from doctor");
					rs2=stm.executeQuery("select * from nurse");
					rs3=stm3.executeQuery("select * from stuff");
					rs4=stm4.executeQuery("select * from patient");
					int count2=0;
					int count1=0;
					int count3=0;
					int count4=0;
					while(rs.next()) {
						count1++;
					}
					while(rs2.next()) {
						count2++;
					}
					while(rs3.next()) {
						count3++;
					}
					while(rs4.next()) {
						count4++;
					}
				%>	  	  
	  	  	  <h3><%=count1 %></h3>
			  <h3><%=count2 %></h3>
			  <h3><%=count3 %></h3>
			  <h3><%=count4 %></h3>
	  	  </div>
	  	  <div class="br"> 
	  	  	  <p>Doctor</p>
			  <p>Nurse</p>
			  <p>Stuff</p>
			  <p>Patient</p>
		  </div>
		  
	</div>
	<section id="section-dash">
		<div class="main-content">
		  	<div class="dashboard">
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-user-md" aria-hidden="true"></i>
		  			<h3>Doctor</h3>
		  		</div>
		  		</a>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-user-times" aria-hidden="true"></i>
		  			<h3>Patient</h3>
		  		</div>
		  		</a>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-plus-square-o" aria-hidden="true"></i>
		  			<h3>Nurse</h3>
		  		</div>
		  		</a>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-medkit" aria-hidden="true"></i>
		  			<h3>Phermacist</h3>
		  		</div>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-medkit" aria-hidden="true"></i>
		  			<h3>Labrotorist</h3>
		  		</div>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-medkit" aria-hidden="true"></i>
		  			<h3>Accountant</h3>
		  		</div>
		  		</a>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-shopping-basket" aria-hidden="true"></i>
		  			<h3>Appointment</h3>
		  		</div>
		  		</a>
		  	</div>
		  	<div class="dashboard">
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-credit-card-alt" aria-hidden="true"></i>
		  			<h3>Payment</h3>
		  		</div>
		  		</a>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-dot-circle-o" aria-hidden="true"></i>
		  			<h3>Blood Bank</h3>
		  		</div>
		  		</a>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-bars" aria-hidden="true"></i>
		  			<h3>Operation Report</h3>
		  		</div>
		  		</a>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-github-alt" aria-hidden="true"></i>
		  			<h3>Birth Report</h3>
		  		</div>
		  		</a>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-times-circle" aria-hidden="true"></i>
		  			<h3>Death Report</h3>
		  		</div>
		  		</a>
		  	</div>
		  	
		  	<div class="dashboard">
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-user-md" aria-hidden="true"></i>
		  			<h3>Other Report</h3>
		  		</div>
		  		</a>
		  		<a href="#">
		  			<div class="dash">
		  			<i class="fa fa-user-md" aria-hidden="true"></i>
		  			<h3>Bed Status</h3>
		  		</div>
		  		</a>
		  		
		  	</div>
		  </div>
		  
	</section>
	<section id="topcalender">
		<div class="topcal">
	      <div class="downcal">
	        
	        <div id="embeddedExample" style="">
	          <div id="embeddedCalendar" style="margin-left: auto; margin-right: auto">
	          </div>
	        </div>
	      </div>
	    </div>
	    
	    <div class="noticeboard">
	    	<%
	    	List<Notice> list=NoticeDao.getRecords();
			String sub="";
			String deString="";
			String date="";
			for(Notice n:list) {
				sub=n.getSubject();
				deString=n.getDescription();
				date=n.getDate();
			}
	    	%>
	    	<div class="notice">
	    		<div class="n-head">
	    			<i class="fa fa-newspaper-o" aria-hidden="true"></i>
					<h3>Notice Board</h3>
					<p>Date: <%=date %></p>
	    		</div>
	    		<div class="n-content">
	    			<div class="head-title">
	    				<h5>Sub: <%=sub %></h5>
	    			</div>
	    			<div class="paragrap">
	    				<textarea rows="9" cols="43" disabled>      <%=deString %></textarea>
	    			</div>
	    			
	    		</div>
	    	</div>
	    	
	    </div>
	</section>
	
	<section id="section-footer">
		<div class="footer">
			<h2> 2017 @ Hospital Management System</h2>
			<p>Design and developed By mahfuz</p>
		</div>
	</section>
	 
	</body>
	</html>

<%} else{%>
	you dont login !!!. Please <a href="../adminLogin.jsp">try again</a>
	<script>
		window.alert("Please Login");
	</script> 
<%}%>