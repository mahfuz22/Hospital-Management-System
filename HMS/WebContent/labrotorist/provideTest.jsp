<%@page import="dao.*"%>
<%@page import="bean.*"%>
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
	                <li>
	                  <a href="../labrotorist/labrotoristPanel.jsp">
	                  <i class="fa fa-dashboard fa-lg"></i> Dashboard
	                  </a>
	                </li>
	                
	                <li data-toggle="collapse" data-target="#new" class="collapsed">
	                  <a href="#"><i class="fa fa-stethoscope"></i> Diagnosis <span class="arrow"></span></a>
	                </li>
	                <ul class="sub-menu collapse" id="new">
	                  <li><a href="../labrotorist/diagnosisTest.jsp?page=1">Diagnosis Test</a></li>
	                  <li><a href="../labrotorist/diagnosis.jsp?page=1">Diagnosis</a></li>
	                </ul>
	
	                 <li>
	                  <a href="../labrotorist/manageBloodBank.jsp?page=1">
	                  <i class="fa fa-tint"></i> Manage Blood Bank
	                  </a>
	                  </li>
	                  
	                  <li>
	                  <a href="../labrotorist/manageBloodDonor.jsp?page=1">
	                  <i class="fa fa-user"></i> Manage Blood Donor
	                  </a>
	                  </li>
	                  
	                  <li>
	                  <a href="../labrotorist/profile.jsp">
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
			  Prescription</button>
			  <div class="ddbutton">
				<input type="search" name="search" value="" placeholder="search here">
				<a href="#"><i class="fa fa-search"></i></a>
				</div>
			</div>
			
			<div id="London" class="tabcontent">
			  <div class="tabcon">
			  	<table>
			  		<thead>
			  			<th>Id </th>
			  			<th>Doctor</th>
			  			<th>Patient</th>
			  			<th>Case History </th>
			  			<th>Medication </th>
			  			<th>Medication from Phermacist </th>
			  			<th>Date </th>
			  		</thead>
			  		<tbody>
			  			
			  			<!-- getting department information from database -->
			  			<%
			  					int id=Integer.parseInt(request.getParameter("id"));
			  					List<Prescription> prList=PrescriptionDao.getRecords(id);
			  					String dName="";
			  					int pId=0;
			  					String pName="";
			  					String caseH="";
			  					String medication="";
			  					String medipherma="";
			  					String description="";
			  					String date="";
									for(Prescription p:prList){
											pId=p.getId();
											dName=p.getDoctorName();
											pName=p.getPatientName();
											caseH=p.getCaseHistory();
											medication=p.getMedication();
											medipherma=p.getMediPherma();
											description=p.getDescription();
											date=p.getDate();
									}
						%>
										<tr>
							  				<td><%=pId %></td>
							  				<td><p><%=dName %></p></td>
							  				<td><p><%=pName %></p></td>
							  				<td><p><%=caseH %></p></td>
							  				<td><%=medication %></td>
							  				<td><%=medipherma %></td>
							  				<td><%=date %></td>
							  			</tr>
			  		</tbody>
			  	</table>
			  </div>
			  <div class="adddep">
			  	<form id="form1" action="../labrotorist/testPatient.jsp" method="post">
			  		
			  		<div>
			  			<input type="text" name="pateintname" value="<%=pName %>"/>
			  			<input type="hidden" name="id" value="<%=id %>"/>
			  		</div>
			  		
			  		<div>
			  			<select class="selectpic" name="type">
								<option value="" selected>Test Type</option>
								<%
									List<Test> list=TestDao.getType();
									for(Test t:list) {%>
										<option value="<%=t.getTestType()%>"><%=t.getTestType()%></option>
									<%}
								%>
								
						</select>		
			  		</div>
			  		
			  		<div>
			  			<input type="text" name="date" value="" placeholder="date"/>
			  		</div>
			  		
			  		
				  	<div class="depbtn">
				  		<div class="btn-group">
						  <a href="javascript:;" onclick="document.getElementById('form1').submit();" class="btn btn-primary">Add Test</a>
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
					<!-- this output should come from servlet(AddBed.java) -->
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