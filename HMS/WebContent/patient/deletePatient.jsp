<%@page import="dbConnector.DbConnector"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%if(session.getAttribute("userMail")==null || session.getAttribute("userMail")==""){ %>
	<%
		Connection con=null;
		Statement stm=null;
		con=DbConnector.getConnection();
		try{
			stm=con.createStatement();
			String sql="delete from patient where p_id='"+request.getParameter("id")+"'";
			int i=stm.executeUpdate(sql);
			if(i>0){%>
			<%response.sendRedirect("../patient/addPatient.jsp"); %>
			<script>
				window.alert("delete success !!")
			</script>
			<%} else{%>
				<%response.sendRedirect("patientInfo.jsp"); %>
				<script>
				window.alert("delete failed !!")
				</script>
			<%} %>
		<%
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			stm.close();
		}
	%>
<%}else{ %>
	
	<script>
		window.alert("You are not Authorized to delete this information !!")
	</script>
<%} %>


</body>
</html>