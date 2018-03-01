<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="eDoctor" class="bean.AddDoctor" scope="request">
	<jsp:setProperty name="eDoctor" property="doctorName" value='<%=request.getParameter("name") %>'/>
	<jsp:setProperty name="eDoctor" property="doctorEmail" value='<%=request.getParameter("email") %>'/>
	<jsp:setProperty name="eDoctor" property="address" value='<%=request.getParameter("address") %>'/>
	<jsp:setProperty name="eDoctor" property="phone" value='<%=request.getParameter("phone") %>'/>
</jsp:useBean>
<jsp:forward page="../UpdateDoctor">
	<jsp:param value='<%=session.getAttribute("userMail") %>' name="usermail"/>
	<jsp:param value="<%=eDoctor.getDoctorName() %>" name="name"/>
	<jsp:param value="<%=eDoctor.getDoctorEmail() %>" name="email"/>
	<jsp:param value="<%=eDoctor.getAddress() %>" name="address"/>
	<jsp:param value="<%=eDoctor.getPhone() %>" name="phone"/>
	
</jsp:forward>
</body>
</html>