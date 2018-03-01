<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ubb" class="bean.BloodBank" scope="request">
	<jsp:setProperty name="ubb" property="status" value='<%=request.getParameter("status") %>'/>
	<jsp:setProperty name="ubb" property="bloodgroup" value='<%=request.getParameter("bloodgroup") %>'/>
		
</jsp:useBean>
<jsp:forward page="../UpdateBlood">
	<jsp:param value="<%=ubb.getStatus() %>" name="type"/>
	<jsp:param value="<%=ubb.getBloodgroup() %>" name="rate"/>
</jsp:forward>
</body>
</html>