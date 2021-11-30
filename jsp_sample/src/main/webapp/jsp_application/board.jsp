<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<h3 style="color : skyblue; border-bottom: solid 2px #cccccc" class="p-2"> 게시물 목록</h3>
		<%if(loginid == null) { %>
			<!-- 로그인이 안되어 있는 경우 -->
			<p> 로그인 후 게시물을 작성할 수 있습니다.</p>
		<% } else { %>
			<!-- 로그인이 된 경우 -->
			<a href="boardwrite.jsp"><button type="submit" class="btn btn-primary">WRITE</button></a>
		<% } %>
		<br>
		<table class="table">
			<tr>
				<th> 번호 </th>
				<th> 제목 </th>
				<th> 작성자 </th>
			</tr>
			<% for(int i=0; i<boards.size(); i++) { %>
				<tr>
					<td> <%=(i+1) %> </td>
					<td> <a href="boardviewpage.jsp?bnum=<%=i %>"> <%=boards.get(i).getTitle() %> </a></td>
					<td> <%=boards.get(i).getWriter() %> </td>
				</tr>
			<% } %>
		</table>
	</div>
</body>
</html>