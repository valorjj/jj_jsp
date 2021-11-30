<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>선언문</h3>
	<%
	String letter = "jsp Programming";
	int var1 = 1; // 스크립트문에서 변수 선언 시 지역 변수라서 무조건 초기값이 존재해야한다.
	%>

	<%!String statement = "jsp Programming";
	int var2; // 멤버변수 : 초기값이 없을 경우 null 혹은 0 으로 초기화된다. 자동적으로%>

	<br>출력 결과 :
	<%=letter%>
	<br>출력 결과 :
	<%=statement%>
	<br>출력 결과 :
	<%=var1%>
	<br>출력 결과 :
	<%=var2%>

	<%!// jsp 선언문 구역
	int one;
	int two = 2;

	public int plus(int a, int b) {
		return a + b;
	}
	
	String msg;
	int three;
	
	%>
	
	<!-- 표현식[jsp를 출력하는 부분] -->
	<br>
	one 와 two 의 합은 ? : <%=plus(one, two) %>
	<br>
	MSG 의 초기값은 ? : <%=msg %>
	<br>
	three 의 초기값은 ? : <%=three %>

</body>
</html>