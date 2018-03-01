<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="operation" class="bean.Opetation" scope="request">
		<jsp:setProperty name="operation" property="doctorName" value='<%=request.getParameter("doctorname") %>'/>
		<jsp:setProperty name="operation" property="patientName" value='<%=request.getParameter("patientname") %>'/>
		<jsp:setProperty name="operation" property="opType" value='<%=request.getParameter("operationtype") %>'/>
		<jsp:setProperty name="operation" property="date" value='<%=request.getParameter("date") %>'/>
		<jsp:setProperty name="operation" property="description" value='<%=request.getParameter("description") %>'/>
		
	</jsp:useBean>
	<jsp:forward page="../AddOperation">
		<jsp:param value="<%=operation.getDoctorName() %>" name="doctorName"/>
		<jsp:param value="<%=operation.getPatientName() %>" name="patientName"/>
		<jsp:param value="<%=operation.getOpType() %>" name="optype"/>
		<jsp:param value="<%=operation.getDate() %>" name="date"/>
		<jsp:param value="<%=operation.getDescription() %>" name="description"/>
		
	</jsp:forward>
</body>
</html>