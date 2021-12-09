<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//1. cos 가 jdk 11 와 호환이 되지 않는다. 그래서 1.8로 버전을 내렸다. 
//2. 현재 작업 폴더 업로드
String folderpath = "C:/Users/505/git/jj_jsp/jsp_web/src/main/webapp/jsp_website/upload";

//3. 서버 폴더 업로드 
// String folderpath = request.getSession().getServletContext().getRealPath("jsp_website/upload");

MultipartRequest multi = new MultipartRequest(request, folderpath, 1024 * 1024 * 100, "utf-8",
		new DefaultFileRenamePolicy());

Product product = new Product(
	multi.getParameter("p_name") ,
	Integer.parseInt(multi.getParameter("p_price")) ,
	multi.getParameter("p_category") ,
	multi.getParameter("p_manufacturer") ,
	Integer.parseInt(multi.getParameter("p_status")) ,
	multi.getParameter("p_size") ,
	Integer.parseInt(multi.getParameter("p_instock")) ,
	multi.getFilesystemName("p_image") , 
	multi.getParameter("p_contents") 
	);
	

boolean result = ProductDao.getProductDao().productWrite(product);

if(result){
	out.print("<script> alert('제품이 등록되었습니다.'); </script>");
	out.println("<script> location.href='../view/admin/dashboard.jsp' ; </script>");
} else{
	out.print("<script> alert('제품 등록에 실패했습니다.'); </script>");
	out.println("<script> location.href='../view/admin/product_write.jsp' ; </script>");
}
%>