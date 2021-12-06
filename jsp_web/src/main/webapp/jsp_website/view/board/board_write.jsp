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
	<!-- 글쓰기 페이지 -->
	<div class="container">
		<div>
			<p style="font-size: 30px; font-family: 'NanumGothicBold';"
				class="text-center ">게시물 등록</p>
		</div>
		<hr>
		<div class="row" id="board_write">
			<div class="col-md-3 align-self-center">
				<img src="../../images/side1.jpg" class="img-fluid">
			</div>

			<div class="col-md-9">

				<form action="../../controller/board_write_controller.jsp"
					method="post" enctype="multipart/form-data" class="form-group p-2">
					<!-- form 은 전송 데이터 기본 타입 : text (=String) -->
					<!-- form 에서 파일/데이터를 전송할 타입 : multipart/form-data -->
					<div class="input-group my-2">
						<span class="input-group-text">제목</span> <input type="text"
							name="title" class="form-control">
					</div>

					<div class="input-group my-2">
						<span class="input-group-text">내용</span>
						<textarea rows="10" cols="50" name="content" class="form-control"></textarea>
					</div>

					<div class="input-group my-2">
						<label class="input-group-text">file1</label> <input type="file"
							class="form-control" id="file" name="file">

					</div>

					<div class="input-group my-2">
						<label class="input-group-text">file2</label> <input type="file"
							class="form-control" id="file2" name="file2">

					</div>

					<div class="my-3">
						<input type="submit" value="게시물등록"
							class="form-control btn btn-success">
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>