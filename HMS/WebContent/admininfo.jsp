<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:useBean id="adminLogin" class="bean.AdminLoginBean" scope="request">
		<jsp:setProperty name="adminLogin" property="email" value='<%=request.getParameter("email")%>'/>
		<jsp:setProperty name="adminLogin" property="password" value='<%=request.getParameter("password") %>'/>
		
	</jsp:useBean>
	<jsp:forward page="AdminLogin">
		<jsp:param value="<%=adminLogin.getEmail() %>" name="email"/>
		<jsp:param value="<%=adminLogin.getPassword() %>" name="pass"/>
	</jsp:forward>
	
</body>
</html>