<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	Connection con=DbConnector.getConnection();
	try{
		String sql="delete from report where id='"+id+"'";
		PreparedStatement ps=con.prepareStatement(sql);
		int i=ps.executeUpdate();
		if(i>0) {
			request.setAttribute("message", "Report Deleted !!");
			request.getRequestDispatcher("../nurse/manageReport.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "Report not Deleted !!");
			request.getRequestDispatcher("../nurse/manageReport.jsp").forward(request, response);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>