<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.*" %>
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
	String sql="update invoice set status='Paid' where id='"+id+"'";
	PreparedStatement psPreparedStatement=con.prepareStatement(sql);
	int i=psPreparedStatement.executeUpdate();
	if(i>0) {
		request.getRequestDispatcher("../accountant/reciept.jsp").forward(request, response);
	}else{
		out.println("<h1>anything worng </h1>");
	}
%>
</body>
</html>