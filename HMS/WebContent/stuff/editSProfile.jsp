<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="eNurse" class="bean.AddStuff" scope="request">
		<jsp:setProperty name="eNurse" property="stuffName" value='<%=request.getParameter("name") %>'/>
		<jsp:setProperty name="eNurse" property="stuffEmail" value='<%=request.getParameter("email") %>'/>
		<jsp:setProperty name="eNurse" property="stuffAddress" value='<%=request.getParameter("address") %>'/>
		<jsp:setProperty name="eNurse" property="stuffPhone" value='<%=request.getParameter("phone") %>'/>
		
	</jsp:useBean>
	
	<jsp:forward page="../EditStuff">
		<jsp:param value='<%=session.getAttribute("userMail") %>' name="userEmail"/>
		<jsp:param value="<%=eNurse.getStuffName() %>" name="name"/>
		<jsp:param value="<%=eNurse.getStuffEmail() %>" name="email"/>
		<jsp:param value="<%=eNurse.getStuffAddress() %>" name="address"/>
		<jsp:param value="<%=eNurse.getStuffPhone() %>" name="phone"/>
	</jsp:forward>
</body>
</html>