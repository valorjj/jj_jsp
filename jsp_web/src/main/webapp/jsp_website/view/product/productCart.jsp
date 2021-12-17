<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
<%@page import="dao.Login_Id"%>
<%@page import="dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<%@include file="../header.jsp"%>

	<%
	/* 	// 1. 로그인 시 생성된 로그인 세션을 호출한다.
		Login_Id login_Id = (Login_Id) session.getAttribute("login"); */
	// 2. 새로운 세션을 부여하기 위해서 cart + 유저 id 를 변수에 저장한다.
	String sname = "cart" + login_data.getM_id();
	// 3. 세션에 저장된 해당 아이디의 장바구니에 담긴 정보를 호출하고 리스트에 저장한다. 
	ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute(sname);
	int totalprice = 0; // 총 금액 출력을 위한 변수 
	DecimalFormat decimalFormat = new DecimalFormat("###,###");
	%>

	<div class="container">

		<div class="text-center my-2">
			<h3>장바구니</h3>
		</div>
		<hr>
		<table class="table">
			<tr class="table-success">
				<th>제품 이미지</th>
				<th>상품 정보</th>
				<th>제품 수량</th>
				<th>가격</th>
				<th>비고</th>
			</tr>

			<%
			if (carts == null) {
			%>
			<tr>
				<td colspan="5">장바구니에 상품이 없습니다.</td>
			</tr>

			<%
			} else {

			int i = 0;
			for (Cart cart : carts) {
				// 제품 번호에 해당하는 제품 객체 호출
				Product product = ProductDao.getProductDao().getProduct(cart.getP_no());
				// 총 가격 누적합계 
				totalprice += cart.getP_count() * product.getP_price();
			%>
			<tr>
				<td style="width: 10%;" class="align-middle"><img
					src="../../upload/<%=product.getP_image()%>" alt=""
					style="max-width: 100%;" /></td>
				<td style="width: 40%;" class="align-middle">
					<div class="p-1">
						제품명 : (<%=product.getP_manufacturer()%>)
						<%=product.getP_name()%>
					</div>
					<hr>
					<div class="p-1" style="font-size: 12px;">
						옵션 :
						<%=product.getP_size()%>
					</div>
				</td>
				<td class="row no-gutters">

					<button class="btn btn-outline-secondary"
						onclick="pchange2(<%=i%>, 'p' , <%=product.getP_instock()%> , <%=product.getP_price()%> )">
						+</button>

					<div class="col-md-2">

						<input id="pcount<%=i%>" value=<%=cart.getP_count()%>
							class="form-control" type="text"
							onchange="pchange2(<%=i%>, 's' , <%=product.getP_instock()%> , <%=product.getP_price()%> ) ">
					</div>

					<button class="btn btn-outline-secondary"
						onclick="pchange2(<%=i%>, 'm' , <%=product.getP_instock()%> , <%=product.getP_price()%> ) ">
						-</button>

				</td>
				<td id="total<%=i%>" style="width: 15%;" class="align-middle"><%=decimalFormat.format(product.getP_price() * cart.getP_count())%>
					원</td>
				<td style="width: 5%;"><button class="form-control"
						onclick="CartDelete('in', '<%=cart.getP_no()%>', '<%=cart.getP_size()%>')">X</button>
				</td>
			</tr>
			<%
			i++;
			}
			}
			%>
		</table>

		<div>
			<button class="form-control" onclick="CartDelete('all', '0', '0')">모두
				삭제</button>
		</div>

		<!-- <div class="d-flex align-items-center justify-content-center align-self-center">	 -->
		<div class="text-center totalbox my-3">

			<p class="align-self-center">
				총 상품 가격 <span><%=decimalFormat.format(totalprice)%></span> + 총 배송비 <span>3,000</span>
				= 총 주문금액 : <span><%=totalprice + 3000%></span>
			</p>



		</div>

		<div class="row my-3">
			<div class="col-md-3 offset-3">
				<a href="productPayment.jsp">
					<button class="form-control bg-success text-white p-3">
						주문하기</button>
				</a>
			</div>
			<div class="col-md-3">
				<button class="form-control p-3">쇼핑하기</button>
			</div>
		</div>


	</div>

</body>
</html>