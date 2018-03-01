<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.*" %>

<%if(session.getAttribute("userEmail")!=null || session.getAttribute("userEmail")=="" 
|| session.getAttribute("userMail")!=null || session.getAttribute("userMail")=="" ){%>
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
		<div>
			<div class="tab">
			  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen"><i class="fa fa-bars"></i>
			  Patient</button>
			  <button class="tablinks" onclick="openCity(event, 'Paris')"><i class="fa fa-plus-square"></i>
			  Add Patient</button>
			  <div class="ddbutton">
				<input type="search" name="search" value="" placeholder="search here">
				<a href="#"><i class="fa fa-search"></i></a>
				</div>
			</div>
			
			<div id="London" class="tabcontent">
			  <div class="tabcon">
			  	<table>
			  		<thead>
			  			<th>Patient Name</th>
			  			<th>Age</th>
			  			<th>Sex</th>
			  			<th>Blood Group</th>
			  			<th>Birth Date</th>
			  			<th>Action</th>
			  		</thead>
			  		<tbody>
			  			
			  			<!-- getting department information from database -->
			  			<%
								Connection con=null;
								Statement stmt=null;
								ResultSet rs=null;
								con=DbConnector.getConnection();
								try{
									stmt=con.createStatement();
									String sql="select p_id, p_name, p_age, p_gender, p_bloodgroup, p_birthday from patient";
									rs=stmt.executeQuery(sql);
									while(rs.next()){%>
										<%
											int pId=rs.getInt("p_id");
											String pName=rs.getString("p_name");
											String pAge=rs.getString("p_age"); 
											String sex=rs.getString("p_gender");
											String pBloodG=rs.getString("p_bloodgroup");
											String pBirthDate=rs.getString("p_birthday");
										%>
										<tr>
							  				<td><%=pName %></td>
							  				<td><p><%=pAge %></p></td>
							  				<td><p><%=sex %></p></td>
							  				<td><p><%=pBloodG %></p></td>
							  				<td><p><%=pBirthDate %></p></td>
							  				<td><div class="action">
													<abbr title="Delete"><a href="../patient/deletePatient.jsp?id=<%=pId%>"> <i class="fa fa-trash"></i></a></abbr>
													<abbr title="edit"><a href="../admin/editPatient.jsp?id=<%=pId%>"> <i class="fa fa-pencil-square-o" ></i></a></abbr>
												</div>
											</td>
							  			</tr>
									<%} 
								}catch(Exception e) {
									e.printStackTrace();
								}
								finally{
									stmt.close();
								}
							%>
			  		</tbody>
			  	</table>
			  </div>
			</div>
			
			<div id="Paris" class="tabcontent">
			  <div class="adddep">
			  	<form id="form1" action="../patient/patientBean.jsp" method="post">
			  		<div>
			  			<input type="text" name="patientname" value="" placeholder="patient name"/>
			  		</div>
			  		<div>
			  			<input type="email" name="patientemail" value="" placeholder="patient email" required/>
			  		</div>
			  		<div>
			  			<input type="password" name="patientpassword" value="" placeholder="password"/>
			  		</div>
			  		<div>
			  			<input type="text" name="pateintaddress" value="" placeholder="address"/>
			  		</div>
			  		<div>
			  			<input type="text" name="patientphone" value="" placeholder="phone"/>
			  		</div>
			  		
			  		<div class="pa-gen">
							<input type="radio" name="gender" value="male" checked>Male
							<input type="radio" name="gender" value="female">Female
							
							<input type="radio" name="gender" value="other">Other
					</div>
			  		
			  		<div>
			  			<input type="date" name="patientbirthday" value="" placeholder="birth date"/>
			  		</div>
			  		<div>
			  			<input type="text" name="patientage" value="" placeholder="Age"/>
			  		</div>
			  		<div>
			  			<select class="selectpic" name="bloodgroup">
			  				<option value="" selected>Blood Group</option>
			  				<option value="O+" >O +</option> 
			  				<option value="O-" >O -</option>
			  				<option value="A+" >A +</option>
			  				<option value="A-" >A -</option>
			  				<option value="B+" >B +</option>
			  				<option value="B-" >B -</option> 
			  				<option value="AB+" >B +</option>
			  				<option value="AB-" >B -</option>
			  			</select>
			  		</div>
			  		
				  	<div class="depbtn">
				  		<div class="btn-group">
						  <a href="javascript:;" onclick="document.getElementById('form1').submit();" class="btn btn-primary">Save</a>
						  <input type="hidden" name="mess" value="Save"/>
						</div>	
						<div class="btn-group">
						  <button class="btn btn-primary" type="reset" cursor="hand">Reset</button>
						</div>
				  	</div>
				  	
			  	</form>
			  </div> 
			</div>
			<div>
					<!-- this output should come from servlet(AddDepartInfo.java) -->
						<%if(request.getAttribute("message")!=null) {%>
							<script type="text/javascript">
								window.alert('<%=request.getAttribute("message")%>')
							</script>
							<%request.setAttribute("message", null); %>
						<%} %>
					</div>
	</div>
	<div class="footer">
			<h2> 2017 @ Hospital Management System</h2>
			<p>Design and developed By mahfuz</p>
		</div>
	</div>
	
	<script>
	function openCity(evt, cityName) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(cityName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
	
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
	</script>
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