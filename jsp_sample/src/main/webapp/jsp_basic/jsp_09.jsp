<%@page import="java.util.Date"%>

	<!-- 페이지 지시자 -->
	<!-- 현재 jsp 페이지 내 속성 정의  -->
	<!-- page import = "패키지/클래스" -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jsp 기본 : lang : 자바 -->
<!-- contentType : html -->
<!-- 문자열 인코딩 형식은 utf-8 -->
<!-- 페이지 인코딩 : utf-8 -->

<%@ page import="java.util.ArrayList" %> <!-- 클래스 가져오기  -->
<%@ page session="true" %> <!-- 페이지에서 세션 사용 여부 (기본값이 true) -->
<%@ page buffer="none" %> <!-- 페이지 출력 크기 [ 기본 : 8kb ] none : 버퍼 사용 X-->
<%@ page isThreadSafe="true" %> <!-- jsp 페이지가 동시에 여러 브라우저가 요청 가능한지 (기본값이 true) -->
<%@ page errorPage="jsp_10.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Date date = new Date(); int one=1; int zero=0;%>
	<h3>지시자</h3>
	<br> jsp 버전 : <%=this.getServletInfo()%>
	<!-- 현재 jsp 버전 확인 -->
	<br> 현재 날짜/시간 : <%=date %>
	<br> 예외 발생 : <%= one/zero %>
</body>
</html>