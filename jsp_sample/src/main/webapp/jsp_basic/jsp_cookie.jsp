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
	// String mycookie = "mycookie"; // Session 과 다르게 쿠키는 내장이 되어있지 않다. 
	
	// 1. 쿠키 클래스를 이용해 쿠키 객체 만들기
	Cookie cookie = new Cookie("mycookie", "imac"); // 1. 변수할당 하지않고 직접 넣어줘도 된다. (메모리 절약)
	cookie.setMaxAge(60); // 2. 쿠키 생명주기 [1분]
	cookie.setValue("apple"); // 3. imac -> apple 로 쿠키 value 바꿀 수 있다.
	
	response.addCookie(cookie); // 4. 클라이언트[브라우저]에게 쿠키 전달 [해당 브라우저에 쿠키 저장]
	%>

	<p>쿠기 만들기</p>
	<p>
		쿠키 내용 <a href="cookietest.jsp"> 확인 </a>
	</p>

</body>





</html>