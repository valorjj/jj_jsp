<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>표현식</h3>
	<%!String[] 이름 = { "테스트1", "테스트2", "테스트3" };%>

	<table border="1" width="200">
		<%
			// 자바 시작
			for (int i = 0; i < 이름.length; i++) {
				// 자바 끝
		%>
			<!-- HTML 시작 -->
			<tr>
				<td><%=i%>
				<td><%=이름[i]%>
			</tr>
			<!-- HTML 끝 -->
		<%
			// 자바 시작, html 은 } 을 인식 못한다.
			
			}
		%>

	</table>

</body>
</html>