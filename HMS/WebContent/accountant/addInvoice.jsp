<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="invoice" class="bean.Invoice" scope="request">
	<jsp:setProperty property="title" name="invoice" value='<%=request.getParameter("title") %>'/>
	<jsp:setProperty property="amount" name="invoice" value='<%=Double.parseDouble(request.getParameter("amount")) %>'/>
	<jsp:setProperty property="patientName" name="invoice" value='<%=request.getParameter("patient") %>'/>
	<jsp:setProperty property="presId" name="invoice" value='<%=Integer.parseInt(request.getParameter("presid")) %>'/>
	<jsp:setProperty property="date" name="invoice" value='<%=request.getParameter("date") %>'/>
</jsp:useBean>
<jsp:forward page="../AddInvoice">
	<jsp:param value="<%=invoice.getTitle() %>" name="title"/>
	<jsp:param value="<%=invoice.getAmount() %>" name="amount"/>
	<jsp:param value="<%=invoice.getPatientName() %>" name="patient"/>
	<jsp:param value="<%=invoice.getPresId() %>" name="presid"/>
	<jsp:param value="<%=invoice.getDate() %>" name="date"/>
</jsp:forward>
</body>
</html>