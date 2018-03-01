<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="eNurse" class="bean.AddNurse" scope="request">
		<jsp:setProperty name="eNurse" property="nurseName" value='<%=request.getParameter("name") %>'/>
		<jsp:setProperty name="eNurse" property="nurseEmail" value='<%=request.getParameter("email") %>'/>
		<jsp:setProperty name="eNurse" property="nurseAddress" value='<%=request.getParameter("address") %>'/>
		<jsp:setProperty name="eNurse" property="nursePhone" value='<%=request.getParameter("phone") %>'/>
		
	</jsp:useBean>
	
	<jsp:forward page="../EditNurse">
		<jsp:param value='<%=session.getAttribute("userMail") %>' name="userEmail"/>
		<jsp:param value="<%=eNurse.getNurseName() %>" name="name"/>
		<jsp:param value="<%=eNurse.getNurseEmail() %>" name="email"/>
		<jsp:param value="<%=eNurse.getNurseAddress() %>" name="address"/>
		<jsp:param value="<%=eNurse.getNursePhone() %>" name="phone"/>
	</jsp:forward>
</body>
</html>