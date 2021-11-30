<%@page import="Test.Book"%>
<%@page import="Test.Board"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="Test.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

</head>
<body>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<%
		// 1. 세션 호출 
		String loginid = (String)session.getAttribute("loginid");
		// 2. 
	
	%>


	<%
		ArrayList<Member> members = new ArrayList<>();
		FileInputStream fileInputStream = new FileInputStream("D:/jj_ansan_ezen/jsp_sample/src/main/java/Test/memberlist.txt");
		int size1 = fileInputStream.available();
		byte[] bytes = new byte[size1];
		fileInputStream.read(bytes);
		String smember = new String(bytes);
		String[] ssmember = smember.split("\n");
		for(int i = 0; i<ssmember.length-1; i++){
			Member member = new Member( 
					ssmember[i].split(",")[0], 
					ssmember[i].split(",")[1], 
					ssmember[i].split(",")[2]
					);
			members.add(member);
		}
		fileInputStream.close();
	%>
	
	<%
		ArrayList<Board> boards = new ArrayList<>();
		FileInputStream fileInputStream2 = new FileInputStream("D:/jj_ansan_ezen/jsp_sample/src/main/java/Test/boardlist.txt");
		int size2 = fileInputStream2.available();
		byte[] bytes2 = new byte[size2];
		fileInputStream2.read(bytes2);
		String sboard = new String(bytes2);
		String[] ssboard = sboard.split("\n");
		for(int i=0; i<ssboard.length-1; i++){
			Board board = new Board(
					ssboard[i].split(",")[0],
					ssboard[i].split(",")[1],
					ssboard[i].split(",")[2]
			);
			boards.add(board);
		}
		
		fileInputStream2.close();
	%>
	
	<%
		// book 리스트를 불러와서 
		
		ArrayList<Book> books = new ArrayList<>();
	
		FileInputStream fileInputStream3 = new FileInputStream("D:/jj_ansan_ezen/jsp_sample/src/main/java/Test/booklist.txt");
		
		int size3 = fileInputStream3.available();
		byte[] bytes3 = new byte[size3];
		fileInputStream3.read(bytes3);
		
		String sbook = new String(bytes3);
		String[] ssbook = sbook.split("\n");
		for(int i=0; i<ssbook.length; i++){
			Book book = new Book(
					ssbook[i].split(",")[0],
					ssbook[i].split(",")[1]
			);
			books.add(book);
		}
		
		fileInputStream3.close();
	%>
	
	<div class="container">
		<h3> <a href="index.jsp"> 메인화면 </a></h3>
		<ul class="list-group">
			<li class="list-group-item"><% if(loginid != null) { out.print(loginid +"님 안녕하세요"); } %> </li>
			<% if( loginid != null) { %>
				<li class="list-group-item"> <a href="logout.jsp"> 로그아웃</a>
			<% } %>
			<li class="list-group-item"> <a href="login.jsp"> 로그인 </a> </li>
			<li class="list-group-item"> <a href="signup.jsp"> 회원가입 </a></li>
			<li class="list-group-item"> <a href="board.jsp"> 게시판 </a></li>
			<li class="list-group-item"> <a href="book.jsp"> 도서검색 </a></li>
			<li class="list-group-item"> <a href="lottery.jsp"> 로또 판별기 </a></li>
		</ul>
	</div>


</body>
</html>