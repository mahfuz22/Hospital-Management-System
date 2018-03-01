<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="sale" class="bean.Sale" scope="request">
		<jsp:setProperty name="sale" property="patientName" value='<%=request.getParameter("pateintname") %>'/>
		<jsp:setProperty name="sale" property="price" value='<%=Double.parseDouble(request.getParameter("price")) %>'/>
		<jsp:setProperty name="sale" property="date" value='<%=request.getParameter("date") %>'/>
	</jsp:useBean>
	<jsp:forward page="../UpdateSale">
		<jsp:param value='<%=request.getParameter("id") %>' name="id"/>
		<jsp:param value="<%=sale.getPatientName() %>" name="pname"/>
		<jsp:param value="<%=sale.getPrice() %>" name="price"/>
		<jsp:param value="<%=sale.getDate() %>" name="date"/>
	</jsp:forward>
</body>
</html>