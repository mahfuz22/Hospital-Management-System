<%@page import="dao.ReportDao"%>
<%@page import="dao.PateintDao"%>
<%@page import="dao.DoctorDao"%>
<%@page import="bean.*"%>
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
	                  <a href="../nurse/nurseProfile.jsp">
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
			  Operation</button>
			  <button class="tablinks" onclick="openCity(event, 'Paris')"><i class="fa fa-plus-square"></i>
			  Birth</button>
			  <button class="tablinks" onclick="openCity(event, 'death')"><i class="fa fa-plus-square"></i>
			  Death</button>
			  <button class="tablinks" onclick="openCity(event, 'Other')"><i class="fa fa-plus-square"></i>
			  Other</button>
			  <button class="tablinks" onclick="openCity(event, 'AddReport')"><i class="fa fa-plus-square"></i>
			  Add Report</button>
			</div>
			
			<div id="London" class="tabcontent">
			  <div class="tabcon">
			  	<table>
			  		<thead>
			  			<th># &#9660; </th>
			  			<th>Description</th>
			  			<th>Date</th>
			  			<th>Doctor Name</th>
			  			<th>patient Name</th>
			  			<th>Action</th>
			  		</thead>
			  		<tbody>
			  			<%
				  			
			  				List<Report> list1=ReportDao.getRecordByType("operation");
			  			    int count1=0; 
			  				for(Report re:list1) {%>
			  					<%
			  					count1++;
			  					int id=re.getId();
			  					String description=re.getDescription();
			  					String date=re.getDate();
			  					String dName=re.getDoctorName();
			  					String pName=re.getPatientName();
			  					%>
			  					<tr>
							  				<td><%=count1 %></td>
							  				<td><p><%=description %></p></td>
							  				<td><p><%=date %></p></td>
							  				<td><p><%=dName %></p></td>
							  				<td><p><%=pName %></p></td>
							  				<td><div class="action">
							  					<abbr title="delete"><a href="../nurse/deleteReport.jsp?id=<%=id%>"> <i class="fa fa-trash" ></i></a></abbr>
												</div>
											</td>
							  	</tr>
			  				<%}
			  			%>
			  			
										
									
			  		</tbody>
			  	</table>
			  </div>
			  
			</div>
			
			<div id="Paris" class="tabcontent">
			  <div class="tabcon">
			  	<table>
			  		<thead>
			  			<th># &#9660; </th>
			  			<th>Description</th>
			  			<th>Date</th>
			  			<th>Doctor Name</th>
			  			<th>patient Name</th>
			  			<th>Action</th>
			  		</thead>
			  		<tbody>
			  			<%
				  			
			  				List<Report> list3=ReportDao.getRecordByType("birth");
			  			    int count2=0; 
			  				for(Report re:list3) {%>
			  					<%
			  					count2++;
			  					int id=re.getId();
			  					String description=re.getDescription();
			  					String date=re.getDate();
			  					String dName=re.getDoctorName();
			  					String pName=re.getPatientName();
			  					%>
			  					<tr>
							  				<td><%=count2 %></td>
							  				<td><p><%=description %></p></td>
							  				<td><p><%=date %></p></td>
							  				<td><p><%=dName %></p></td>
							  				<td><p><%=pName %></p></td>
							  				<td><div class="action">
							  					<abbr title="delete"><a href="../nurse/deleteReport.jsp?id=<%=id %>"> <i class="fa fa-trash" ></i></a></abbr>
												</div>
											</td>
							  	</tr>
			  				<%}
			  			%>
			  			
										
									
			  		</tbody>
			  	</table>
			  </div> 
			  
			</div>
			
			<div id="death" class="tabcontent">
			  <div class="tabcon">
			  	<table>
			  		<thead>
			  			<th># &#9660; </th>
			  			<th>Description</th>
			  			<th>Date</th>
			  			<th>Doctor Name</th>
			  			<th>patient Name</th>
			  			<th>Action</th>
			  		</thead>
			  		<tbody>
			  			<%
				  			
			  				List<Report> list4=ReportDao.getRecordByType("death");
			  			    int count3=0; 
			  				for(Report re:list4) {%>
			  					<%
			  					count3++;
			  					int id=re.getId();
			  					String description=re.getDescription();
			  					String date=re.getDate();
			  					String dName=re.getDoctorName();
			  					String pName=re.getPatientName();
			  					%>
			  					<tr>
							  				<td><%=count3 %></td>
							  				<td><p><%=description %></p></td>
							  				<td><p><%=date %></p></td>
							  				<td><p><%=dName %></p></td>
							  				<td><p><%=pName %></p></td>
							  				<td><div class="action">
							  					<abbr title="delete"><a href="../nurse/deleteReport.jsp?id=<%=id %>"> <i class="fa fa-trash" ></i></a></abbr>
												</div>
											</td>
							  	</tr>
			  				<%}
			  			%>
			  			
										
									
			  		</tbody>
			  	</table>
			  </div>
			</div>
			
			<div id="Other" class="tabcontent">
			  <div class="tabcon">
			  	<table>
			  		<thead>
			  			<th># &#9660; </th>
			  			<th>Description</th>
			  			<th>Date</th>
			  			<th>Doctor Name</th>
			  			<th>patient Name</th>
			  			<th>Action</th>
			  		</thead>
			  		<tbody>
			  			<%
				  			
			  				List<Report> list5=ReportDao.getRecordByType("other");
			  			    int count4=0; 
			  				for(Report re:list5) {%>
			  					<%
			  					count4++;
			  					int id=re.getId();
			  					String description=re.getDescription();
			  					String date=re.getDate();
			  					String dName=re.getDoctorName();
			  					String pName=re.getPatientName();
			  					%>
			  					<tr>
							  				<td><%=count4 %></td>
							  				<td><p><%=description %></p></td>
							  				<td><p><%=date %></p></td>
							  				<td><p><%=dName %></p></td>
							  				<td><p><%=pName %></p></td>
							  				<td><div class="action">
							  					<abbr title="delete"><a href="../nurse/deleteReport.jsp?id=<%=id %>"> <i class="fa fa-trash" ></i></a></abbr>
												</div>
											</td>
							  	</tr>
			  				<%}
			  			%>
			  			
										
									
			  		</tbody>
			  	</table>
			  </div>
			</div>
			
			<div id="AddReport" class="tabcontent">
			  <div class="adddep">
			  	<form id="form1" action="../nurse/addReport.jsp" method="post">
			  		<div>
			  			<select class="selectpic" name="type">
			  				<option value="" selected>Type</option>
			  				<option value="operation" >Operation</option> 
			  				<option value="death" >Death</option>
			  				<option value="birth" >Birth</option>
			  				<option value="other" >Other</option>
			  			</select>
			  		</div>
			  		<div>
			  			<input type="text" name="description" value="" placeholder="Description"/>
			  		</div>
			  		<div>
			  			<input type="date" name="date" value="" placeholder="Date"/>
			  		</div>
			  		<div>
			  			<select class="selectpic" name="doctorname">
			  				<option value="" selected>Doctor Name</option>
			  				<%
			  					List<AddDoctor> list=DoctorDao.getDoctorName();
			  					for(AddDoctor ad:list) { %>
			  						<%String doctorName=ad.getDoctorName(); %>
			  						<option value="<%=doctorName%>" ><%=doctorName%></option> 
			  					<%}
			  				%>
			  				
			  			</select>
			  		</div>
			  		<div>
			  			<select class="selectpic" name="patientname">
			  				<option value="" selected>Patient Name</option>
			  				<%
			  					List<AddPatient> list2=PateintDao.getPatientName();
			  					for(AddPatient ap:list2) {%>
			  						<%String patientName=ap.getPatientName(); %>
			  						<option value="<%=patientName%>" ><%=patientName%></option> 
			  					<%}
			  				%>
			  			</select>
			  		</div>
				  	<div class="depbtn">
				  		<div class="btn-group">
						  <a href="javascript:;" onclick="document.getElementById('form1').submit();" class="btn btn-primary">Add</a>
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