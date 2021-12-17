<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
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

	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


	<%
	String sname = "cart" + loginid;
	ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute(sname);

	// 총 제품 금액 
	int totalprice = 0;

	DecimalFormat decimalFormat = new DecimalFormat("###,###"); // 자바에서 1,000 찍는 방법

	// 회원 정보 불러오기 
	Member member = MemberDao.getmemberDao().get_member_instance(loginid);

	String[] memberAddress = member.getM_address().split(",");
	%>

	<input type="hidden" id="mname" value="<%=member.getM_name()%>">
	<input type="hidden" id="mphone" value="<%=member.getM_phone()%>">
	<%-- <input type="hidden" id="totalprice" value="<%=totalprice%>"> --%>
	<input type="hidden" id="addr1" value="<%=memberAddress[0]%>">
	<input type="hidden" id="addr2" value="<%=memberAddress[1]%>">
	<input type="hidden" id="addr3" value="<%=memberAddress[2]%>">
	<input type="hidden" id="addr4" value="<%=memberAddress[3]%>">

	<div class="container">

		<table class="table">

			<thead>
				<tr class="table-success">
					<th>이미지</th>
					<th class="text-center">상품 정보</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
				</tr>
			</thead>
			<tbody>

				<%
				for (Cart cart : carts) {
					Product product = ProductDao.getProductDao().getProduct(cart.getP_no());
					totalprice += cart.getP_count() * product.getP_price();
				%>

				<tr>
					<td style="width: 10%;"><img
						src="../../upload/<%=product.getP_image()%>"
						style="max-width: 100%;"></td>
					<td style="width: 50%;">
						<div class="px-1" class="align-middle">
							(<%=product.getP_manufacturer()%>)
							<%=product.getP_name()%>
						</div>
						<hr />
						<div class="px-1" style="font-size: 12px;"
							class="align-middle preview">
							<%=cart.getP_size()%>
						</div>
					</td>
					<td style="font-size: 20px;"
						class="align-middle text-center preview"><%=cart.getP_count()%>
					</td>
					<td class="align-middle text-center"><%=decimalFormat.format(cart.getP_count() * product.getP_price())%></td>


				</tr>

				<%
				}
				%>

			</tbody>

		</table>
		<br /> <br />
		<div class="row">
			<div class="col-md-6">
				<span
					style="color: green; margin: 5%; padding: 2%; font-size: 19px;">
					받는 사람 정보 </span> <input id="pay_check" type="checkbox"> 회원과 동일
				<hr />
				<div class="row my-3">
					<div class="col-md-3 m-2">
						<label> 이름 </label>
					</div>
					<div class="col-md-8">
						<input id="name" onchange="signupcheck();" type="text" name="name"
							class="form-control">
					</div>
					<div>
						<span id="nameresult"></span>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 m-2">
						<label> 연락처 </label>
					</div>
					<div class="col-md-8">
						<input id="phone" onchange="signupcheck();" type="text"
							name="phone" class="form-control" placeholder="000-0000-0000">
					</div>
					<div>
						<span id="phoneresult"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 m-2">
						<label> 배송 요청 사항 </label>
					</div>
					<div class="col-md-8">
						<input id="prequest" type="text" name="prequest"
							class="form-control" placeholder="배송시 요청 사항을 입력하세요">
					</div>
					<div>
						<span id="nameresult"></span>
					</div>
				</div>
				<br />
				<hr />
				<br /> <span
					style="color: green; margin: 5%; padding: 2%; font-size: 19px;">
					받는 사람 주소 </span> <input id="pay_check_address" type="checkbox">
				회원과 동일
				<hr />
				<div class="row">
					<div class="col-md-3 m-2">
						<label> 주소 </label>
					</div>
					<div class="col-md-8">
						<div class="row my-3">
							<div class="col-md-7">
								<input type="text" name="address1" id="sample4_postcode"
									placeholder="우편번호" class="form-control">
							</div>
							<div class="col-md-5">
								<input type="button" onclick="sample4_execDaumPostcode()"
									value="우편번호 찾기" class="form-control btn btn-primary">
							</div>
						</div>

						<div class="row my-3">
							<div class="col-md-6">
								<input type="text" name="address2" id="sample4_roadAddress"
									placeholder="도로명주소" class="form-control">
							</div>
							<div class="col-md-6">
								<input type="text" name="address3" id="sample4_jibunAddress"
									placeholder="지번주소" class="form-control">
							</div>
						</div>

						<input type="text" name="address4" id="sample4_detailAddress"
							placeholder="상세주소" class="form-control">
					</div>
					<div>
						<span id="addressresult"></span>
					</div>
				</div>



			</div>


			<div class="col-md-6 border border-success p-3">

				<span
					style="color: green; margin: 5%; padding: 2%; font-size: 19px;">
					결제 정보 </span>
				<hr />
				<br />
				<div class="row">
					<div class="col-md-3 m-2">
						<label> 마일리지 </label>
					</div>
					<div class="col-md-8">
						<input id="point" type="text" class="form-control"
							placeholder="사용가능한 포인트" class="my-2 p-1">
						<div class="d-grid gap-2 d-md-flex justify-content-md-end my-1">
							<button class="btn btn-outline-success"
								onclick="pointCheck('<%=member.getM_point()%>');">사용</button>
						</div>
						사용가능 마일리지 :
						<%=member.getM_point()%>
						<div>
							<span id="pointWarning" style="color: red;"></span>
						</div>
					</div>
				</div>
				<br>
				<hr />
				<br />

				<h5>결제 금액</h5>
				<div class="row">

					<div class="col-md-3">총 주문 상품 수</div>
					<div class="col-md-9">
						<span><%=carts.size()%></span>
					</div>

					<div class="col-md-3">총 주문 금액</div>
					<div class="col-md-9">
						<span id="totalprice" class="payment"><%=totalprice%></span>
					</div>

					<div class="col-md-3">배송비</div>
					<div class="col-md-9">
						<span id="totalDelivery" class="payment"> 3000 </span>
					</div>

					<div class="col-md-3">사용한 포인트</div>
					<div class="col-md-9">
						<span id="userPoint" class="payment">0</span>
					</div>

					<div class="col-md-3">최종 결제 금액</div>
					<div class="col-md-9">
						<span id="totalPay" class="payment"><%=totalprice + 3000%></span>
					</div>

				</div>

				<br />
				<hr />

				<h6>결제 방식</h6>
				<div class="row d-flex justify-content-around my-1">
					<button onclick="paymentselect('samsung');"
						class="btn btn-outline-danger col-md-2">삼성페이</button>
					<button onclick="paymentselect('card');"
						class="btn btn-outline-danger col-md-2">신용카드</button>
					<button onclick="paymentselect('trans');"
						class="btn btn-outline-danger col-md-2">계좌이체</button>
					<button onclick="paymentselect('vbank');"
						class="btn btn-outline-danger col-md-2">가상계좌</button>
					<button onclick="paymentselect('phone');"
						class="btn btn-outline-danger col-md-2">휴대폰</button>
				</div>

				<div id="payselect"> </div>
				
				<div class="row d-flex justify-content-around my-5">
					<button class="col-md-5 form-control btn btn-warning p-3"
						onclick="payment();">결제하기</button>
					<button class="col-md-5 form-control p-3">결제취소</button>
				</div>
			</div>
		</div>
		
		<button class="btn btn-outline-success" onclick="payment()">카드결제</button>

	</div>


</body>
</html>