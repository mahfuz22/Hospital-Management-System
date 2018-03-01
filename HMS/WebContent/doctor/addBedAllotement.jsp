<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="allotment" class="bean.BedAllotment" scope="request">
		<jsp:setProperty name="allotment" property="bedType" value='<%=request.getParameter("bedtype") %>'/>
		<jsp:setProperty name="allotment" property="bedNumber" value='<%=Integer.parseInt(request.getParameter("bednumber")) %>'/>
		<jsp:setProperty name="allotment" property="patientName" value='<%=request.getParameter("patientname") %>'/>
		<jsp:setProperty name="allotment" property="allotmentDate" value='<%=request.getParameter("allotmentdate") %>'/>
		<jsp:setProperty name="allotment" property="dischargeDate" value='<%=request.getParameter("dischargedate") %>'/>
	</jsp:useBean>
	
	<jsp:forward page="../AddBedAllotmentByD">
		<jsp:param value="<%=allotment.getBedType() %>" name="bedtype"/>
		<jsp:param value="<%=allotment.getBedNumber() %>" name="bednumber"/>
		<jsp:param value="<%=allotment.getPatientName() %>" name="patientname"/>
		<jsp:param value="<%=allotment.getAllotmentDate() %>" name="allotmentdate"/>
		<jsp:param value="<%=allotment.getDischargeDate() %>" name="dischargedate"/>
	</jsp:forward>
</body>
</html>