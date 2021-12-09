<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 제품 삭제 컨트롤러 

int p_no = Integer.parseInt(request.getParameter("p_no"));

boolean result = ProductDao.getProductDao().product_delete(p_no);

if(result){
	out.print("<script> alert('게시글이 삭제되었습니다. '); </script>");
	out.print("<script> location.href='../view/admin/dashboard.jsp'; </script>");
	
} else {
	out.print("<script> alert('오류 발생. 관리자 문의 '); </script>");
	out.print("<script> location.href='../view/admin/dashboard.jsp'; </script>");
	
	
}

%>