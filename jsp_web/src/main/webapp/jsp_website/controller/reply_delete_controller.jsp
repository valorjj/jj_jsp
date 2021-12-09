<%@page import="dao.ReplyDao"%>
<%@page import="dao.Login_Id"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 1. 댓글 삭제 컨트롤러

// 1. b_no 에서, m_num가 작성한 r_no 댓글을 삭제한다. 
int b_no = Integer.parseInt(request.getParameter("b_no"));
Login_Id login = (Login_Id) session.getAttribute("login");
int m_num = login.getM_num();
int r_no = Integer.parseInt(request.getParameter("r_no"));

System.out.println(b_no + " , " + m_num + " , " + r_no);

boolean res = ReplyDao.getreplyDao().delete_reply(r_no);

if(res){
	out.print("<script> alert('댓글이 삭제되었습니다. '); </script>");
	out.println("<script> location.href='../view/board/board_view.jsp?b_no="+b_no+"'; </script>");
} else {
	
}



%>