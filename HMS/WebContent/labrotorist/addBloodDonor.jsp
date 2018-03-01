<%@page import="bean.BloodDonor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bloodDonor" class="bean.BloodDonor" scope="request">
		<jsp:setProperty name="bloodDonor" property="name" value='<%=request.getParameter("donorname") %>'/>
		<jsp:setProperty name="bloodDonor" property="email" value='<%=request.getParameter("email") %>'/>
		<jsp:setProperty name="bloodDonor" property="address" value='<%=request.getParameter("address") %>'/>
		<jsp:setProperty name="bloodDonor" property="phoneNumber" value='<%=Integer.parseInt(request.getParameter("phone")) %>'/>
		<jsp:setProperty name="bloodDonor" property="sex" value='<%=request.getParameter("sex") %>'/>
		<jsp:setProperty name="bloodDonor" property="age" value='<%=Integer.parseInt(request.getParameter("age")) %>'/>
		<jsp:setProperty name="bloodDonor" property="bloodGroup" value='<%=request.getParameter("bloodgroup") %>'/>
		<jsp:setProperty name="bloodDonor" property="lastDonationDate" value='<%=request.getParameter("lastdonation") %>'/>
		
	</jsp:useBean>
	<jsp:forward page="../AddBloodDonorByLab">
		<jsp:param value="<%=bloodDonor.getName() %>" name="name"/>
		<jsp:param value="<%=bloodDonor.getEmail() %>" name="email"/>
		<jsp:param value="<%=bloodDonor.getAddress() %>" name="address"/>
		<jsp:param value="<%=bloodDonor.getPhoneNumber() %>" name="phone"/>
		<jsp:param value="<%=bloodDonor.getSex() %>" name="sex"/>
		<jsp:param value="<%=bloodDonor.getAge() %>" name="age"/>
		<jsp:param value="<%=bloodDonor.getBloodGroup() %>" name="bloodgroup"/>
		<jsp:param value="<%=bloodDonor.getLastDonationDate() %>" name="lastDonate"/>
		
	</jsp:forward>
</body>
</html>