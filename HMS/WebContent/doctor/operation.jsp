<%@page import="bean.AddDoctor"%>
<%@page import="bean.Appointment"%>
<%@page import="bean.Opetation"%>
<%@page import="bean.OperationType"%>
<%@page import="bean.AddPatient"%>
<%@page import="java.util.List"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.*" %>
<%@page import="dao.*" %>
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
	                  
	                  <li data-toggle="collapse" data-target="#service" class="collapsed">
	                  <a href="#"><i class="fa fa-tint"></i> Operation <span class="arrow"></span></a>
	                </li>
	                <ul class="sub-menu collapse" id="service">
	                  <li><a href="../doctor/operationType.jsp">Operation Type</a></li>
	                  <li><a href="../doctor/operation.jsp?page=1">Manage Operation</a></li>
	                </ul>
	                  
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
		<div>
			<div class="tab">
			  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen"><i class="fa fa-bars"></i>
			  Operation List</button>
			  <button class="tablinks" onclick="openCity(event, 'Paris')"><i class="fa fa-plus-square"></i>
			  Add Operation</button>
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
			  			<th>Doctor Name</th>
			  			<th>Patient Name</th>
			  			<th>Operation Type</th>
			  			<th>Date</th>
			  			<th>Description</th>
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
			  					List<Opetation> pList=OperationDao.getRecords(pageId, total);
									for(Opetation ap:pList){%>
										<tr>
											<%count++; %>
											<td><%=count %></td>
							  				<td><%=ap.getDoctorName() %></td>
							  				<td><p><%=ap.getPatientName()%></p></td>
							  				<td><p><%=ap.getOpType() %></p></td>
							  				<td><p><%=ap.getDate() %></p></td>
							  				<td><p><%=ap.getDescription() %></p></td>
							  				<td><div class="action">
							  						<abbr title="delete"><a href="../doctor/deleteOperation.jsp?id=<%=ap.getId()%>"> <i class="fa fa-trash" ></i></a></abbr>
							  						<abbr title="edit"><a href="../doctor/editOperation.jsp?id=<%=ap.getId()%>"> <i class="fa fa-pencil-square-o" ></i></a></abbr>
												</div>
											</td>
							  			</tr>
									<%} %>
			  		</tbody>
			  	</table>
			  </div>
			  
			  <div class="page">
			  	<a href="../doctor/operation.jsp?page=1">1</a>
				<a href="../doctor/operation.jsp?page=2">2</a>
				<a href="../doctor/operation.jsp?page=3">3</a>
				<a href="../doctor/operation.jsp?page=4">4</a>
				<a href="../doctor/operation.jsp?page=5">5</a>
				<a href="../doctor/operation.jsp?page=6">6</a>
			  </div>
			  
			</div>
			
			<div id="Paris" class="tabcontent">
			  <div class="adddep">
			  	<form id="form1" action="../doctor/addOperation.jsp" method="post">
			  		<div>
			  			<%
			  				String doctorEmail=session.getAttribute("userMail").toString();
			  				String doctorName="";
			  				List<AddDoctor> list3=DoctorDao.getDoctorName(doctorEmail);
			  				for(AddDoctor ad:list3) {
			  					doctorName=ad.getDoctorName();
			  				}
			  			%>
			  			<input type="text" name="doctorname" value="<%=doctorName %>" placeholder="Doctor name"/>
			  		</div>
			  		<div>
			  			<select class="selectpic" name="patientname">
			  				<option value="" selected>Patient Name</option>
					  		<%
					  			
					  			List<Appointment> list=AppointmentDao.getPatientNameByMail(doctorName);
					  			String patientName="";
					  			int count2=0;
					  			for(Appointment ap:list) {%>
					  			<%
					  				count2++;
					  				patientName=ap.getPatientName();
					  			%>
					  				
					  				<option value="<%=patientName%>" ><%=count2%>.<%=patientName%></option> 
					  			<%}
					  		%>
			  			</select>
			  		</div>
			  		<div>
			  			<select class="selectpic" name="operationtype">
			  				<option value="" selected>Operation Type</option>
			  				<%
			  					List<OperationType> list2=OperationTypeDao.getOperationtype();
			  					int count1=0;
			  					for(OperationType ot:list2) {%>
			  					<%count1++; %>
			  						<option value="<%=ot.getOperationtype()%>" ><%=count1%>.<%=ot.getOperationtype()%></option> 
			  					<%}
			  				%>
			  			</select>
			  		</div>
			  		<div>
			  			<input type="date" name="date" value="" placeholder="Date"/>
			  		</div>
			  		<div>
			  			<input type="text" name="description" value="" placeholder="Description"/>
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