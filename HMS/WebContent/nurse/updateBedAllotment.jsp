<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="upBedAllot" class="bean.BedAllotment" scope="request">
		<jsp:setProperty name="upBedAllot" property="allotmentDate" value='<%=request.getParameter("bedAllotment") %>'/>
		<jsp:setProperty name="upBedAllot" property="dischargeDate" value='<%=request.getParameter("bedDischarge") %>'/>
		
	</jsp:useBean>
	<jsp:forward page="../UpdateBedAllotment">
		<jsp:param value='<%=request.getParameter("id") %>' name="id"/>
		<jsp:param value="<%=upBedAllot.getAllotmentDate() %>" name="bedallotment"/>
		<jsp:param value="<%=upBedAllot.getDischargeDate() %>" name="beddischarge"/>
	</jsp:forward>
</body>
</html>