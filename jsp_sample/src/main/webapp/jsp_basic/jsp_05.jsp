<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="jsp_06.jsp"> <!-- form action 속성  -->

		이름 : <input type="text" name="name"> <br> 
		
		좋아하는 색상 : 
		
		<select name="color">
			<option value="blue"> 파란색 </option>
			<option value="red"> 빨강색 </option>
			<option value="orange"> 오렌지색 </option>
			<option value="etc"> 기타 </option>
		</select> <br>
		
		<input type="submit" value="전송">
	</form>

</body>
</html>