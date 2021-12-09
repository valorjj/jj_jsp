<%@page import="dao.Login_Id"%>
<%@page import="dao.ReplyDao"%>
<%@page import="dto.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 1. 댓글 등록 후 db 와 연동시키는 컨트롤러 
request.setCharacterEncoding("utf-8");
int b_no = Integer.parseInt(request.getParameter("b_no"));

Login_Id login = (Login_Id) session.getAttribute("login");
int m_num = login.getM_num();
String r_content = request.getParameter("r_content");

r_content = r_content.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
Reply reply = new Reply(r_content, m_num, b_no);

boolean result = ReplyDao.getreplyDao().write_reply(reply);

if (result) {
	out.print("<script> alert('댓글이 등록되었습니다. ');  </script>");
	out.println("<script> location.href='../view/board/board_view.jsp?b_no=" + b_no + "';  </script>");
} else {
	out.println("<script> location.href='../view/board/board_view.jsp?b_no=" + b_no + "';  </script>");
}
%>
