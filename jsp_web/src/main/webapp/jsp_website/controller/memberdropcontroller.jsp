<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String password = request.getParameter("password");
String id = (String) session.getAttribute("loginid");
// 1. 현재 세션에 있는 정보와 동일하면 탈퇴 
boolean result = MemberDao.getmemberDao().member_drop(id, password);

if (result) {
	out.print("1");
} else {
	out.print("0");
}

/* 	if (result) {

		// 1. 비밀번호가 일치하면 탈퇴를 진행하고, 메인 페이지로 이동한다. 
		// 2. 세션을 초기화 해야한다. 
		session.setAttribute("loginid", null);
		out.print("<script> alert('회원 정보가 삭제되었습니다.'); </script>");
		out.print("<script> location.href='../view/main.jsp'; </script>");

	} else {

		// 1. 비밀번호가 불일치하여 탈퇴 실패
		out.print("<script> alert('입력하신 정보가 일치하지 않습니다.'); </script>");
		out.print("<script> location.href='../view/member/user_info.jsp'; </script>");

	} */
%>
