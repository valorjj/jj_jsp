<%@page import="Test.Board"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		// 1. 세션의 리턴값 : 오브젝트 (강제 형변환가능)
		Board board = new Board(title, content, (String) session.getAttribute("loginid"));
		// 1. db 처리
		
		// 1.1 mysql 연동가능하니?
		
		
		// 2. 파일 처리 
	
		FileOutputStream fileOutputStream = new FileOutputStream("D:/jj_ansan_ezen/jsp_sample/src/main/java/Test/boardlist.txt", true);
		String str = board.getTitle() + "," + board.getContents()+","+board.getWriter() + "\n";
		
		fileOutputStream.write(str.getBytes());
		
		fileOutputStream.flush();
		
		response.sendRedirect("board.jsp");
	
	%>


</body>
</html>