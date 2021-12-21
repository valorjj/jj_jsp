<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<%
	// 제품 전체 리스트 가져오기 
	
	String key = request.getParameter("key");
	String keyword = request.getParameter("keyword");
	
	
	String pagenum = request.getParameter("pagenum");
	if(pagenum == null){
		pagenum = "1";
	}
	
	int lastrow = ProductDao.getProductDao().product_count(key, keyword);
	int listsize = 10;
	int lastpage = 0;
	if(lastrow % listsize == 0){
		lastpage = lastrow / listsize;
	} else {
		lastpage = (lastrow/listsize) + 1;
	}
	
	int currentpage = Integer.parseInt(pagenum);
	int startrow = (currentpage - 1) * listsize;
	
	ArrayList<Product> products = ProductDao.getProductDao().get_product_list(startrow, listsize, key, keyword);

	%>

	<div class="container">
		
		<!-- 검색 -->
		<form action="dashboard.jsp?pagenumber=<%=currentpage %>" method="get" class="col-md-5 offset-3 input-group my-3">
			<select class="custom-select col-md-3" name="key">
				<option value="p_no"> 제품번호</option>
				<option value="p_name"> 제품명</option>
				<option value="p_category"> 카테고리</option>
				<option value="p_status"> 제품상태</option>
			</select>
			<input type="text" class="form-control" name="keyword">
			<input type="submit" class="form-control btn btn-outline-info" value="검색">
		</form>
		<div class="row d-flex justify-content-end">
			<a href="product_write.jsp" class="">
				<button class="form-control btn btn-outline-success">제품 등록</button>
			</a>
			<a href="productChart.jsp" class="">
				<button class="form-control btn btn-outline-success">제품 통계</button>
			</a>
			
			<a href="api.jsp" class="">
				<button class="form-control btn btn-outline-success">백신접종</button>
			</a>
			
		</div>
		<br>
		<hr>
		
		<h3>제품 목록</h3>

		<table class="table">
			<tr>
				<th scope="col">이미지</th>
				<th scope="col">제품번호</th>
				<th scope="col">제품명</th>
				<th scope="col">제품가격</th>
				<th scope="col">카테고리</th>
				<th scope="col">상태</th>
				<th scope="col">사이즈</th>
				<th scope="col">재고</th>
				<th scope="col">제품등록일</th>
				<th scope="col">비고</th>
			</tr>
			<%
				for(Product product : products){ 
			%>
				<tr>
					<td width="150px;"><img src="/jsp_web/jsp_website/upload/<%=product.getP_image() %>" style="max-width: 100%;"> </td>
					<td><%=product.getP_no() %> </td>
					<td><%=product.getP_name() %> </td>
					<td><%=product.get_decimal() %> </td>
					<td><%=product.getP_category() %> </td>
					<td><%=product.get_status() %> </td>
					<td><%=product.getP_size() %> </td>
					<td><%=product.getP_instock() %> </td>
					<td><%=product.getP_date() %> </td>
					<td>
					<a href="product_update.jsp?p_no=<%=product.getP_no()%>"><button class="btn btn-outline-success"> 수정 </button> </a>
					<a href="../../controller/product_delete_controller.jsp?p_no=<%=product.getP_no() %>"><button class="btn btn-outline-success"> 삭제 </button> </a>
					<input type="button" class="btn btn-outline-success" onclick="activeupdate(<%=product.getP_no()%>);" value="상태변경"> 
					</td>
				</tr>
			<% } %>

		</table>
		
		<div class="row">
			<div class="mx-auto">
				<ul class="pagination">
					<% if (currentpage == 1) { %>
						<% if (keyword == null) { %>
						<li class="page-item">
							<a href="dashboard.jsp?pagenum=<%=currentpage%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link">
								<span aria-hidden="true"> &laquo; </span>
							</a>
						</li>

						<% } else { %>
							<li class="page-item">
								<a href="dashboard.jsp?pagenum=<%=currentpage%>" class="page-link"> 
									<span aria-hidden="true"> &laquo; </span>
								</a>
							</li>
						<% } %>
						
					<% } else { %>

						<li class="page-item">
							<a href="dashboard.jsp?pagenum=<%=currentpage - 1%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link"> 
								<span aria-hidden="true"> &laquo;</span>
							</a>
						</li>

					<% } %>
					
					<% for (int i = 1; i <= lastpage; i++) { %>
	
						<li class="page-item">
							<a href="dashboard.jsp?pagenum=<%=i%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link"> <%=i%></a>
						</li>

					<% } %>

					<% if (currentpage == lastpage) { %>
						<li class="page-item">
							<a href="dashboard.jsp?pagenum=<%=currentpage%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link">
								<span aria-hidden="true"> &raquo; </span>
							</a>
						</li>
					<% } else { %>
						<li class="page-item">
							<a href="dashboard.jsp?pagenum=<%=currentpage + 1%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link"> 
								<span aria-hidden="true"> &raquo; </span>
							</a>
						</li>
					<% } %>

				</ul>
			</div>
		</div>
		


	</div>

</body>
</html>