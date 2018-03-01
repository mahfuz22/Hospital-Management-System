<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="prescription" class="bean.Prescription" scope="request">
		<jsp:setProperty name="prescription" property="doctorName" value='<%=request.getParameter("doctorname") %>'/>
		<jsp:setProperty name="prescription" property="patientName" value='<%=request.getParameter("patientname") %>'/>
		<jsp:setProperty name="prescription" property="caseHistory" value='<%=request.getParameter("casehistory") %>'/>
		<jsp:setProperty name="prescription" property="medication" value='<%=request.getParameter("medication") %>'/>
		<jsp:setProperty name="prescription" property="mediPherma" value='<%=request.getParameter("medipherma") %>'/>
		<jsp:setProperty name="prescription" property="description" value='<%=request.getParameter("description") %>'/>
		<jsp:setProperty name="prescription" property="date" value='<%=request.getParameter("date") %>'/>
		
	</jsp:useBean>
	
	<jsp:forward page="../AddPrescription">
		<jsp:param value="<%=prescription.getDoctorName() %>" name="doctorName"/>
		<jsp:param value="<%=prescription.getPatientName() %>" name="patientName"/>
		<jsp:param value="<%=prescription.getCaseHistory() %>" name="caseHistory"/>
		<jsp:param value="<%=prescription.getMedication() %>" name="medication"/>
		<jsp:param value="<%=prescription.getMediPherma() %>" name="mediPherma"/>
		<jsp:param value="<%=prescription.getDescription() %>" name="description"/>
		<jsp:param value="<%=prescription.getDate() %>" name="date"/>
		
	</jsp:forward>
</body>
</html>