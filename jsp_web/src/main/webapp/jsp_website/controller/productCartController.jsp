<%@page import="dao.Login_Id"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 0. 장바구니 

// 1. 선택한 제품의 제품 번호, 옵션, 수량을 Session 에 담는다. 

int p_no = Integer.parseInt(request.getParameter("p_no"));
String p_size = request.getParameter("p_size");
int p_count = Integer.parseInt(request.getParameter("p_count"));

// 2. 전달받은 인수를 사용해 장바구니 정보 객체화 
Cart cart = new Cart(p_no, p_size, p_count);

// 3. 세션에 저장 [ 이름 : cart+{$UserId} : cart 리스트(carts) ]

Login_Id login_Id = (Login_Id) session.getAttribute("login"); // 4. 세션 자료형은 Object 라서 강제로 형변환 시켜야한다. 
String sname = "cart" + login_Id.getM_id();

// 4. 기존 카트가 존재할 경우, 존재하지 않는 경우를 나눈다. 

ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute(sname);

if (carts == null) { // 기존에 카트가 없을 때 (0 이 아니라 null 로 예외처리)
	carts = new ArrayList<>(); // 아무것도 없을 때 메모리 할당을 새롭게 하고 add 시킨다.
	carts.add(cart); // 리스트에 추가 
	session.setAttribute(sname, carts); // 카트 세션 생성
} else { // 기존 카트가 존재할 때
	boolean p_check = false;
	for (Cart temp : carts) {
		if (temp.getP_no() == p_no && temp.getP_size().equals(p_size)) {
	// 카트에 제품번호와 제품 사이즈가 동일한 경우 카운트를 증가시킨다. (원래 카트에 담겨있던거랑 동일하면)
	temp.setP_count((temp.getP_count() + p_count));
	// session.setAttribute(sname, carts); // 업데이트된 값으로 새로운 세션을 할당시킨다.
	p_check = true; // 중복이 있으면 true 
		}
	}

	if (!p_check) {
		carts.add(cart); // 동일한 제품이 없을 경우 카트 리스트에 제품 추가한다.
	}
	session.setAttribute(sname, carts); // 세션을 다시 할당한다. 
}

// 5. 세션의 이름 : 데이터 

// 비동기식 사용시 페이지 전환 X. ajax 사용해서 바로 쇼핑카트로 넘어간다. 
// response.sendRedirect("../view/product/productCart.jsp");
%>
