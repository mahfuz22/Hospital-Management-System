<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="donation" class="bean.AddDonate" scope="request">
	<jsp:setProperty name="donation" property="name" value='<%=request.getParameter("donorname") %>'/>
	<jsp:setProperty name="donation" property="bloodgroup" value='<%=request.getParameter("bloodgroup") %>'/>
</jsp:useBean>
<jsp:forward page="../AddDonationByLab">
	<jsp:param value="<%=donation.getName() %>" name="name"/>
	<jsp:param value="<%=donation.getBloodgroup() %>" name="bloodgroup"/>
</jsp:forward>
</body>
</html>