<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="addDep" class="bean.AddDepartment" scope="request">
	<jsp:setProperty name="addDep" property="depName" value='<%=request.getParameter("depname") %>'/>
	<jsp:setProperty name="addDep" property="description" value='<%=request.getParameter("description") %>'/>
</jsp:useBean>

<jsp:forward page="../AddDepartInfo">
	<jsp:param value="<%=addDep.getDepName() %>" name="depname"/>
	<jsp:param value="<%=addDep.getDescription() %>" name="description"/>
		
</jsp:forward>
</body>
</html>