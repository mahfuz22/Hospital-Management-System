<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="patientBean" class="bean.AddPatient" scope="request">
		<jsp:setProperty name="patientBean" property="patientName" value='<%=request.getParameter("patientname") %>'/>
		<jsp:setProperty name="patientBean" property="patientEmail" value='<%=request.getParameter("patientemail") %>'/>
		<jsp:setProperty name="patientBean" property="patientPass" value='<%=request.getParameter("patientpassword") %>'/>
		<jsp:setProperty name="patientBean" property="patientAddr" value='<%=request.getParameter("pateintaddress") %>'/>
		<jsp:setProperty name="patientBean" property="patientPhone" value='<%=request.getParameter("patientphone") %>'/>
		<jsp:setProperty name="patientBean" property="gender" value='<%=request.getParameter("gender") %>'/>
		<jsp:setProperty name="patientBean" property="birthDay" value='<%=request.getParameter("patientbirthday") %>'/>
		<jsp:setProperty name="patientBean" property="age" value='<%=request.getParameter("patientage") %>'/>
		<jsp:setProperty name="patientBean" property="bloodGroup" value='<%=request.getParameter("bloodgroup") %>'/>
		
	</jsp:useBean>
	
	<jsp:forward page="../nurseAddPatient">
		<jsp:param value='<%=session.getAttribute("userMail") %>' name="userMail"/>
		<jsp:param value="<%=patientBean.getPatientName() %>" name="pname"/>
		<jsp:param value="<%=patientBean.getPatientEmail() %>" name="pemail"/>
		<jsp:param value="<%=patientBean.getPatientPass() %>" name="ppass"/>
		<jsp:param value="<%=patientBean.getPatientAddr() %>" name="paddr"/>
		<jsp:param value="<%=patientBean.getPatientPhone() %>" name="pphone"/>
		<jsp:param value="<%=patientBean.getGender() %>" name="pgender"/>
		<jsp:param value="<%=patientBean.getBirthDay() %>" name="pbd"/>
		<jsp:param value="<%=patientBean.getAge() %>" name="page"/>
		<jsp:param value="<%=patientBean.getBloodGroup() %>" name="pbg"/>
		
	</jsp:forward>
</body>
</html>