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
	
	int sum = 0;
	for (int i = 1; i <= 100; i++) {
		sum += i;
	}
	%>
	누적합계 : <%=sum %>
	<form action="jsp_08.jsp" method="post">
		반복할 문자 : <input type="text" name="string"> <br>
		반복할 횟수 : <input type="text" name="count"> <br>
		전송 <input type="submit" value="전송"> <br>
	</form>

</body>
</html>