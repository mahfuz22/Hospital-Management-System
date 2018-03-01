<%@page import="bean.*"%>
<%@page import="bean.BloodDonor"%>
<%@page import="dao.*"%>
<%@page import="bean.Bed"%>
<%@page import="dao.PrescriptionDao"%>
<%@page import="bean.Prescription"%>
<%@page import="dao.PateintDao"%>
<%@page import="bean.AddPatient"%>
<%@page import="dao.DoctorDao"%>
<%@page import="bean.AddDoctor"%>
<%@page import="java.util.List"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
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
				  <li ><a href="../nurse/nursePanel.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
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
	                  <a href="../nurse/nursePanel.jsp">
	                  <i class="fa fa-dashboard fa-lg"></i> Dashboard
	                  </a>
	                </li>
					
					<li>
		                  <a href="../nurse/patient.jsp?page=1">
		                  <i class="fa fa-globe"></i> Patient
		                  </a>
	                  </li>
	
	                <li data-toggle="collapse" data-target="#new" class="collapsed">
	                  <a href="#"><i class="fa fa-bed"></i> Bed Ward <span class="arrow"></span></a>
	                </li>
	                <ul class="sub-menu collapse" id="new">
	                  <li><a href="../nurse/bed.jsp?page=1">Manage Bed</a></li>
	                  <li><a href="../nurse/bedAllotment.jsp?page=1">Manage Bed Allotment</a></li>
	                </ul>
	                
	                <li data-toggle="collapse" data-target="#service" class="collapsed">
	                  <a href="#"><i class="fa fa-tint"></i> Blood Bank <span class="arrow"></span></a>
	                </li>
	                <ul class="sub-menu collapse" id="service">
	                  <li><a href="../nurse/manageBloobBank.jsp">Manage Blood Bank</a></li>
	                  <li><a href="../nurse/manageBloodDonor.jsp?page=1">Manage Blood Donor</a></li>
	                </ul>
	                
	                <li>
		                  <a href="../nurse/manageReport.jsp?page=1">
		                  <i class="fa fa-sticky-note"></i> Report
		                  </a>
	                  </li>
	
	                 <li>
	                  <a href="#">
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
			  			<th># &#9660;</th>
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
			  					String spageid=request.getParameter("page");
			  					int pageId=Integer.parseInt(spageid);
			  					int total=5;
			  					int count=0;
			  					if(pageId==1){}
			  					else{
			  						pageId=pageId-1;
			  						pageId=pageId*total+1;
			  					}
			  					List<AddPatient> pList=PateintDao.getPatientRecord(pageId,total);
									for(AddPatient ap:pList){%>
										<tr>
											<%count++; %>
											<td><%=count %></td>
							  				<td><%=ap.getPatientName() %></td>
							  				<td><p><%=ap.getAge() %></p></td>
							  				<td><p><%=ap.getGender() %></p></td>
							  				<td><p><%=ap.getBloodGroup() %></p></td>
							  				<td><p><%=ap.getBirthDay() %></p></td>
							  				<td><div class="action">
													<abbr title="edit"><a href="../nurse/editPatient.jsp?id=<%=ap.getId()%>"> <i class="fa fa-pencil-square-o" ></i></a></abbr>
												</div>
											</td>
							  			</tr>
									<%} %>
			  		</tbody>
			  	</table>
			  </div>
			  
			  <div class="page">
			  	<a href="../nurse/patient.jsp?page=1">1</a>
				<a href="../nurse/patient.jsp?page=2">2</a>
				<a href="../nurse/patient.jsp?page=3">3</a>
				<a href="../nurse/patient.jsp?page=4">4</a>
				<a href="../nurse/patient.jsp?page=5">5</a>
				<a href="../nurse/patient.jsp?page=6">6</a>
			  </div>
			  
			</div>
			
			<div id="Paris" class="tabcontent">
			  <div class="adddep">
			  	<form id="form1" action="../nurse/addPatient.jsp" method="post">
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
			  				<option value="AB+" >AB +</option>
			  				<option value="AB-" >AB -</option>
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
	you dont login !!!. Please <a href="../index.jsp">try again</a>
	<script>
		window.alert("Please Login");
	</script> 
<%}%>
</html>