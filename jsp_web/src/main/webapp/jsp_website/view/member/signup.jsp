<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
</head>

<body>

	<%@ include file="../header.jsp"%>

	<div class="container">
		<!-- 박스권 생성 -->
		<div class="row">
			<!-- 가로 박스를 만드는 것 -->
			<div class="col-md-6">
				<img src="../../images/iu_01.jpg" width="100%">
			</div>

			<div class="col-md-6">

				<form id="signupform" action="../../controller/signupcontroller.jsp"
					method="post" onsubmit="return signupcheck()">

					<div class="row">
						<div class="col-md-3 m-2">
							<label> 아이디 </label>
						</div>
						<div class="col-md-8">
							<input id="id" onchange="signupcheck();" type="text" name="id"
								class="form-control" maxlength="15">
						</div>
						<div>
							<span id="idresult"></span>
						</div>
					</div>

					<div class="row">
						<div class="col-md-3 m-2">
							<label> 비밀번호 </label>
						</div>
						<div class="col-md-8">
							<input id="password" onchange="signupcheck();" type="password"
								name="password" class="form-control" maxlength="15">
						</div>
					</div>

					<div class="row">
						<div class="col-md-3 m-2">
							<label> 비밀번호확인 </label>
						</div>
						<div class="col-md-8">
							<input id="passwordconfirm" onchange="signupcheck();"
								type="password" name="passwordconfirm" class="form-control"
								maxlength="15">
						</div>

						<div>
							<span id="pwresult"></span>
						</div>
					</div>

					<div class="row">
						<div class="col-md-3 m-2">
							<label> 이름 </label>
						</div>
						<div class="col-md-8">
							<input id="name" onchange="signupcheck();" type="text"
								name="name" class="form-control">
						</div>
						<div>
							<span id="nameresult"></span>
						</div>
					</div>

					<div class="row">
						<div class="col-md-3 m-2">
							<label> 생년월일 </label>
						</div>
						<div class="col-md-8">
							<input id="birthdate" onchange="signupcheck();" type="date"
								name="birthdate" class="form-control">
						</div>
						<div>
							<span id="birthdateresult"></span>
						</div>
					</div>
					<div class="row">

						<div class="col-md-3 m-2">
							<label> 성별 </label>
						</div>

						<div class="col-md-8 text-center">
							<input id="gender1" onchange="signupcheck();" type="radio"
								name="gender" value="man"> 남 <input id="gender2"
								onchange="signupcheck();" type="radio" name="gender"
								value="woman"> 여
						</div>

						<div>
							<span id="genderresult"></span>
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

					<div>
						<input type="submit" value="가입 하기"
							class="form-control p-3 m-3 btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>