<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
// 1. 파일 이름 요청
// 1.1 이전 페이지에서 file = {건네받을 인수} 로 받아와야한다. 
String filename = request.getParameter("file");
// 2. 서버 내 업로드 폴더 찾기 
// 2.1 서블릿 경로를 찾는다. 
// 2.2 project 이름까지 realpath 가 들어간다. 그래서 webapp 아래 있는 폴더 이름부터 시작한다. 
String folderpath = request.getSession().getServletContext().getRealPath("jsp_website/upload/" + filename);
// 3. 서버 내 업로드 폴더 내 파일 찾아서 객체화[파일 객체]
File file = new File(folderpath);
// 4. 클라이언트에게 응답하기 
// 4.1 다운로드 형식 html 이 들어간다 (setHeader) 
response.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
// 5. 내보내기 (Stream)

// 6. 파일이 있는지 없는지 존재 여부를 확인한다. 
if (file.isFile()) {
	// 7. 입력 스트림 : 파일을 byte 형으로 읽어오기 
	BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
	byte[] bytes = new byte[(int) file.length()]; // 파일 내 바이트 길이 file.length()
	bufferedInputStream.read(bytes);
	// 8. 출력 스트림 : 읽어 온 바이트형 파일을 내보내기 (클라이언트에게 응답을 해준다.)
	BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(response.getOutputStream());
	bufferedOutputStream.write(bytes);
	
/* 	int count;

	while ((count = bufferedInputStream.read(bytes)) != -1) { // 1. '-1' 은 바이트가 없다는 뜻 = 읽어올 게 없으니 반복문 탈출
		bufferedOutputStream.write(bytes, 0, count);

	} */

	bufferedInputStream.close(); // 입력 스트림 닫기
	bufferedOutputStream.close(); // 출력 스트림 닫기 

}
%>