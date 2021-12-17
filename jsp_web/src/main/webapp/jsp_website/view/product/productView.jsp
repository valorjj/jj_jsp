<%@page import="dto.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<%
	// 1. 제품 상세 페이지 
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	Product product = ProductDao.getProductDao().getProduct(p_no);
	%>

	<%@ include file="../header.jsp"%>

	<div class="container">

		<div class="row">

			<div class="col-md-6">

				<img src="../../upload/<%=product.getP_image()%>" alt=""
					style="max-width: 100%;">

			</div>
			<!-- <form action="../../controller/컨트롤러.jsp" method="get"> ... </form> -->
			<div class="col-md-6">
				<input type="hidden" class="p_no" name="p_no" id="p_no"
					value="<%=product.getP_no()%>">
				<p><%=product.getP_manufacturer()%></p>
				<h4><%=product.getP_name()%></h4>
				<hr />
				<div class="row">
					<div class="col-md-3">구매 혜택</div>
					<div class="col-md-9">포인트 1% 제공</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-3">배송 정보</div>
					<div class="col-md-9">영업일 기준 1-3일 소요</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-md-3">가격</div>
					<div class="col-md-9">
						<%=product.get_decimal()%></div>
				</div>
				<hr />

				<div class="row">
					<div class="col-md-3">제품 사이즈</div>
					<div class="col-md-9">
						<p>제품 사이즈</p>
						<select name="p_size" id="p_size" class="form-control">
							<option value="0">옵션 선택</option>
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
						</select>
					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-md-3">수량</div>
					<div class="col-md-9 row no-gutters">

						<button class="btn btn-outline-secondary"
							onclick="pchange('p' , <%=product.getP_instock()%> , <%=product.getP_price()%> )">
							+</button>

						<div class="col-md-2">
							<!-- 초기값을 1 로 준다. -->
							<input id="pcount" value="1" class="form-control" type="text"
								onchange="pchange('s' , <%=product.getP_instock()%> , <%=product.getP_price()%> ) ">
						</div>

						<button class="btn btn-outline-secondary"
							onclick="pchange('m' , <%=product.getP_instock()%> , <%=product.getP_price()%> ) ">
							-</button>
					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col-md-3">총 상품 금액</div>
					<div class="col-md-9 text-right">
						<span id="total"><%=product.get_decimal()%> </span> 원
					</div>
				</div>
				<hr />

				<div>
					<button class="form-control bg-success text-white"
						style="font-size: 1.5rem">구매하기</button>
				</div>


				<div class="row my-3">


					<div class="col-md-6 d-flex justify-content-center">
						<button class="form-control" onclick="cartadd()">장바구니</button>
					</div>



					<div class="col-md-6 d-flex justify-content-center">

						<%
						int m_num = 0;
						if (login_data != null) {
							m_num = login_data.getM_num();
						}
						if (ProductDao.getProductDao().isplikeCheck(p_no, m_num)) {
						%>

						<button class="form-control" id="btnplike"
							onclick="plike(<%=product.getP_no()%>, <%=m_num%>)">
							찜하기 <i class="bi bi-heart-fill"></i>
						</button>

						<%
						} else {
						%>

						<button class="form-control" id="btnplike"
							onclick="plike(<%=product.getP_no()%>, <%=m_num%>)">
							찜하기 <i class="bi bi-heart"></i>
						</button>

						<%
						}
						%>

					</div>

				</div>

			</div>

		</div>


	</div>

	<!-- container ends here -->

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- href 는 tag 로도 이동이 가능하다. id 값을 매겨서 이동 -->
		<ul class="navbar-nav col-md-12 text-center">
			<li class="nav-item col-md-3"><a href="#detail"
				class="nav-link preview">상품 상세</a></li>
			<li class="nav-item col-md-3"><a href="#guide"
				class="nav-link preview">상품 가이드</a></li>
			<li class="nav-item col-md-3"><a href="#review"
				class="nav-link preview">상품 리뷰</a></li>
			<li class="nav-item col-md-3"><a href="#question"
				class="nav-link preview">상품 문의</a></li>
		</ul>

	</nav>


	<div id="detail">
		상품 상세 위치 <br> <br> <br> <br> <br> <br>
	</div>

	<div id="guide">
		상품 가이드 위치 <br> <br> <br> <br> <br> <br>
	</div>

	<div id="review">
		상품 리뷰 위치 <br> <br> <br> <br> <br> <br>
	</div>

	<div id="question">
		상품 문의 위치 <br> <br> <br> <br> <br> <br>
	</div>


</body>
</html>