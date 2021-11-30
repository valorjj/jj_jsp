<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>스크립트 문</h3>
	<%!int one;
	String msg;%>
	<%
	int one = 30;
	String msg = "serlvet script";
	%>

	<br> one :
	<%=one%>
	<br> msg :
	<%=msg%>
	<br> 선언문 one :
	<%=this.one%>
	<br> 선언문 msg :
	<%=this.msg%>
	<br> 서블릿 경로 :
	<%=application.getRealPath("/")%>


	<%
		float f = 2.3f;
		int i = Math.round(f);
		Date date = new Date();
	%>
	
	<br> 실수 f의 반올림값은 : <%=i %>
	<br> 현재 날짜 : <%=date.toString() %>
	
	

</body>
</html>