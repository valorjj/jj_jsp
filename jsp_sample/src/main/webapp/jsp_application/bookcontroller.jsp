<%@page import="java.io.FileInputStream"%>
<%@page import="Test.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">



</style>
</head>
<body>


	<%@ include file="header.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("book-title");
		String writer = request.getParameter("book-writer");
		
		boolean is_exist = false;
		
		for(Book book: books){
			
				if(book.getTitle().equals(title) && book.getWriter().equals(writer)){
					is_exist = true;
					response.sendRedirect("book.jsp");
				}
			
		}
		if(!is_exist){
			response.sendRedirect("book.jsp?result=fail");
			
		}
	
	
		
	
	%>

</body>
</html>