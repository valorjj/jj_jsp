<%@page import="java.util.ArrayList"%>
<%@page import="Test.Member"%>
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

	<%@ include file="header.jsp" %> <!-- header 에 선언한 뒤 include 시킴으로써, 전역변수를 사용할 수 있다. -->
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		
		boolean is_login = false;
		for(Member member : members){
			// 1. 아이디와 비밀번호 모두 일치하는 회원이 존재할 때 통과 
			if(member.getId().equals(id) && member.getPassword().equals(password)){
				
				is_login = true;
				// 0. 세션 할당
				session.setAttribute("loginid", member.getId());
				// 0.1 세션 유지 시간 부여 (단위는 s)
				
				response.sendRedirect("index.jsp");
				// 1. 리스폰은 끝나더라도, 아래 코드가 실행이 된다.
				// 2. 제약이 필요하다. 
				// 3. 제약이 없이 실행되나봐
			}
		}
		// 2. 로그인 실패
		if(!is_login){
			response.sendRedirect("login.jsp?result=fail");
		}
		
	%>

</body>
</html>