<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h6>주문 그래프</h6>
				<canvas id="myChart"></canvas>
			</div>
			<div class="col-md-6">
				<h6>제품별 총 판매량</h6>
				<canvas id="productChart"></canvas>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				제품명 : <select class="form-control" onchange="showEachProductSales();" id="productSelect">
					<option value="" >제품명선택</option>
					<% ArrayList<Product> products = ProductDao.getProductDao().get_product_list(null, null); %>
					<% for(Product temp : products) { %>
						<option value="<%=temp.getP_no()%>"> <%=temp.getP_name() %></option>
					<% } %>
				</select>
				<h6>제품별 판매추이</h6>
				<canvas id="eachProductChart"></canvas>
			</div>
			<div class="col-md-6">
				<h6>제품별 판매량</h6>
				<canvas id=""></canvas>
			</div>
		</div>
	</div>




</body>
</html>