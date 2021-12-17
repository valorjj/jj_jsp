<%@page import="dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Login_Id"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Login_Id login_Id = (Login_Id) session.getAttribute("login");
String sname = "cart" + login_Id.getM_id();
int i = Integer.parseInt(request.getParameter("i"));
int p_count = Integer.parseInt(request.getParameter("p_count"));

String type = request.getParameter("type");

int p_no = Integer.parseInt(request.getParameter("p_no"));
String p_size = request.getParameter("p_size");

ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute(sname);

if (type.equals("all")) { // 모두 삭제 버튼을 눌렀을 때 
	session.setAttribute(sname, null);

} else if (type.equals("in")) { // 개별 삭제 버튼을 눌렀을 때 

	for (Cart cart : carts) {
		if (cart.getP_no() == p_no && cart.getP_size().equals(p_size)) {
			session.setAttribute(sname, carts);
			carts.remove(cart);
			break;
		}
	}
} else if (type.equals("p")) {
	carts.get(i).setP_count(p_count);
	session.setAttribute(sname, carts);
} else if (type.equals("m")) {
	carts.get(i).setP_count(p_count);
	session.setAttribute(sname, carts);
}
%>