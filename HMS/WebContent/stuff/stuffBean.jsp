<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="stuffBean" class="bean.AddStuff" scope="request">
		<jsp:setProperty name="stuffBean" property="stuffName" value='<%=request.getParameter("stuffname") %>'/>
		<jsp:setProperty name="stuffBean" property="stuffEmail" value='<%=request.getParameter("stuffemail") %>'/>
		<jsp:setProperty name="stuffBean" property="gender" value='<%=request.getParameter("gender") %>'/>
		<jsp:setProperty name="stuffBean" property="password" value='<%=request.getParameter("password") %>'/>
		<jsp:setProperty name="stuffBean" property="stuffAddress" value='<%=request.getParameter("stuffaddress") %>'/>
		<jsp:setProperty name="stuffBean" property="stuffPhone" value='<%=request.getParameter("stuffphone") %>'/>
		
	</jsp:useBean>
	<jsp:forward page="../AddStuffInfo">
		<jsp:param value="<%=stuffBean.getStuffName() %>" name="stName"/>
		<jsp:param value="<%=stuffBean.getStuffEmail() %>" name="stEmail"/>
		<jsp:param value="<%=stuffBean.getGender() %>" name="stGender"/>
		<jsp:param value="<%=stuffBean.getPassword() %>" name="stPass"/>
		<jsp:param value="<%=stuffBean.getStuffAddress() %>" name="stAddr"/>
		<jsp:param value="<%=stuffBean.getStuffPhone() %>" name="stPhone"/>
		
	</jsp:forward>
</body>
</html>