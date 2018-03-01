<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
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
			<h1>Add New Doctor</h1>
		</div>
		<div class="fullForm">
			<div class="addForm">
			<!-- adding a doctor information -->
			
				<form id="form1" action="doctorBean.jsp" method="post">
					<div class="tt">
						<div class="inputtext">
							<input type="text" name="doctorname" value="" placeholder="doctor name">
						</div>
						<div class="inputtext" >
							<input type="email" name="doctoremail" value="" placeholder="email">
						</div>
						<div class="gender">
							<input type="radio" name="gender" value="male" checked>Male
							<input type="radio" name="gender" value="female">Female
							<input type="radio" name="gender" value="other">Other
						</div>
						<div class="inputtext">
							<input type="password" name="password" value="" placeholder="password">
						</div>
						<div class="inputtext">
							<input type="text" name="doctoraddress" value="" placeholder="address">
						</div>
						<div class="inputtext">
							<input type="text" name="doctorphone" value="" placeholder="phone number">
						</div>
						
						<div>
						
							<select class="selectpicker" name="department">
							<!-- collecting department information form department table in database -->
								<option value="" selected>Department</option>
							<%
								Connection con=null;
								Statement stmt=null;
								ResultSet rs=null;
								con=DbConnector.getConnection();
								try{
									stmt=con.createStatement();
									String sql="select dep_name from department";
									rs=stmt.executeQuery(sql);
									while(rs.next()){%>
										<%String dpName=rs.getString("dep_name"); %>
										<option value="<%=dpName%>"><%=dpName%></option>
									<%} 
								}catch(Exception e) {
									e.printStackTrace();
								}
								finally{
									stmt.close();
								}
							%>
							</select>
						</div>
						<div class="inputtext">
							<input type="text" name="doctordegree" value="" placeholder="degree">
						</div>
						
					
					
					<div class="btn-group">
					  <a href="javascript:;" onclick="document.getElementById('form1').submit();" class="btn btn-primary">Save</a>
					  <input type="hidden" name="mess" value="Save"/>
					</div>	
					<div class="btn-group">
					  <button class="btn btn-primary" type="reset" cursor="hand">Reset</button>
					</div>
					<div>
					<!-- this output should come from servlet(AddDoctorInfo.java) -->
						<%if(request.getAttribute("message")!=null) {%>
							<script type="text/javascript">
								window.alert('<%=request.getAttribute("message")%>')
							</script>
						<%} %>
					</div>
				</div>
				</form>
			</div>
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