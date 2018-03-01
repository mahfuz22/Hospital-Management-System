<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="mc" class="bean.MedicineCategory" scope="request">
		<jsp:setProperty name="mc" property="categoryName" value='<%=request.getParameter("categoryname") %>'/>
		<jsp:setProperty name="mc" property="description" value='<%=request.getParameter("description") %>'/>
	</jsp:useBean>
	<jsp:forward page="../AddMedicineCat">
		<jsp:param value="<%=mc.getCategoryName() %>" name="categoryname"/>
		<jsp:param value="<%=mc.getDescription()%>" name="description"/>
	</jsp:forward>
</body>
</html>