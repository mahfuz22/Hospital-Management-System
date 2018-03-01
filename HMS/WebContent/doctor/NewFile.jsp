<!DOCTYPE html>
<%@page import="dao.PrescriptionDao"%>
<%@page import="dao.PateintDao"%>
<%@page import="bean.AddPatient"%>
<%@page import="dao.DoctorDao"%>
<%@page import="bean.AddDoctor"%>
<%@page import="java.util.List"%>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="../css/print.css">

	<script type="text/javascript">
		function printcontent(el) {
			var restorpage=document.body.innerHTML;
			var printcon=document.getElementById(el).innerHTML;
			document.body.innerHTML=printcon;
			window.print();
			document.body.innerHTML=restorpage;
		}

	</script>
</head>
<body>
<%
	String doctorName=request.getParameter("doctorname");
	String patientName=request.getParameter("patientname");
	int id=PrescriptionDao.getIdByName(patientName);
%>
<div id="div1">
	<div class="container2">
		<div class="pres-header">
			<div class="head1">
				<p>DAE# 65433334</p>
			</div>
			<div class="head1">
				<h1>Hospital Management System</h1>
			</div>
			<div class="head1">
				<h4>LIC#65433334</h4>
			</div>
		</div>
		<div class="pres-bottom">
			<div class="head2">
				<p>Phone: 01750539179</p>
			</div>
			<div class="head3">
				<p>www.hms.com</p>
			</div>
			<div class="head4">
				<p>Fax: 01750539179</p>
			</div>
		</div>
		<div class="press">
			<h2>Prescription</h2>
		</div>
		<div class="doctor">
			<div class="doc-name">
				<label>Doctor Name: </label>
				<input type="text" name="" value="<%=doctorName%>"></input>
			</div>
			<div class="doc-name">
			<%
				List<AddDoctor> list=DoctorDao.getDeptByName(doctorName);
				String dep="";
				for(AddDoctor ad:list) {
					dep=ad.getDepartment();
				}
			%>
				<label>Doctor Dept: </label>
				<input type="text" name="" value="<%=dep%>"></input>
			</div>
		</div>
		<div class="patient">
			<div class="any">
				<div class="age">
					<label>Patient Name: </label>
					<input type="text" name="" value="<%=patientName%>...<%=id%>"></input>
				</div>
				<div class="age1">
				<%
					List<AddPatient> list1=PateintDao.getPatient(patientName);
					String age="";
					String address="";
					for(AddPatient ap:list1) {
						address=ap.getPatientAddr();
						age=ap.getAge();
					}
				%>
					<label>Age: </label>
					<input type="text" name="" value="<%=age%>"></input>
				</div>
			</div>
			<div class="address">
				<label>Address: </label>
				<input type="text" name="" value="<%=address%>"></input>
			</div>
			<div class="date">
				<label>Date: </label>
				<input type="date" name="" value=""></input>
			</div>
		</div>
		<div class="main-press">
			<div class="rx">
				<img src="../images/rx.png"/>
			</div>
			<div class="medicine">
				<div class="col1">
					<label>1. </label>
					<input type="text" name="" value=""></input>
					<select>
						<option selected></option>
						<option>1 times per day</option>
						<option>2 times per day</option>
						<option>3 times per day</option>
					</select>
					<select>
						<option selected></option>
						<option>Before Eat</option>
						<option>After Eat</option>
					</select>
				</div>
				<div class="col1">
					<label>2. </label>
					<input type="text" name="" value=""></input>
					<select>
						<option selected></option>
						<option>1 times per day</option>
						<option>2 times per day</option>
						<option>3 times per day</option>
					</select>
					<select>
						<option selected></option>
						<option>Before Eat</option>
						<option>After Eat</option>
					</select>
				</div>
				<div class="col1">
					<label>3. </label>
					<input type="text" name="" value=""></input>
					<select>
						<option selected></option>
						<option>1 times per day</option>
						<option>2 times per day</option>
						<option>3 times per day</option>
					</select>
					<select>
						<option selected></option>
						<option>Before Eat</option>
						<option>After Eat</option>
					</select>
				</div>
				<div class="col1">
					<label>4. </label>
					<input type="text" name="" value=""></input>
					<select>
						<option selected></option>
						<option>1 times per day</option>
						<option>2 times per day</option>
						<option>3 times per day</option>
					</select>
					<select>
						<option selected></option>
						<option>Before Eat</option>
						<option>After Eat</option>
					</select>
				</div>
				<div class="col1">
					<label>5. </label>
					<input type="text" name="" value=""></input>
					<select>
						<option selected></option>
						<option>1 times per day</option>
						<option>2 times per day</option>
						<option>3 times per day</option>
					</select>
					<select>
						<option selected></option>
						<option>Before Eat</option>
						<option>After Eat</option>
					</select>
				</div>
				
			</div>
		</div>
		<div class="comment">
			<label>Comment: </label>
			<input type="text" name="" value=""></input>
		</div>
		<div class="signature">
			<label>Signature: </label>
			<input type="text" name="" value=""></input>
		</div>
	</div>
</div>
<button onclick="printcontent('div1')">Print</button>
</body>
</html>