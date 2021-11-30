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
	String studentID = request.getParameter("studentID");
	String gender = request.getParameter("gender");
	String major = request.getParameter("major");
	
	if(gender.equals("man")){
		
		gender="남자";
		
	} else {
		gender="여자";
		
	}
	%>

	<h1>questionaire result</h1>
	name : <%=name %> <br>
	studentId : <%=studentID %> <br>
	gender : <%=gender %> <br>
	major : <%=major %> <br>
	
	<hr>
	
	<%
		out.print("Protocol : " + request.getProtocol() + "<br>");
		out.print("Server Name : " + request.getServerName() + "<br>");
		out.print("Server Port : " + request.getServerPort() + "<br>");
		out.print("Servlet Path :" + request.getServletPath() + "<br>");
		out.print("Computer Address : " + request.getRemoteHost() + "<br>");
		out.print("Computer Name : " + request.getRemoteAddr() +"<br>");
		out.print("Method : " + request.getMethod() + "<br>");
		out.print("Path : " + request.getRequestURI() + "<br>");
		out.print("Current Browser : " + request.getHeader("User-Agent") + "<br>");
	%>
	

</body>
</html>