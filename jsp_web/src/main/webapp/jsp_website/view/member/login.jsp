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
	if (loginid != null) {
		out.print("<script> alert('로그인이 되어있습니다.'); </script>");
		out.println("<script> location.href='../main.jsp'; </script>");
	}
	%>

	<div class="container">
		<div class="text-center">
			<h3 style="border-bottm: solid 1px #eeeeee;">로그인</h3>
			<br>
			<p style="color: orange">로그인 화면입니다.</p>
		</div>

		<div class="row m-3">
			<div class="col-md-6">
				<img src="../../images/iu_01.jpg" width="100%">
			</div>

			<div class="col-md-6 align-self-center">
				<form action="../../controller/logincontroller.jsp" method="post">
					<div class="row">
						<div class="col-md-3 my-2 text-center">
							<label> 아이디 </label>
						</div>
						<div class="col-md-7 my-2 ">
							<input id="id1" type="text" name="id1" class="form-control">
						</div>
					</div>

					<div class="row">
						<div class="col-md-3 my-2 text-center">
							<label> 비밀번호 </label>
						</div>
						<div class="col-md-7 my-2">
							<input id="password" type="password" name="password"
								class="form-control">
						</div>
					</div>

					<%
					String result = request.getParameter("result");
					if (result != null) {
					%>

					<div class="text-center">
						<span style="color: red; font-family: 'NanumSquareBold';">
							회원 정보가 일치하지 않습니다. </span>
					</div>
					<%
					}
					%>

					<div class="row my-5" style="width: 25%; margin: 0 auto;">
						<input type="submit" value="로그인"
							class="btn btn-success form-control">
					</div>

					<div class="text-right m-2">
						<a href="findid.jsp" class="btn text-dark"> 아이디 찾기</a> <a
							href="findpassword.jsp" class="btn text-dark"> 비밀번호 찾기</a>
					</div>

				</form>
			</div>
		</div>
	</div>




</body>
</html>