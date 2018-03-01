<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.*"%>
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
		String sql="delete from operation where id='"+id+"'";
		PreparedStatement ps=con.prepareStatement(sql);
		int i=ps.executeUpdate();
		if(i>0) {
			request.setAttribute("message", "Operation Deleted !!");
			request.getRequestDispatcher("../doctor/operation.jsp?page=1").forward(request, response);
		}else {
			request.setAttribute("message", "Operation not Deleted !!");
			request.getRequestDispatcher("../doctor/operation.jsp?page=1").forward(request, response);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>