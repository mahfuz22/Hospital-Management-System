<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="doctorBean" class="bean.AddDoctor" scope="request">
		<jsp:setProperty name="doctorBean" property="doctorName" value='<%=request.getParameter("doctorname") %>'/>
		<jsp:setProperty name="doctorBean" property="doctorEmail" value='<%=request.getParameter("doctoremail") %>'/>
		<jsp:setProperty name="doctorBean" property="gender" value='<%=request.getParameter("gender") %>'/>
		<jsp:setProperty name="doctorBean" property="password" value='<%=request.getParameter("password") %>'/>
		<jsp:setProperty name="doctorBean" property="address" value='<%=request.getParameter("doctoraddress") %>'/>
		<jsp:setProperty name="doctorBean" property="phone" value='<%=request.getParameter("doctorphone") %>'/>
		<jsp:setProperty name="doctorBean" property="department" value='<%=request.getParameter("department") %>'/>
		<jsp:setProperty name="doctorBean" property="degree" value='<%=request.getParameter("doctordegree") %>'/>
	</jsp:useBean>
	
	<jsp:forward page="../AddDoctorInfo">
		<jsp:param value="<%=doctorBean.getDoctorName() %>" name="dName"/>
		<jsp:param value="<%=doctorBean.getDoctorEmail() %>" name="dMail"/>
		<jsp:param value="<%=doctorBean.getGender() %>" name="dGender"/>
		<jsp:param value="<%=doctorBean.getPassword() %>" name="dPass"/>
		<jsp:param value="<%=doctorBean.getAddress() %>" name="dAddr"/>
		<jsp:param value="<%=doctorBean.getPhone() %>" name="dPhone"/>
		<jsp:param value="<%=doctorBean.getDepartment() %>" name="depart"/>
		<jsp:param value="<%=doctorBean.getDegree() %>" name="degree"/>
		
	</jsp:forward>
</body>
</html>