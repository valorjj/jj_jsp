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
		// 1. 세션할당 [쿠키와 달리 세션은 내장객체(미리 만들어져있다. http 클래스)]
		session.setAttribute("id", "qweqwe"); // 2. 세션 저장소 [Tomcat]
		session.setAttribute("password", "123123"); // 2. 세션 저장소 [Tomcat]
				
		// 2. 세션 생명주기 : 기본값 30분
		session.setMaxInactiveInterval(60*30); // 1분 * 30 = 30분
	%>

	<p> 세션 만들기 </p>
	<p> <a href="sessiontest.jsp"> 세션 확인 </a></p>
	
	

</body>
</html>