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
// String folderpath = "C:/Users/505/git/jj_jsp/jsp_web/src/main/webapp/jsp_website/upload";

// 3. 서버 폴더 업로드 
String folderpath = request.getSession().getServletContext().getRealPath("jsp_website/upload");

MultipartRequest multi = new MultipartRequest(request, folderpath, 1024 * 1024 * 10, "utf-8",
		new DefaultFileRenamePolicy());

// MultipartRequest - [요청방식] [로드파일 폴더경로] [용량(바이트)] [인코딩방식] [보안]  
// DefaultFileRenamePolicy() : 중복값을 배제시켜준다. 
// 1024 : 1kb , 1024 * 1024 * 10 = 10mb
request.setCharacterEncoding("utf-8");
String title = multi.getParameter("title");
String content = multi.getParameter("content");

String file = multi.getFilesystemName("file");
String file2 = multi.getFilesystemName("file2");

// getFilesystemName : 실제 파일 이름을 가져온다. 업로드와는 관련없고, enctype="multipart/form-data" 얘랑 관련있다. 

// 2. 일반 form 을 썼을 때는 아래와 같이 사용한다.

/* String title = request.getParameter("title");
String content = request.getParameter("content");
String file = request.getParameter("file"); */

Login_Id login_data = (Login_Id) session.getAttribute("login");
int m_num = login_data.getM_num();

Board board = new Board(title, content, m_num, file, file2);
BoardDao.getboardDao().board_write_file2(board);
response.sendRedirect("../view/board/board_list.jsp");
%>
