<%@page import="dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.POrderDao"%>
<%@page import="dao.Login_Id"%>
<%@page import="dto.POrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String order_name = request.getParameter("order_name");
String order_phone = request.getParameter("order_phone");
String order_address = request.getParameter("order_address");
int order_pay = Integer.parseInt(request.getParameter("order_pay"));
String order_payment = request.getParameter("order_payment");
int delivery_pay = Integer.parseInt(request.getParameter("delivery_pay"));
String order_request = request.getParameter("order_request");

// 1. 주문 등록 [주문 DB 를 등록한다.]
// 1.1 회원 번호 : m_no : 세션
// 1.2 수령자 : order_name
// 1.3 수령자 연락처 : order_phone
// 1.4 수령자 주소 : order_adress
// 1.5 주문 총 금액 : order_pay
// 1.6 결제 수단 : order_payment
// 1.7 배송비 : delivery_pay

Login_Id login_data = (Login_Id) session.getAttribute("login");
int m_num = login_data.getM_num();

POrder porder = new POrder(
		m_num,
		order_name,
		order_phone,
		order_address,
		order_pay,
		order_payment,
		delivery_pay,
		order_request
		);

// Cart 세션 불러오기 


String sname = "cart"+login_data.getM_id();
ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute(sname);

boolean result = POrderDao.getPOrderDao().addPOrder(porder, carts);

if(result){
	// DB 등록 성공 
	out.print("1");
	// 성공했으면 session 값을 초기화시킨다. 
	session.setAttribute(sname, null); // 장바구니 초기화 ! 
	
} else {
	// DB 등록 실패
	out.print("0");
}

// 2. 주문 상세 [주문 등록이 된다는 가정하에] : 반복문
// 2.1 오더 번호 : order_no : DB
// 2.2 상품 번호 : p_no [cart 세션, 반복문 돌리기]
// 2.3 구매 수량 : p_count [cart 세션, 반복문 돌리기]
// 2.4 배송 상태 : delivery_state : (임의의 값으로 처리) 사업자 등록 번호가 없어서 배송사 api 연결 불가

// 3. 재고 감소 

// 4. 카트 세션 초기화
%>