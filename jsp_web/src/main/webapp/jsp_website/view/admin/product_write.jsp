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
	
	<!-- script에서 유효성 검사 해보기  -->
	
	<div class="container">
		<form action="../../controller/product_write_controller.jsp" method="post" enctype="multipart/form-data" class="form-group">
			제품명 : <input type="text" name="p_name" class="form-control">
			가격 : <input type="text" name="p_price" class="form-control">
			카테고리 :
				<select  name="p_category" class="form-control">
					<option value="top"> 상의 </option>
					<option value="pants"> 하의 </option>
					<option value="outer"> 아우터 </option>
					<option value="etc"> 잡화 </option>
				</select>
			
			제조사 : <input type="text" name="p_manufacturer" class="form-control">
			제품상태 : 
				<select name="p_status" class="form-control">
						<option value="1"> 준비중 </option>
						<option value="2"> 판매중 </option>
						<option value="3"> 품절 </option>
				</select>
			
			제품사이즈 : 
				<select name="p_size" class="form-control">
						<option  value="S"> S </option>
						<option  value="M"> M </option>
						<option  value="L"> L </option>
				</select>
			
			
			제품재고 : <input type="text" name="p_instock" class="form-control">
			제품이미지 : <input type="file" name="p_image" class="form-control">
			제품내용 : <textarea rows="" cols="" name="p_contents"></textarea>
			<input type="submit" value="제품등록" class="btn btn-primary form-control">
		
		</form>
	
	</div>

</body>
</html>