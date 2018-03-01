<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.*" %>
<%@page import="dao.*" %>
<%@page import="bean.*" %>
<%@page import="java.util.*" %>

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
				  <li ><a href="../accountant/accountantPanel.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
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
	                  <a href="../accountant/accountantPanel.jsp">
	                  <i class="fa fa-dashboard fa-lg"></i> Dashboard
	                  </a>
	                </li>
	                
	                <li>
		                  <a href="../accountant/invoice.jsp?page=1">
		                  <i class="fa fa-money"></i> Invoice/ Take Payment
		                  </a>
	                  </li>
	
	                 
	                  
	                  <li>
	                  <a href="../accountant/accountantProfile.jsp">
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
			  Invoice List</button>
			  <button class="tablinks" onclick="openCity(event, 'Paris')"><i class="fa fa-plus-square"></i>
			  Add Invoice</button>
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
			  			<th>Title</th>
			  			<th>Amount</th>
			  			<th>Patient</th>
			  			<th>Pres.Id</th>
			  			<th>Date</th>
			  			<th>Status</th>
			  		</thead>
			  		<tbody>
			  			
			  			<!-- getting department information from database -->
			  			<%
			  			String spageid=request.getParameter("page");
			  			int pageid=Integer.parseInt(spageid);
			  			int count=0;
			  			int total=5;
			  			if(pageid==1){}
			  			else{
			  				pageid=pageid-1;
			  				pageid=pageid*total+1;
			  			}
			  			
			  			
			  			List<Invoice> list=InvoiceDao.getRecords(pageid, total);
								
			  			for(Invoice e:list){%>
										<tr>
											<%count++; %>
											<td><%=count %></td>
							  				<td><p><%=e.getTitle() %></p></td>
							  				<td><p><%=e.getAmount() %></p></td>
							  				<td><p><%=e.getPatientName() %></p></td>
							  				<td><p><%=e.getPresId() %></p></td>
							  				<td><p><%=e.getDate() %></p></td>
							  				<td><p><a  target="blank" href="../accountant/takePayment.jsp?id=<%=e.getId()%>"><%=e.getStatus() %></a></p></td>
							  				
							  			</tr>
									<%} 
							%>
			  		</tbody>
			  	</table>
			  </div>
			  <div class="page">
			  	<a href="../accountant/invoice.jsp?page=1">1</a>
				<a href="../accountant/invoice.jsp?page=2">2</a>
				<a href="../accountant/invoice.jsp?page=3">3</a>
				<a href="../accountant/invoice.jsp?page=4">4</a>
				<a href="../accountant/invoice.jsp?page=5">5</a>
				<a href="../accountant/invoice.jsp?page=6">6</a>
			  </div>
			  
			</div>
			
			<div id="Paris" class="tabcontent">
			  <div class="adddep">
			  	<form id="form1" action="../accountant/showPayment.jsp" method="post">
			  		
			  		<div>
			  			<select class="selectpic" name="patientname">
							<!-- collecting pateint name  form patient table in database -->
								<option value="" selected>Select Patient name</option>
			  			<%
			  				List<Prescription> list2=PrescriptionDao.getAllName();
			  				for(Prescription p:list2) {%>
			  					<option value="<%=p.getPatientName()%>"><%=p.getPatientName()%></option>
			  				<%}
			  			%>
							
							
										
									
							</select>
						</div>
			  		<div>
			  			<input type="text" name="presid" value="" placeholder="Prescription Id"/>
			  		</div>
			  		
			  		<div>
			  			<input type="date" name="date" value="" placeholder="Date"/>
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