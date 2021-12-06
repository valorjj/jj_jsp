<%@page import="dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<div class="container">
	
		<div class="d-grid gap-2 col-6 mx-auto">
			<a href="board_write.jsp" >
				<button class="form-control btn btn-success my-3">글쓰기</button>
			</a>
		</div>


		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>

			</tr>

			<%
			ArrayList<Board> boards = BoardDao.getboardDao().board_list();

			for (Board board : boards) {
			%>

			<tr>
				<td><%=board.getB_no()%></td>
				<td><a href="board_view.jsp?b_no=<%=board.getB_no()%>"><%=board.getB_title()%></a></td>
				<!-- 클릭한 게시물 번호도 같이 이동하게 만들자 -->
				<td><%=board.getM_num()%></td>
				<td><%=board.getB_date()%></td>
				<td><%=board.getB_view()%></td>

			</tr>

			<%
			}
			%>

		</table>
	</div>

</body>
</html>