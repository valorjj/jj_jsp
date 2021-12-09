<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 제품의 상태를 변경한다. 
// 제품 상태는 1, 2, 3 총 3가지 이다.
// 하나 누르면 다음 번호로 바꾼다. 
int p_no = Integer.parseInt(request.getParameter("p_no"));
boolean result = ProductDao.getProductDao().product_status_update(p_no);
if(result){
	out.print("1");
} else {
	out.print("2");
}
%>