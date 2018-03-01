<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="report" class="bean.Report" scope="request">
	<jsp:setProperty name="report" property="reportType" value='<%=request.getParameter("type") %>'/>
	<jsp:setProperty name="report" property="description" value='<%=request.getParameter("description") %>'/>
	<jsp:setProperty name="report" property="date" value='<%=request.getParameter("date") %>'/>
	<jsp:setProperty name="report" property="doctorName" value='<%=request.getParameter("doctorname") %>'/>
	<jsp:setProperty name="report" property="patientName" value='<%=request.getParameter("patientname") %>'/>
	
</jsp:useBean>

<jsp:forward page="../AddReport">
	<jsp:param value="<%=report.getReportType() %>" name="type"/>
	<jsp:param value="<%=report.getDescription() %>" name="description"/>
	<jsp:param value="<%=report.getDate() %>" name="date"/>
	<jsp:param value="<%=report.getDoctorName() %>" name="doctorname"/>
	<jsp:param value="<%=report.getPatientName() %>" name="patientname"/>
</jsp:forward>
</body>
</html>