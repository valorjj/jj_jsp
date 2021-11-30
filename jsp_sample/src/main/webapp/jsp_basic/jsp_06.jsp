<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		// request : 전 페이지로부터 요청한다. 
		// request : 요청 인코딩타입 : 아스키타입
		// request : jsp 내장 객체 (http) (요청객체)
		// .getParameter("변수명") : 해당 변수를 가져온다. 
		String color = request.getParameter("color");
	%>
</head>
<body bgcolor=<%=color%>>

	이름 : <%=name%>
	좋아하는 색상 : <%=color%>
	


</body>
</html>