<%@page import="dto.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../header.jsp" %>
	
	<%
		// 등록된 제품 정보를 불러온다. 
		int p_no = Integer.parseInt(request.getParameter("p_no")); // dashboard 에서 p_no 를 건네받는다. 
		
		Product product = ProductDao.getProductDao().get_single_product(p_no); // p_no 에 해당하는 product 객체 하나를 꺼내온다.
		
		// 왼쪽에 사진 띄우고, 오른쪽에 테이블 형태로 정보 출력하고 수정 버튼을 만든다. 
		
	
	%>
	
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-md-3 align-self-center">
				<img src="/jsp_web/jsp_website/upload/<%=product.getP_image() %>" class="img-fluid">
			</div>
			
			<div class="col-md-9">
			
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th colspan="3"> 제품 정보 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td> 제품 이름 </td>
							<td id="td_p_name"> <%=product.getP_name() %> </td>
							<td> <input type="button" class="btn btn-outline-primary" onclick="product_update_name(<%=product.getP_no() %>);" value="수정"> </td>
						</tr>
						
						<tr>
							<td> 제품 가격 </td>
							<td id="td_p_price"> <%=product.getP_price() %> </td>
							<td> <input type="button" class="btn btn-outline-primary" onclick="product_update_price();" value="수정"> </td>
						</tr>
						
						<tr id="tr_p_category_og">
							<td> 제품 카테고리 </td>
							<td id="p_category"> <%=product.getP_category() %> </td>
							<td> <input type="button" class="btn btn-outline-primary" onclick="product_update_category();" value="수정"> </td>
						</tr>
						
						<tr id="tr_p_category" style="display: none">
							<td> 제품 카테고리 </td>
							<td id="p_category_update">
								<input type="text" class="form-control" name="category" value="<%=product.getP_category()%>">
								<div class="dropdown">
									<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown"> 카테고리 </button>
									<div class="dropdown-menu" id="category_list">
										<a href="product_update.jsp?p_no=<%=product.getP_no() %>" class="dropdown-item" onclick="product_update_category(<%=product.getP_no() %>, top);">상의</a>
										<a href="product_update.jsp?p_no=<%=product.getP_no() %>" class="dropdown-item" onclick="product_update_category(<%=product.getP_no() %>, bottom);">하의</a>
									</div>
								</div>
							</td>
							
							<td> 
							<input id="p_btn_category" type="button" class="btn btn-outline-primary" onclick="product_update_category(<%=product.getP_no() %>);" value="수정"> 
							</td>
						</tr>
						
						<tr>
							<td> 제품 제조사 </td>
							<td id="p_manufacturer"> <%=product.getP_manufacturer()%> </td>
							<td> <input type="button" class="btn btn-outline-primary" onclick="product_update_manufacturer();" value="수정"> </td>
						</tr>
						
						<tr>
							<td> 제품 사이즈 </td>
							<td id="p_size"> <%=product.getP_size()%> </td>
							<td> <input type="button" class="btn btn-outline-primary" onclick="product_update_size();" value="수정"> </td>
						</tr>
						
						<tr>
							<td> 제품 재고 </td>
							<td id="p_instock"> <%=product.getP_instock()%> </td>
							<td> <input type="button" class="btn btn-outline-primary" onclick="product_update_instock();" value="수정"> </td>
						</tr>
						
						<tr>
							<td> 제품 이미지 </td>
							<td id="p_image"> <%=product.getP_image()%> </td>
							<td> <input type="button" class="btn btn-outline-primary" onclick="product_update_image();" value="수정"> </td>
						</tr>
						
						<tr>
							<td> 제품 설명 </td>
							<td id="p_contents"> <%=product.getP_contents()%> </td>
							<td> <input type="button" class="btn btn-outline-primary" onclick="product_update_contents();" value="수정"> </td>
						</tr>
					</tbody>
				
				</table>
			
			</div>
			
		
		</div>
	
	</div>

</body>
</html>