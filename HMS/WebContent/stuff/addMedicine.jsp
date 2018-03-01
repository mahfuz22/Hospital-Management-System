<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="am" class="bean.Medicine" scope="request">
	<jsp:setProperty name="am" property="medicineName" value='<%=request.getParameter("name") %>'/>
	<jsp:setProperty name="am" property="category" value='<%=request.getParameter("category") %>'/>
	<jsp:setProperty name="am" property="description" value='<%=request.getParameter("description") %>'/>
	<jsp:setProperty name="am" property="price" value='<%=Double.parseDouble(request.getParameter("price")) %>'/>
	<jsp:setProperty name="am" property="companyName" value='<%=request.getParameter("company") %>'/>
	<jsp:setProperty name="am" property="status" value='<%=Double.parseDouble(request.getParameter("status")) %>'/>
</jsp:useBean>
<jsp:forward page="../AddMedicine">
	<jsp:param value="<%=am.getMedicineName() %>" name="name"/>
	<jsp:param value="<%=am.getCategory() %>" name="category"/>
	<jsp:param value="<%=am.getDescription() %>" name="description"/>
	<jsp:param value="<%=am.getPrice() %>" name="price"/>
	<jsp:param value="<%=am.getCompanyName() %>" name="company"/>
	<jsp:param value="<%=am.getStatus() %>" name="status"/>
</jsp:forward>
</body>
</html>