<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="uPatient" class="bean.AddPatient" scope="request">
	<jsp:setProperty name="uPatient" property="patientName" value='<%=request.getParameter("name") %>'/>
	<jsp:setProperty name="uPatient" property="patientEmail" value='<%=request.getParameter("email") %>'/>
	<jsp:setProperty name="uPatient" property="patientAddr" value='<%=request.getParameter("address") %>'/>
	<jsp:setProperty name="uPatient" property="patientPhone" value='<%=request.getParameter("phone") %>'/>
</jsp:useBean>
<jsp:forward page="../UpdatePateint">
	<jsp:param value='<%=request.getParameter("id") %>' name="id"/>
	<jsp:param value="<%=uPatient.getPatientName() %>" name="name"/>
	<jsp:param value="<%=uPatient.getPatientEmail() %>" name="email"/>
	<jsp:param value="<%=uPatient.getPatientAddr() %>" name="address"/>
	<jsp:param value="<%=uPatient.getPatientPhone() %>" name="phone"/>
	
</jsp:forward>
</body>
</html>