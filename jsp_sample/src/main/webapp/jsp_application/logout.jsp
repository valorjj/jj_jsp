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
		// session.invalidate(); // 1. 세션 초기화 -> 주의 : 전부 다 날라간다.
		session.setAttribute("loginid", null); // 2. 특정 세션을 초기화시킨다. 
		// 3. java 는 null 값이 부여되면 메모리값이 사라진다 (garbage collector)
		response.sendRedirect("index.jsp");
	%>

</body>
</html>