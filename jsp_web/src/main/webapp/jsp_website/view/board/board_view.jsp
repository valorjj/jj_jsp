<%@page import="java.io.File"%>
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
	String img = board.getB_file();
	String img_path = "../../images/" + img;
	File file = new File(img_path);
	System.out.println(file);
	%>

	<div class="container">

		<div>
			<p style="font-size: 30px; font-family: 'NanumGothicBold';"
				class="text-center ">게시물 등록</p>
		</div>
		<hr>

		<div class="row">

			<div class="col-md-3">
				<img src="file" class="img-fluid">
			</div>

			<div class="col-md-9">

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
						<td>첨부파일1</td>
						<td><a
							href="../../controller/filedown_controller.jsp?file=<%=board.getB_file()%>"><%=board.getB_file()%></a></td>
					</tr>

					<%
					if (board.getB_file2() != null) {
					%>
					<tr>
						<td>첨부파일2</td>
						<td><a
							href="../../controller/filedown_controller.jsp?file=<%=board.getB_file2()%>"><%=board.getB_file2()%></a>
						</td>
					</tr>

					<%
					} else {
					%>
					<tr>
						<td>첨부파일2</td>
						<td></td>
					</tr>
					<%
					}
					%>

				</table>


			</div>



		</div>


	</div>

</body>
</html>