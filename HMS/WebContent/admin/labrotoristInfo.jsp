<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.*" %>
<%if(session.getAttribute("userEmail")!=null || session.getAttribute("userEmail")==""){%>
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
				  <li ><a href="../admin/adminPanel.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
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
	                  <a href="#">
	                  <i class="fa fa-user fa-lg"></i> Profile
	                  </a>
	                  </li>
					
					
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
					<th>Dr. Id</th>
					<th>Doctor name</th>
					<th>Phone</th>
					<th>Department</th>
					<th>Degree</th>
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
						String sql="select * from doctor";
						rs=stm.executeQuery(sql);
						while(rs.next()) {%>	
							<%int dId=rs.getInt("d_id"); 
							  String dName=rs.getString("d_name");
							  String dsp=rs.getString("department");
							  String phone=rs.getString("phone");
							  String degree=rs.getString("d_degree") ;
							%>
						<tr>
							<td><%=dId %></td>
							<td><%=dName%></td>
							<td><%=phone %></td>
							<td><%=dsp %></td>
							<td><%=degree %></td>
							<td><div class="action">
									<abbr title="Delete"><a href="deleteDocInfo.jsp?id=<%=dId%>"> <i class="fa fa-trash"></i></a></abbr>
									<abbr title="edit"><a href="editDoctor.jsp?id=<%=dId%>"> <i class="fa fa-pencil-square-o" ></i></a></abbr>
									<abbr title="Full Information"><a href="#"> <i class="fa fa-info-circle" ></i></a></abbr>
								</div>
							</td>
						</tr>
						<%}%>	
				<%	
					}catch(Exception e){
						e.printStackTrace();
					}
				
				%>
				
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
	you dont login !!!. Please <a href="../adminLogin.jsp">try again</a>
	<script>
		window.alert("Please Login");
	</script> 
<%}%>