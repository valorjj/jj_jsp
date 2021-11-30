<%@page import="Test.Member"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div class="container my-3">
		<h3 style="color: green" class="my-3 p-2">메인 페이지 구역</h3>
		<h4 class="my-3 p-2" style="color: skyblue; border-bottom: solid 2px #cccccc;">회원 현황</h4>
		<table class="table table-dark">
			<tr>
				<th> 번호 </th> <th> 아이디 </th> <th> 이름 </th>
			<tr>
			<% for(int i=0; i<members.size(); i++){ %>
				<tr>
					<td> <%=(i+1) %> </td>
					<td> <%=members.get(i).getId() %> </td>
					<td> <%=members.get(i).getName() %> </td>
				</tr>
			<% } %>
		</table>
	
	</div>
</body>
</html>