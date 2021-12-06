<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
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

	<%
	int b_no = Integer.parseInt(request.getParameter("b_no")); // 1. 이전 페이지에서 클릭한 게시물 번호를 넘겨받는다.
	Board board = BoardDao.getboardDao().get_board(b_no);
	%>

	<div class="container">

		<table class="table table-striped">
			<tr>
				<td>제목</td>
				<td><%=board.getB_title()%></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><%=board.getB_content()%></td>
			</tr>

			<tr>
				<td>첨부파일</td>
				<td><a
					href="../../controller/filedown_controller.jsp?file=<%=board.getB_file()%> "><%=board.getB_file()%></a></td>
			</tr>
		</table>

	</div>

</body>
</html>