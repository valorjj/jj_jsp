<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
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
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String passwordconfirm = request.getParameter("passwordconfirm");
	String name = request.getParameter("name");
	String birthdate = request.getParameter("birthdate");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address1") + "," + request.getParameter("address2") + ","
			+ request.getParameter("address3") + "," + request.getParameter("address4");
	// 객체화 
	Member member = new Member(id, password, name, birthdate, gender, phone, address);
	// DB 처리 

	boolean res = MemberDao.getmemberDao().member_signup(member);

	if (res) {
		// 1. 회원 가입 성공
		response.sendRedirect("../view/member/signupsuccess.jsp");
	} else {
		// 2. 회원 가입 실패 
		response.sendRedirect("../view/member/signup.jsp");
	}
	%>
	
</body>
</html>