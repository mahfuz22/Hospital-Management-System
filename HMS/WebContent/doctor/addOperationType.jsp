<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="aot" class="bean.OperationType" scope="request">
	<jsp:setProperty name="aot" property="operationtype" value='<%=request.getParameter("operationtype") %>'/>
	<jsp:setProperty name="aot" property="fee" value='<%=Double.parseDouble(request.getParameter("operationfee")) %>'/>
	<jsp:setProperty name="aot" property="description" value='<%=request.getParameter("description") %>'/>
</jsp:useBean>

<jsp:forward page="../AddOperationType">
	<jsp:param value="<%=aot.getOperationtype() %>" name="type"/>
	<jsp:param value="<%=aot.getFee() %>" name="fee"/>
	<jsp:param value="<%=aot.getDescription() %>" name="description"/>
</jsp:forward>
</body>
</html>