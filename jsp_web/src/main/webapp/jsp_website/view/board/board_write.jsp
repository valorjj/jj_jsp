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
		<form action="../../controller/board_write_controller.jsp"
			method="post" enctype="multipart/form-data" class="form-group">
			<!-- form 은 전송 데이터 기본 타입 : text (=String) -->
			<!-- form 에서 파일/데이터를 전송할 타입 : multipart/form-data -->
			제목 : <input type="text" name="title" class="form-control"> <br>
			내용 :
			<textarea rows="10" cols="50" name="content" class="form-control"></textarea>
			<br> 첨부파일 : <input type="file" name="file" class="form-control">
			<br> <input type="submit" value="등록"
				class="form-control btn btn-success">

		</form>

	</div>

</body>
</html>