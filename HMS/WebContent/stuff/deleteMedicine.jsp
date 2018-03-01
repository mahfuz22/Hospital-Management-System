<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*, dbConnector.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		int id=Integer.parseInt(request.getParameter("id"));
		Connection con=null;
		Statement stm=null;
		con=DbConnector.getConnection();
		try{
			stm=con.createStatement();
			String sql="delete from medicine where id='"+id+"'";
			int i=stm.executeUpdate(sql);
			if(i>0){
				request.setAttribute("message", "Medicine deleted !!!");
				request.getRequestDispatcher("../stuff/manageMedicine.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "Medicine not deleted !!!");
				request.getRequestDispatcher("../stuff/manageMedicine.jsp?page=1").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			stm.close();
		}
	%>
</body>
</html>