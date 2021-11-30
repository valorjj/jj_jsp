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
	<!-- 헤더에서 가져올 수 있는 멤버리스트, 보드리스트 -->
	<div class="container">
	
		<h3 style="color : skyblue; border-bottom: solid 2px #cccccc" class="p-2"> 상세페이지 </h3>
		
		<%
			int index = Integer.parseInt(request.getParameter("bnum"));
		%>
		
		<a href="board.jsp"> <button type="button" class="btn btn-success"> 목록보기 </button></a>
		
		<!-- 제목, 내용, 작성자를 출력하면 되는건가? -->
		<% for(int i=0; i<boards.size(); i++) { %>
			
			<% if(i == index) { %>
				<table class="table">
					<tr> 
						<th> 번호 </th>
						<th> 제목 </th>
						<th> 내용 </th>
						<th> 글쓴이 </th>
					</tr>
					<tr>
						<td> <%=index %> </td>
						<td> <%=boards.get(i).getTitle() %> </td>
						<td> <%=boards.get(i).getContents() %> </td>
						<td> <%=boards.get(i).getWriter() %> </td>
					</tr>
				</table>
			<% } %>
		
		<% } %>
	
	</div>


</body>
</html>