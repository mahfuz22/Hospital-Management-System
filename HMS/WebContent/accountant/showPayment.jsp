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
			  Show Payment</button>
			  
			  <div class="ddbutton">
				<input type="search" name="search" value="" placeholder="search here">
				<a href="#"><i class="fa fa-search"></i></a>
				</div>
			</div>
			
			<div id="London" class="tabcontent">
				<%
			  		int presid=Integer.parseInt(request.getParameter("presid"));
			  		String pateintName=request.getParameter("patientname");
			  	%>
			  	<%
			  				List<Prescription> list=PrescriptionDao.getRecords(presid);
			  				String doctorName="";
			  				String pName="";
			  				String date="";
			  				int id=0;
			  				String treatment="";
			  				for(Prescription p:list) {
			  					id=p.getId();
			  					doctorName=p.getDoctorName();
			  					pName=p.getPatientName();
			  					date=p.getDate();
			  				}

			  				double treatmentFee=DoctorDao.getTreatmentFeeByName(doctorName);
			  	%>
			  <%if(id!=0){ %>
			  <div class="tabcon">
			  	<%treatment="Treatment";%>
			  	<label>Treatment Fee</label>
			  	<table>
			  		<thead>
			  			<th>Prescription Id</th>
			  			<th>Doctor Name</th>
			  			<th>Patient Name</th>
			  			<th>Treatment Fee</th>
			  			<th>Date</th>
			  		</thead>
			  		<tbody>
			  			
						<tr>
											
							<td><%=id %></td>
							<td><%=doctorName %></td>
							<td><%=pName %></td>
							<td><%=treatmentFee %></td>
							<td><p><%=date %></p></td>
						</tr>
			  		</tbody>
			  	</table>
			  </div>
			  <%} %>
			  
			  
			  
			  <%
			  	List<Opetation> oList=OperationDao.getRecords(pateintName);
			  	int oId=0;
			  	String odoctorName="";
			  	String oPatientName="";
			  	String opType="";
			  	double opFee=0;
			  	String odate="";
			  	String operation="";
			  	for(Opetation o:oList) {
			  		oId=o.getId();
			  		odoctorName=o.getDoctorName();
			  		oPatientName=o.getPatientName();
			  		opType=o.getOpType();
			  		opFee=o.getOpFee();
			  		odate=o.getDate();
			  	}
			  %>
			  <%if(oPatientName!=""){ %>
			  <div class="tabcon">
			   <%operation="Operation";%>
			  	<label>Operation Fee</label>
			  	<table>
			  		<thead>
			  			<th>Operation Id</th>
			  			<th>Doctor Name</th>
			  			<th>Patient Name</th>
			  			<th>Operation Type</th>
			  			<th>Operation Fee</th>
			  			<th>Date</th>
			  		</thead>
			  		<tbody>
			  			
										<tr>
											<td><%=oId %></td>
							  				<td><%=odoctorName %></td>
							  				<td><%=oPatientName %></td>
							  				<td><%=opType %></td>
							  				<td><%=opFee %></td>
							  				<td><p><%=odate %></p></td>
							  			</tr>
			  		</tbody>
			  	</table>
			  </div>
			  <%} %>
			  
			  <%
			  	List<BedAllotment> bList=BedAllotmentDao.getAllotmentRecords(pateintName);
			  	int bedNo=0;
			  	String bPatientName="";
			  	String bedType="";
			  	double bedFee=0;
			  	String allotemetDate="";
			  	String dischargeDate="";
			  	String bed="";
			  	for(BedAllotment ba:bList) {
			  		bedNo=ba.getBedNumber();
			  		bPatientName=ba.getPatientName();
			  		bedType=ba.getBedType();
			  		allotemetDate=ba.getAllotmentDate();
			  		dischargeDate=ba.getDischargeDate();
			  	}
			  	bedFee=BedDao.getRateByType(bedType)*BedAllotmentDao.getTotalBedFee(allotemetDate, dischargeDate);
			  	
			  %>
			  <%if(bPatientName!=""){ %>
			  <div class="tabcon">
			  <%bed="Bed"; %>
			  	<label>Bed Fee</label>
			  	<table>
			  		<thead>
			  			<th>Bed No.</th>
			  			<th>Patient Name</th>
			  			<th>Bed Type</th>
			  			<th>Bed Fee</th>
			  			<th>Allotment Date</th>
			  			<th>Discharge Date</th>
			  		</thead>
			  		<tbody>
			  			
										<tr>
											<td><%=bedNo %></td>
							  				<td><%=bPatientName %></td>
							  				<td><%=bedType %></td>
							  				<td><%=bedFee %></td>
							  				<td><%=allotemetDate %></td>
							  				<td><p><%=dischargeDate %></p></td>
							  			</tr>
			  		</tbody>
			  	</table>
			  </div>
			  <%} %>
			  
			  <%
			  
			  	List<Sale> mList=SaleDao.getRecordsById(pateintName);
			  	int mId=0;
			  	String mPatientName="";
			  	double totalPrice=0;
			  	String mdate="";
			  	int presId=0;
			  	String medicine="";
			  	for(Sale m:mList) {
			  		mId=m.getId();
			  		mPatientName=m.getPatientName();
			  		totalPrice=m.getPrice();
			  		mdate=m.getDate();
			  		presId=m.getPres_id();
			  	}
			  %>
			  
			  <%if(mPatientName!=""){ %>
			  <div class="tabcon">
			  <%medicine="Medicine"; %>
			  	<label>Medicine Fee</label>
			  	<table>
			  		<thead>
			  			<th>ID</th>
			  			<th>Patient Name</th>
			  			<th>Total Price</th>
			  			<th>Date</th>
			  			<th>Prescription Id</th>
			  		</thead>
			  		<tbody>
			  			
										<tr>
											
											<td><%=mId %></td>
							  				<td><%=mPatientName %></td>
							  				<td><%=totalPrice %></td>
							  				<td><%=mdate %></td>
							  				<td><p><%=presId %></p></td>
							  			</tr>
			  		</tbody>
			  	</table>
			  </div>
			  <%} %>
			  
			  <%
			  	List<TestPatient> opList=TestPatientDao.getRecordsByPName(pateintName);
			  	int tId=0;
			  	String oPatientname="";
			  	String testType="";
			  	double testFee=0;
			  	String opdate="";
			  	int oppresId=0;
			  	String test="";
			  	for(TestPatient t:opList) {
			  		tId=t.getId();
			  		oPatientname=t.getPatientName();
			  		testType=t.getTestType();
			  		testFee=t.getLabFee();
			  		opdate=t.getDate();
			  		oppresId=t.getPresId();
			  	}
			  %>
			  <%if(oPatientname!=""){ %>
			  <div class="tabcon">
			  <%test="Test"; %>
			  	<label>Test Fee</label>
			  	<table>
			  		<thead>
			  			<th>Test Id</th>
			  			<th>Patient Name</th>
			  			<th>Test Type</th>
			  			<th>Test Fee</th>
			  			<th>Date</th>
			  			<th>Prescription Id</th>
			  		</thead>
			  		<tbody>
			  			
										<tr>
											
											<td><%=tId %></td>
							  				<td><%=oPatientname %></td>
							  				<td><%=testType %></td>
							  				<td><%=testFee %></td>
							  				<td><p><%=date %></p></td>
							  				<td><p><%=oppresId %></p></td>
							  			</tr>
			  		</tbody>
			  	</table>
			  </div>
			  <%} %>
			  
			  	<form id="form1" action="../accountant/addInvoice.jsp" method="post">
			  		
			  		<div>
			  			<%double totalAmount=treatmentFee+opFee+bedFee+totalPrice+testFee;
			  				String title=treatment+","+operation+","+bed+","+medicine+","+test;
			  			%>
			  			
			  			<input type="hidden" name="title" value="<%=title%> Fee"/>
			  			<input type="hidden" name="amount" value="<%=totalAmount%>"/>
			  			<input type="hidden" name="patient" value="<%=pName%>"/>
			  			<input type="hidden" name="presid" value="<%=presid%>"/>
			  			<input type="hidden" name="date" value="<%=request.getParameter("date")%>"/>
			  		</div>
				  	<div class="depbtn">
				  		<div class="btn-group">
						  <a href="javascript:;" onclick="document.getElementById('form1').submit();" class="btn btn-primary">Add Invoice</a>
						  <input type="hidden" name="mess" value="Save"/>
						</div>	
						
				  	</div>
				  	
			  	</form>
			  
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