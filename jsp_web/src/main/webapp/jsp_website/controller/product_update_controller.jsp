<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 제품 정보를 수정하는 컨트롤러 입니다.
// ProductDao 와 연동해서 입력된 값을 DB에 반영시킵니다. 
// BoardDao 참고, wildcard 사용해서 메소드를 최소화 시킵니다. 

// MultipartRequest multi = new MultipartRequest(request, );

int p_no = Integer.parseInt(request.getParameter("p_no"));

out.print("<script> alert('p_no'); </script>");

String type = request.getParameter("");
String newdata = request.getParameter("p_category");

out.print("<script> alert('newdata'); </script>");
%>