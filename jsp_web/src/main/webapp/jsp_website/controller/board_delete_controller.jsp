<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<%
request.setCharacterEncoding("utf-8");

//1. 게시판 삭제 진행 
// 1.1 board_view.jsp 에서 b_no, header.jsp loginid 를 가져온다.
int b_no = Integer.parseInt(request.getParameter("b_no"));
boolean res = BoardDao.getboardDao().board_delete(b_no);
if (res) {
	// 2. 게시물 삭제
	out.print("<script> alert('삭제되었습니다.') </script>");
	out.println("<script> location.href='../view/board/board_list.jsp'; </script>");
	// 3. response 이 먼저된다. 페이지 전환이 먼저 되기 때문에, 스크립트와 함께 사용할 수 없다.
	// 3.1 out.print 실행 2. response [페이지전환] 실행 3. alert 실행 (이미 페이지 전환이 이루어져버림)
} else {
	response.sendRedirect("../view/board/board_view.jsp?b_no=" + b_no);
}
%>