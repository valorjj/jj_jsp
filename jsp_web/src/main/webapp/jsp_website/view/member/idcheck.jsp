<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// jsp 태그는 통신 결과로 가지 않음 
// 1. ajax 와 통신된 데이터를 요청한다 [이 경우에는 userid ]
String userid = request.getParameter("userid");
boolean res = MemberDao.getmemberDao().idcheck(userid);
if (res) {
	// db에서 검색해서 
	out.print("1"); // JSP 태그에서 HTML 태그로 내보낼 때 사용, 중복값이 있을 때 1
} else {
	out.print("0"); // 중복값이 없을 때 0
}
%>
