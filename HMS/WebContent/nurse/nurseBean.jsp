<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="nurseBean" class="bean.AddNurse" scope="request">
		<jsp:setProperty name="nurseBean" property="nurseName" value='<%=request.getParameter("nursename") %>'/>
		<jsp:setProperty name="nurseBean" property="nurseEmail" value='<%=request.getParameter("nurseemail") %>'/>
		<jsp:setProperty name="nurseBean" property="gender" value='<%=request.getParameter("gender") %>'/>
		<jsp:setProperty name="nurseBean" property="password" value='<%=request.getParameter("password") %>'/>
		<jsp:setProperty name="nurseBean" property="nurseAddress" value='<%=request.getParameter("nurseaddress") %>'/>
		<jsp:setProperty name="nurseBean" property="nursePhone" value='<%=request.getParameter("nursephone") %>'/>
		
	</jsp:useBean>
	<jsp:forward page="../AddNurseInfo">
		<jsp:param value="<%=nurseBean.getNurseName() %>" name="nurseName"/>
		<jsp:param value="<%=nurseBean.getNurseEmail() %>" name="nurseMail"/>
		<jsp:param value="<%=nurseBean.getGender() %>" name="gender"/>
		<jsp:param value="<%=nurseBean.getPassword() %>" name="pass"/>
		<jsp:param value="<%=nurseBean.getNurseAddress() %>" name="addr"/>
		<jsp:param value="<%=nurseBean.getNursePhone() %>" name="phone"/>
	</jsp:forward>
</body>
</html>