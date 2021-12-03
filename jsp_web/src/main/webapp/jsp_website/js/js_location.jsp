<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>자바 스크립트 위치 : html -> body css -> head </h3>
	
		<script type="text/javascript">
		
			var msg = "hello javascript";
			
			for(var i=0; i < 10; i++){
				
				// 내장 객체
				document.writeln(msg + "<br>");
				// html 문서에 접근 가능한 기능이다. (내장 객체)
			};
			// 스크립트 내 주석처리는 자바와 동일
		
		</script>

</body>
</html>