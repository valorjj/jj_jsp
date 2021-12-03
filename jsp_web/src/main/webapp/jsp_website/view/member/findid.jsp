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

	<div class="container my-5">

		<div class="text-center my-3"
			style="border-bottom: solid 3px #cccccc;">
			<h3 style="color: green; font-family: 'NanumSquareBold';">아이디 찾기
				페이지</h3>
		</div>

		<form action="" method="post">
			<div class="row">
				<div class="col-md-2 text-center offset-2">
					<label class="form-label">이름</label>
				</div>
				<div class="col-md-5">
					<input type="text" class="form-control" name="name">
				</div>
			</div>

			<div class="row my-3">
				<div class="col-md-2 text-center offset-2">
					<label class="form-label">이메일</label>
				</div>
				<div class="col-md-5">
					<input type="text" class="form-control" name="email">
				</div>
			</div>

			<div>
				<button type="button" onclick="location.href='../main.jsp'">아이디 찾기</button>
			</div>



		</form>




	</div>




</body>
</html>