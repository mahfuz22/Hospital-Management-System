<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="notice" class="bean.Notice" scope="request">
	<jsp:setProperty name="notice" property="subject" value='<%=request.getParameter("subject") %>'/>
	<jsp:setProperty name="notice" property="description" value='<%=request.getParameter("description") %>'/>
	<jsp:setProperty name="notice" property="date" value='<%=request.getParameter("date") %>'/>
</jsp:useBean>
<jsp:forward page="../UpdateNotice">
	<jsp:param value='<%=request.getParameter("id") %>' name="id"/>
	<jsp:param value="<%=notice.getSubject() %>" name="subject"/>
	<jsp:param value="<%=notice.getDescription() %>" name="description"/>
	<jsp:param value="<%=notice.getDate() %>" name="date"/>
</jsp:forward>
</body>
</html>