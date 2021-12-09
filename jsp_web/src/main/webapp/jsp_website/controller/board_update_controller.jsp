<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="dao.Login_Id"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 1. cos 가 jdk 11 와 호환이 되지 않는다. 그래서 1.8로 버전을 내렸다. 
// 2. 현재 작업 폴더 업로드
String folderpath = request.getSession().getServletContext().getRealPath("jsp_website/upload");

// 3. 서버 폴더 업로드 
// String folderpath = request.getSession().getServletContext().getRealPath("jsp_website/upload");

MultipartRequest multi = new MultipartRequest(request, folderpath, 1024 * 1024 * 10, "utf-8",
		new DefaultFileRenamePolicy());

// MultipartRequest - [요청방식] [로드파일 폴더경로] [용량(바이트)] [인코딩방식] [보안]  
// DefaultFileRenamePolicy() : 중복값을 배제시켜준다. 
// 1024 : 1kb , 1024 * 1024 * 10 = 10mb
request.setCharacterEncoding("utf-8");
String title = multi.getParameter("title");
String content = multi.getParameter("content");
// <br>, 프론트 < > 태그 제거해야함 
content = content.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\S)*(/)?", "");

String file = multi.getFilesystemName("file");
String file2 = multi.getFilesystemName("file2");

if (file == null || file2 == null) {
	file = multi.getParameter("oldfile"); // 1. 형식이 type="hidden" 이라서 getParameter

}
if (file2 == null) {
	file2 = multi.getParameter("oldfile2");
}
int b_no = Integer.parseInt(multi.getParameter("b_no"));

Board board = new Board(b_no, title, content, file, file2);

boolean result = BoardDao.getboardDao().board_update(board);

if (result) {
	out.print("<script> alert('수정되었습니다.'); </script>");
	out.println("<script> location.href='../view/board/board_view.jsp?b_no=" + b_no + "'; </script>");
} else {

}
%>
