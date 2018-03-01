<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bed" class="bean.Bed" scope="request">
	<jsp:setProperty name="bed" property="totalBed" value='<%=Integer.parseInt(request.getParameter("bednumber")) %>'/>
	<jsp:setProperty name="bed" property="bedType" value='<%=request.getParameter("bedtype") %>'/>
	<jsp:setProperty name="bed" property="bedDescription" value='<%=request.getParameter("description") %>'/>
	<jsp:setProperty name="bed" property="rate" value='<%=Integer.parseInt(request.getParameter("rate")) %>'/>
		
</jsp:useBean>
<jsp:forward page="../AddBed">
	<jsp:param value="<%=bed.getTotalBed() %>" name="totalbed"/>
	<jsp:param value="<%=bed.getBedType() %>" name="bedtype"/>
	<jsp:param value="<%=bed.getBedDescription() %>" name="bedDes"/>
	<jsp:param value="<%=bed.getRate() %>" name="rate"/>
</jsp:forward>
</body>
</html>