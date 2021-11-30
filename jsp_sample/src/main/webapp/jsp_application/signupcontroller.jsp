<%@page import="java.io.FileOutputStream"%>
<%@page import="Test.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 사용자 뷰 X : JAVA -->

	<% // 스크립트문 //
	
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id"); // form 으로부터 id 변수를 요청한다. 
		String password = request.getParameter("password"); // form 으로부터 password 변수를 요청한다.
		String name = request.getParameter("name"); // form 으로부터 name 변수를 요청한다. 
		
		// 0. 객체화
			// DTO 역할을 해준다. 
		Member member = new Member(id, password, name);
		
		// 1. Database 처리
		
		// 2. File 처리
		
		// 2.1 왜 예외처리를 하지 않을까?
		// 2.2 jspService 에 모든 곳에 예외처리가 걸려있다. 이미 예외처리가 되어있는 상태라 추가로 하지 않음. 
		FileOutputStream fileOutputStream = new FileOutputStream("D:/jj_ansan_ezen/jsp_sample/src/main/java/Test/memberlist.txt", true);
		// FileOutputStream fileOutputStream = new FileOutputStream("../../../../src/main/java/Test/memberlist.txt", true);
		String outstring = member.getId() + "," + member.getPassword() + "," + member.getName() + "\n";
		
		fileOutputStream.write(outstring.getBytes());
		
		fileOutputStream.flush();
		
		// 3. 페이지 이동 [ response ]
			// forward 랑은 어떤 차이일까?
		response.sendRedirect("index.jsp");
	
	

	%>

</body>
</html>