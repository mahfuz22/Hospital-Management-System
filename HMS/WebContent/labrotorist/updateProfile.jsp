<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="labrotorist" class="bean.Labrotorist" scope="request">
		<jsp:setProperty name="labrotorist" property="name" value='<%=request.getParameter("name") %>'/>
		<jsp:setProperty name="labrotorist" property="email" value='<%=request.getParameter("email") %>'/>
		<jsp:setProperty name="labrotorist" property="address" value='<%=request.getParameter("address") %>'/>
		<jsp:setProperty name="labrotorist" property="phone" value='<%=request.getParameter("phone") %>'/>
		
	</jsp:useBean>
	
	<jsp:forward page="../UpdateLabrotorist">
		<jsp:param value='<%=session.getAttribute("userMail") %>' name="userEmail"/>
		<jsp:param value="<%=labrotorist.getName() %>" name="name"/>
		<jsp:param value="<%=labrotorist.getEmail() %>" name="email"/>
		<jsp:param value="<%=labrotorist.getAddress() %>" name="address"/>
		<jsp:param value="<%=labrotorist.getPhone() %>" name="phone"/>
	</jsp:forward>
</body>
</html>