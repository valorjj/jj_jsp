<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	out.print(name);
	%>
	
	<jsp:include page="jsp_11_action_tag_1.jsp"></jsp:include>

</body>
</html>