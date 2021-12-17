<%@page import="dto.Member"%>
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

	<%@ include file="../header.jsp"%>

	<%
	Member member = MemberDao.getmemberDao().get_member_instance(loginid);
	%>

	<!-- 로그인 된 유저 정보를 나타내는 페이지 -->

	<div class="container">
	
		<div style="margin: 10px">
			<h3 style="border-bottom: solid 1px #eeeee;"> 회원 정보 </h3>
			<br>
			<p style="color: orange;"> · 공지사항을 참고해주세요 · </p>
		</div>
		
		<div class="row">
			<!-- 사이드바 -->
			<div class="col-md-3">
				<div class="nav flex-column nav-pills">
					<a href="#pills-order" data-toggle="pill" class="nav-link active">주문
						내역</a> <a href="#pills-memberinfo" data-toggle="pill" class="nav-link">회원
						정보</a> <a href="#pills-memberwrite" data-toggle="pill"
						class="nav-link">내가 쓴 글</a> <a href="#pills-memberupdate"
						data-toggle="pill" class="nav-link">회원 수정</a> <a
						href="#pills-memberdrop" data-toggle="pill" class="nav-link">회원
						탈퇴</a>
				</div>
			</div>

			<!-- 본문 -->
			<div class="col-md-9">
				<!-- 페이지 전환이 없고, 내용물만 바뀜 -->
				<div class="tab-content" id="pills-tabcontent">

					<!-- 1. 회원 정보를 출력하는 섹션 -->
					<div class="tab-pane fade " id="pills-memberinfo">
						<div class="container">
							<table class="table table-bordered">
								<thead>
									<tr class="text-center">
										<th colspan="3" class="table-primary">회원 개인 정보</th>
									</tr>
								</thead>
								<tbody>
									<tr class="text-center">
										<td colspan="2">아이디</td>
										<td><%=member.getM_id()%></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td id="tdpassword"><%=member.getM_password()%></td>
										<td>
											<button class="form-control btn btn-success"
												onclick="updatepassword();">수정</button>
										</td>
									</tr>
									<tr>
										<td>이름</td>
										<td id="tdname"><%=member.getM_name()%></td>
										<td>
											<button class="form-control btn btn-success"
												onclick="updatename();">수정</button>
										</td>
									</tr>
									<tr>

										<td>생년월일</td>
										<td id="tdbirthdate"><%=member.getM_birthdate()%></td>
										<td>
											<button class="form-control btn btn-success"
												onclick="updatebirthdate();">수정</button>
										</td>

									</tr>

									<tr>
										<td>연락처</td>
										<td id="tdphone"><%=member.getM_phone()%></td>
										<td>
											<button class="form-control btn btn-success"
												onclick="updatephonenumber();">수정</button>
										</td>
									</tr>

									<tr>
										<td>주소</td>
										<td id="tdaddress"><%=member.getM_address().substring(6)%></td>
										<td>
											<button class="form-control btn btn-success" id="add_update"
												data-toggle="collapse" data-target="#traddress"
												aria-expanded="false">수정</button>
										</td>
									</tr>

									<tr id="traddress" class="collapse">
										<td colspan="3">
											<div class="row">
												<div class="row my-3 m-2">
													<div class="col-md-7">
														<input type="text" name="address1" id="sample4_postcode"
															placeholder="우편번호" class="form-control">
													</div>
													<div class="col-md-5">
														<input type="button" onclick="sample4_execDaumPostcode()"
															value="우편번호 찾기" class="form-control btn btn-primary">
													</div>
												</div>

												<div class="row my-3 m-2">
													<div class="col-md-6">
														<input type="text" name="address2"
															id="sample4_roadAddress" placeholder="도로명주소"
															class="form-control">
													</div>
													<div class="col-md-6">
														<input type="text" name="address3"
															id="sample4_jibunAddress" placeholder="지번주소"
															class="form-control">
													</div>
												</div>

												<div class="col-md-8 m-2">
													<input type="text" name="address4 m-2"
														id="sample4_detailAddress" placeholder="상세주소"
														class="form-control">
												</div>

											</div>

											<div>
												<input type="button"
													class="form-control btn btn-warning m-2" value="주소변경"
													onclick="updateaddress();" id="addressupdatebtn">
											</div>

										</td>
									</tr>

									<tr class="text-center">
										<td colspan="2">가입날짜</td>
										<td><%=member.getM_sdate().substring(0, 11)%></td>
									</tr>
									<tr class="text-center">
										<td colspan="2">성별</td>
										<td class="tdgender"><%=member.getM_gender()%></td>
										<td>
											<button class="form-control btn btn-success"
												onclick="updategender();">수정</button>
										</td>

									</tr>
									<tr class="text-center">
										<td colspan="2">포인트</td>
										<td><%=member.getM_point()%></td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>

					<div class="tab-pane fade " id="pills-memberwrite">

						<h3>내가 쓴 글</h3>

						<div class="container"></div>

					</div>

					<div class="tab-pane fade " id="pills-memberupdate">
						<h3>회원 정보 수정</h3>
						<!-- 회원 정보 수정하는 섹션 -->
						<div class="container">
							<div class="col-md-6 offset-3">
								<form id="updateform">
									<div class="input-group m-2">
										<span class="input-group-text">아이디</span> <input id="id"
											type="text" class="form-control" placeholder="아이디">
									</div>
									<div class="input-group m-2">
										<span class="input-group-text">비밀번호</span> <input
											id="password" type="password" class="form-control"
											placeholder="비밀번호">
									</div>
									<div class="input-group m-2">
										<span class="input-group-text">핸드폰번호</span> <input id="phone"
											type="text" class="form-control" placeholder="핸드폰번호">
									</div>
									<div class="input-group m-2">
										<input type="button" id="memberupdate"
											class="form-control btn btn-warning" value="정보수정">
									</div>
								</form>
							</div>
						</div>
					</div>

					<div class="tab-pane fade " id="pills-memberdrop">
						<div class="container">
							<div class="col-md-6 offset-3 ">
								<h4 id="dropresult">회원 탈퇴를 진행하시겠습니까?</h4>
								<br>
								<form id="dropform">
									<input type="password" id="password" class="form-control"
										name="password" placeholder="패스워드입력"> <br>
									<!-- type submit 에서 button 으로 바꾼다 (ajax) -->
									<input type="button" id="memberdrop"
										class="form-control btn btn-danger" value="탈퇴">
								</form>
							</div>
						</div>
					</div>

				</div>

				<div class="tab-content" id="pills-tabcontent"></div>

			</div>

		</div>

	</div>






	<%@ include file="../footer.jsp"%>

</body>
</html>