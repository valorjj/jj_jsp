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
		<h3>글 작성하기</h3>

		<form action="boardcontroller.jsp" method="post">
			제목 : <input type="text" name="title" placeholder="Enter title">
			<br> 내용 :
			<textarea rows="6" cols="50" name="content"
				placeholder="Enter content"></textarea>
			<br>

			<button type="submit" class="btn btn-primary">WRITE</button>
			<!-- <input type="submit" value="write" > -->
		</form>
	</div>
</body>
</html>