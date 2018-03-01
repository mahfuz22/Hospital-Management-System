<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="appointment" class="bean.Appointment" scope="request">
		<jsp:setProperty name="appointment" property="doctorName" value='<%=request.getParameter("doctorname") %>'/>
		<jsp:setProperty name="appointment" property="patientName" value='<%=request.getParameter("patientname") %>'/>
		<jsp:setProperty name="appointment" property="date" value='<%=request.getParameter("date") %>'/>
		
	</jsp:useBean>
	
	<jsp:forward page="../Appointment">
		<jsp:param value="<%=appointment.getDoctorName() %>" name="docName"/>
		<jsp:param value='<%=session.getAttribute("userMail") %>' name="docEmail"/>
		<jsp:param value="<%=appointment.getPatientName() %>" name="pName"/>
		<jsp:param value="<%=appointment.getDate() %>" name="date"/>
		
	</jsp:forward>
</body>
</html>