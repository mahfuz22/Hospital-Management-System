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
					</div>
					<div class="content">
					<form id="form1" action="admininfo.jsp" method="post">
						<input type="text" name="email" value="" placeholder="Enter your mail address">
						<input type="password" name="password" value="" placeholder="Enter your password">
						
						<a href="javascript:;" onclick="document.getElementById('form1').submit();">Login</a>
		   				<input type="hidden" name="mess" value="Login"/> 
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

