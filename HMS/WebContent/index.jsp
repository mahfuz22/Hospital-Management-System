<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HMS</title>
	
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<section id="section-top">
	<div class="overlay">
		<div class="container">
			<div class="header">
				<img src="images/hims-logo2.png">
				<a href="adminLogin.jsp">Admin</a>
			</div>
			<div class="content">
			<form id="form1" action="userLogin.jsp" method="post">
				<select  name="userType">
					<option value="" selected>select one from list</option>
					<option value="doctor">Doctor</option>
					<option value="nurse">Nurse</option>
					<option value="stuff">Pharmacist</option>
					<option value="labrotorist">Labrotorist</option>
					<option value="accountant">Accountant</option>
				</select>
				<input type="text" name="email" value="" placeholder="Enter your mail address">
				<input type="password" name="password" value="" placeholder="Enter your password">
				<!--<a href="welcome.jsp">Login</a>  -->
				<a href="javascript:;" onclick="document.getElementById('form1').submit();">Login</a>
   				<input type="hidden" name="mess" value="Login"/>
   				
   				<!-- showing message for login success or failed --> 
   				<%if(request.getAttribute("error")!=null){ %>
   					<p><%=request.getAttribute("error") %></p>
   				<%} %>
			</form>	
			</div>
			<div class="social-icon">
				<a href="#"><i class="fa fa-facebook" ></i></a>
				<a href="#"><i class="fa fa-twitter" ></i></a>
				<a href="#"><i class="fa fa-linkedin" ></i></a>
				<a href="#"><i class="fa fa-google-plus"></i></a>
			</div>
		</div>
	</div>
</section>

<section id="section-bottom">
	<div class="footer">
		

	</div>
</section>
</body>
</html>