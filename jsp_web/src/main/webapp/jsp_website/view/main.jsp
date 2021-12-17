<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="header.jsp"%>

	<!-- 캐러셀 시작 -->

	<div class="carousel slide" data-ride="carousel" data-interval="2000">

		<ol class="carousel-indicators">
			<li data-target="#carouselcontent" data-slide-to="0" class="active"></li>
			<li data-target="#carouselcontent" data-slide-to="1"></li>
			<li data-target="#carouselcontent" data-slide-to="2"></li>
			<li data-target="#carouselcontent" data-slide-to="3"></li>
			<li data-target="#carouselcontent" data-slide-to="4"></li>
		</ol>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/jsp_web/jsp_website/images/c1.png">
			</div>
			<div class="carousel-item">
				<img src="/jsp_web/jsp_website/images/c2.png">
			</div>
			<div class="carousel-item">
				<img src="/jsp_web/jsp_website/images/c3.png">
			</div>
			<div class="carousel-item">
				<img src="/jsp_web/jsp_website/images/c4.png">
			</div>
			<div class="carousel-item">
				<img src="/jsp_web/jsp_website/images/c5.png">
			</div>
		</div>

		<!-- 케러셀 이미지 이동 버튼 -->
		<a class="carousel-control-prev" href="#carouselcontent"
			data-slide="prov"> <span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#carouselcontent"
			data-slide="next"> <span class="carousel-control-next-icon"></span>
		</a>

	</div>

	<!-- 캐러셀 종료 -->

	<hr>
	
	<div class="container text-center">
		<h3> 신제품 </h3>
		<p> New Arrival</p>
	</div>
	
	<!-- 제품 목록 시작 -->
	<div class="container">
		<div class="row">
		<!-- 반복문 돌아가는 부분 -->
		<%
			ArrayList<Product> products = ProductDao.getProductDao().get_product_list(null, null);
			for(Product product : products){
		%>
			<div class="col-md-4">
				<div class="card">
					<a href="product/productView.jsp?p_no=<%=product.getP_no()%>"><img alt="" src="/jsp_web/jsp_website/upload/<%=product.getP_image() %>" class="card-img-top pimg"></a>
					<div class="card-body">
						<p class="card-text"> <%=product.getP_name() %> </p>
						<hr>
						<p class="item"> 
						<%=product.getP_contents() %> <br>
						<span class="price"> <%=product.get_decimal() %> </span> <br>
						<span class="badge badge-pill badge-danger"> <%=product.get_status() %> </span>
						</p>
					</div>
				</div>
			</div>
		<% } %>
		<!--  -->
		
		</div>
	
	</div>
	
	
	<!-- 제품 목록 종료 -->


	<%@ include file="footer.jsp"%>


</body>
</html>