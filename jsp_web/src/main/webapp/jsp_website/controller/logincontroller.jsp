<%@page import="dao.Login_Id"%>
<%@page import="dao.MemberDao"%>
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
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id1");
		String password = request.getParameter("password");
		
		// 1. db 에 저장된 회원 정보 데이터와 일치하는지 비교한다. 
		boolean res = MemberDao.getmemberDao().member_login(id, password);
		
		if(res){
			// 1. 로그인 성공
			// 1.1 회원번호, 로그인 아이디를 객체로 만들어서 세션에 저장한다. 
			Login_Id login = new Login_Id(MemberDao.getmemberDao().member_find_m_num(id), id);
			session.setAttribute("login", login); // 1.2 세션명, 세션데이터 
			response.sendRedirect("../view/main.jsp");
		} else {
			// 2. 로그인 실패
			response.sendRedirect("../view/member/login.jsp?result=fail");
		}
	
	%>

</body>
</html>