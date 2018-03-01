<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- checking for admin -->
<%if(session.getAttribute("userEmail")!=null || session.getAttribute("userEmail")!=null) { %>
<%response.sendRedirect("admin/adminPanel.jsp"); %>

<!-- checking for user -->
<%}else if((request.getAttribute("user").equals("doctor"))&&(session.getAttribute("userMail")!=null || session.getAttribute("userMail")!="")){ %>
	 <%response.sendRedirect("doctor/doctorPanel.jsp"); %>
<%} else if((request.getAttribute("user").equals("nurse"))&&(session.getAttribute("userMail")!=null || session.getAttribute("userMail")!="")) {%>
	<%response.sendRedirect("nurse/nursePanel.jsp"); %>
<%} else if((request.getAttribute("user").equals("patient"))&&(session.getAttribute("userMail")!=null || session.getAttribute("userMail")!="")) {%>
	<%response.sendRedirect("patient/patientPanel.jsp"); %>
<%} else if((request.getAttribute("user").equals("stuff"))&&(session.getAttribute("userMail")!=null || session.getAttribute("userMail")!="")) {%>
	<%response.sendRedirect("stuff/stuffPanel.jsp"); %>
<%} else if((request.getAttribute("user").equals("labrotorist"))&&(session.getAttribute("userMail")!=null || session.getAttribute("userMail")!="")) {%>
	<%response.sendRedirect("labrotorist/labrotoristPanel.jsp"); %>
<%} else if((request.getAttribute("user").equals("accountant"))&&(session.getAttribute("userMail")!=null || session.getAttribute("userMail")!="")) {%>
	<%response.sendRedirect("accountant/accountantPanel.jsp"); %>
<%}%>
</body>
</html>