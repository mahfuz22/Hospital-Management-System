<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.*" %>
<%if(session.getAttribute("userMail")!=null || session.getAttribute("userMail")==""){%>
	<!DOCTYPE html>
	<html>
	<head>
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
	  	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../css/style2.css">
	  
	
	</head>
	<body>
	
	
	<div class="header">
	        <h1>Hospital Management System</h1>
	        <div class="link">
	        	<ul>
				  <li ><a href="../doctor/doctorPanel.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
				  <li ><a href="#">Profile</a></li>
				  <li ><a href="#">Messages</a></li>
				</ul>
	        </div>
	        <div class="dropdown">
	          <a class="dropbtn" href="#"><i class="fa fa-user" aria-hidden="true"></i>
	          </a>
	          <div class="dropdown-content">
	            <i class="fa fa-user" aria-hidden="true"></i>
	           
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
	                <li>
	                  <a href="../doctor/doctorPanel.jsp">
	                  <i class="fa fa-dashboard fa-lg"></i> Dashboard
	                  </a>
	                </li>
	                
	                <li>
		                  <a href="../doctor/addPatient.jsp?page=1">
		                  <i class="fa fa-user fa-lg"></i> Patient
		                  </a>
	                  </li>
	
	                 <li>
	                  <a href="../doctor/docAppointment.jsp?page=1">
	                  <i class="fa fa-info-circle"></i> Manage Appointment
	                  </a>
	                  </li>
	                  
	                  <li>
	                  <a href="../doctor/docPrescription.jsp?page=1">
	                  <i class="fa fa-stethoscope"></i> Manage Prescription
	                  </a>
	                  </li>
	                  
	                  <li>
	                  <a href="../doctor/bedAllotment.jsp?page=1">
	                  <i class="fa fa-bed"></i> Bed Allotment
	                  </a>
	                  </li>
	                  
	                  <li>
	                  <a href="../doctor/viewBloodB.jsp?page=1">
	                  <i class="fa fa-tint"></i> View Blood Bank
	                  </a>
	                  </li>
	                  
	                  <li>
	                  <a href="../doctor/manageReport.jsp?page=1">
	                  <i class="fa fa-info-circle"></i> Manage Report
	                  </a>
	                  </li>
	                  
	                  <li>
	                  <a href="../doctor/doctorProfile.jsp">
	                  <i class="fa fa-lock"></i> Profile
	                  </a>
	                  </li>
	
	                 
	
	                
	
		            <!--<li data-toggle="collapse" data-target="#service" class="collapsed">
		                  <a href="#"><i class="fa fa-globe fa-lg"></i> Services <span class="arrow"></span></a>
		                </li>  
		                <ul class="sub-menu collapse" id="service">
		                  <li>New Service 1</li>
		                  <li>New Service 2</li>
		                  <li>New Service 3</li>
		                </ul>
					-->
					
					
	            </ul>
	     </div>
	</div>
	<div class="container">
		<div class="dd">
			<div class="ddh">
				<h1>Doctor Information</h1>
			</div>
			<div class="ddbutton">
				<input type="search" name="search" value="" placeholder="search here">
				<a href="#"><i class="fa fa-search"></i></a>
			</div>
		</div>
		<div class="table">
			<table align="center">
				<thead>
					<th>Patient id</th>
					<th>Patient name</th>
					<th>Email</th>
					<th>Action</th>
				</thead>
				
				<tbody>
				<%
				
					Connection con=null;
					Statement stm=null;
					ResultSet rs=null;
					con=DbConnector.getConnection();
					stm=con.createStatement();
					try{
						String sql="select * from patient";
						rs=stm.executeQuery(sql);
						while(rs.next()) {%>	
							<%int pId=rs.getInt("p_id"); 
							  String pName=rs.getString("p_name");
							  String pemail=rs.getString("email");
							%>
						<tr>
							<td><%=pId %></td>
							<td><%=pName%></td>
							<td><%=pemail %></td>
							<td><div class="action">
									<abbr title="Delete"><a href="deletePatient.jsp?id=<%=pId%>"> <i class="fa fa-trash"></i></a></abbr>
									<abbr title="edit"><a href="#"> <i class="fa fa-pencil-square-o" ></i></a></abbr>
								</div>
							</td>
						</tr>
						<%}%>	
				<%	
					}catch(Exception e){
						e.printStackTrace();
					}
				
				%>
				<!--  
					<tr>
						<td>6</td>
						<td>6</td>
						<td>iiiiiiiiiiiiiiiiiii6</td>
						<td>6</td>
						<td><div class="action">
								<abbr title="Delete"><a href="#"> <i class="fa fa-trash"></i></a></abbr>
								<abbr title="edit"><a href="#"> <i class="fa fa-pencil-square-o" ></i></a></abbr>
							</div>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td>6</td>
						<td>iiiiiiiiiiiiiiiiiii6</td>
						<td>6</td>
						<td><div class="action">
								<abbr title="Delete"><a href="#"> <i class="fa fa-trash"></i></a></abbr>
								<abbr title="edit"><a href="#"> <i class="fa fa-pencil-square-o" ></i></a></abbr>
							</div>
						</td>
					</tr> 
					-->
				</tbody>
			</table>
		</div>
		<div class="footer">
			<h2> 2017 @ Hospital Management System</h2>
			<p>Design and developed By mahfuz</p>
		</div>
	</div>
	
	
	  <script type="text/javascript" src="../js/jquery-3.1.1.min.js" ></script>
	  <script type="text/javascript" src="../js/bootstrap.min.js" ></script>
	</body>
	</html>

<%} else{%>
	you dont login !!!. Please <a href="../index.jsp">try again</a>
	<script>
		window.alert("Please Login");
	</script> 
<%}%>