<%@page import="Test.Book"%>
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

	<%@ include file="header.jsp"%>
	
	<div class="container">
		<h3 style="color : skyblue; border-bottom: solid 2px #cccccc" class="p-2"> 도서검색 </h3>
		<form action="book.jsp" method="get">
			<div class="input-group">
				<div class="input-group my-3">
					<span class="input-group-text">도서명</span> <input type="text"
						class="form-control" placeholder="Enter bookname" name="book-title">
				</div>
<!-- 				<div class="input-group my-3">
					<span class="input-group-text">저자</span> <input type="text"
						class="form-control" placeholder="book name" name="book-writer">
				</div> -->
				<div class="input-group my-3">
					<button type="submit" class="btn btn-primary btn-block"> 도서검색 </button>
				</div>
			</div>
		</form>
		
		<%
			String title = request.getParameter("book-title");
			String writer = request.getParameter("book-writer");
		%>
		
		<table class="table">
			<tr>
				<th> 도서명 </th>
				<th> 저자 </th>
				<th> 대출 여부 </th>
			</tr>
			<% for(int i=0; i<books.size(); i++) { %>
				<% if(books.get(i).getTitle().equals(title)) { %>
				<tr>
					<td> <%=books.get(i).getTitle() %> </td>
					<td> <%=books.get(i).getWriter() %> </td>
					<td> 가능 </td>
				</tr>
				<% } %>
			<% } %>
		</table>
	</div>
</body>
</html>