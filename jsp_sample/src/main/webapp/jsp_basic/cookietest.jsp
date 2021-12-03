<%@page import="java.util.Arrays"%>
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
	
		request.getCookies();
		Cookie[] cookies = request.getCookies();
		System.out.println(Arrays.toString(cookies));
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("mycookie")) {
					
					System.out.println(cookies[i].getName()); // 콘솔에 출력
					%>
						내 쿠키 이름 : <%=cookies[i].getName() %>
						내 쿠키값 : <%=cookies[i].getValue() %>
					<%
				}
			}
		}
	%>

</body>
</html>