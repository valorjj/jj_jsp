<%@page import="dto.Board"%>
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

	<!-- 작성한 게시물을 수정하는 페이지  -->
	<!-- 기존의 내용을 text field 에 표현하고 지울 수 있게 해야하나? -->


	<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	Board board = BoardDao.getboardDao().get_board(b_no);
	board.setB_content(board.getB_content().replaceAll("<br>", "\n"));
	%>

	<%@ include file="../header.jsp"%>

	<div class="container">
		<div>
			<p style="font-size: 30px; font-family: 'NanumGothicBold';"
				class="text-center ">게시물 등록</p>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3 align-self-center">
				<img src="../../images/side1.jpg" class="img-fluid">
			</div>

			<div class="col-md-9">

				<form action="../../controller/board_update_controller.jsp"
					method="post" enctype="multipart/form-data" class="form-group p-2">
					<!-- 매개변수 값을 숨겨서 보내기 -->
					<!-- 수정할 게시물 번호 -->
					<!-- 새로운 첨부 파일이 없을 경우 기존 파일을 다시 사용한다.  -->
					<input type="hidden" name="b_no" value="<%=b_no%>"> 
					<input type="hidden" name="oldfile" value="<%=board.getB_file()%>">
					<input type="hidden" name="oldfile2" value="<%=board.getB_file2()%>">
					<!-- form 은 전송 데이터 기본 타입 : text (=String) -->
					<!-- form 에서 파일/데이터를 전송할 타입 : multipart/form-data -->
					<div class="input-group my-2">
						<span class="input-group-text">제목</span> <input type="text"
							name="title" class="form-control" value="<%=board.getB_title()%>">
					</div>

					<div class="input-group my-2">
						<span class="input-group-text">내용</span>
						<textarea rows="10" cols="50" name="content" class="form-control"><%=board.getB_content()%></textarea>
					</div>

					<div class="input-group my-2">
						<label class="input-group-text">file1</label> <input type="file"
							class="form-control" id="file" name="file">
						<%=board.getB_file()%>

					</div>

					<div class="input-group my-2">
						<label class="input-group-text">file2</label> <input type="file"
							class="form-control" id="file2" name="file2">
						<%=board.getB_file2()%>

					</div>

					<div class="my-3">
						<input type="submit" value="게시물수정"
							class="form-control btn btn-success">
					</div>

				</form>

			</div>

		</div>

	</div>

</body>
</html>