<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="test" class="bean.Test" scope="request">
	<jsp:setProperty name="test" property="testType" value='<%=request.getParameter("type") %>'/>
	<jsp:setProperty name="test" property="testFee" value='<%=Double.parseDouble(request.getParameter("rate")) %>'/>
	<jsp:setProperty name="test" property="description" value='<%=request.getParameter("description") %>'/>
		
</jsp:useBean>
<jsp:forward page="../AddTest">
	<jsp:param value="<%=test.getTestType() %>" name="type"/>
	<jsp:param value="<%=test.getTestFee() %>" name="rate"/>
	<jsp:param value="<%=test.getDescription() %>" name="description"/>
</jsp:forward>
</body>
</html>