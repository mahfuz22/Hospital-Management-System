<%@page import="bean.BedAllotment"%>
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
		                  <a href="../nurse/patient.jsp?page=1">
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
			  Edit Bed Allotment</button>
			  
			  <div class="ddbutton">
				<input type="search" name="search" value="" placeholder="search here">
				<a href="#"><i class="fa fa-search"></i></a>
				</div>
			</div>
			
			<div id="London" class="tabcontent">
			  <div class="adddep">
			  	<form id="form1" action="../nurse/updateBedAllotment.jsp" method="post">
			  		
			  		<%
			  			int id=Integer.parseInt(request.getParameter("id"));
			  			int bedNumber=0;
			  			String bedType="";
			  			String patinetName="";
			  			String bedAllot="";
			  			String beddischarge="";
			  			List<BedAllotment> list=BedAllotmentDao.getRecordById(id);
			  			for(BedAllotment ba:list) {
			  				bedNumber=ba.getBedNumber();
			  				bedType=ba.getBedType();
			  				patinetName=ba.getPatientName();
			  				bedAllot=ba.getAllotmentDate();
			  				beddischarge=ba.getDischargeDate();
			  			}
			  		%>
			  		<div>
			  			<input type="hidden" name="id" value="<%=id %>"/>
			  			<input type="text" name="bednumber" value="<%=bedNumber %>" placeholder="" disabled/>
			  		</div>
			  		<div>
			  			<input type="text" name="bedtype" value="<%=bedType %>" placeholder="" disabled/>
			  		</div>
			  		<div>
			  			<input type="text" name="patientname" value="<%=patinetName %>" placeholder="" disabled/>
			  		</div>
			  		<div>
			  			<input type="date" name="bedAllotment" value="<%=bedAllot %>" placeholder="Allotment Date" />
			  		</div>
			  		<div>
			  			<input type="date" name="bedDischarge" value="<%=beddischarge %>" placeholder="Discharge Date"/>
			  		</div>
			  		
				  	<div class="depbtn">
				  		<div class="btn-group">
						  <a href="javascript:;" onclick="document.getElementById('form1').submit();" class="btn btn-primary">Update</a>
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
</html>