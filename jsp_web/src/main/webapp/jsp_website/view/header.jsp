<%@page import="dao.Login_Id"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.apache.catalina.connector.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/jsp_web/jsp_website/css/main.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>

<body>


	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- 다음 우편주소 js 호출 -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- js 호출 -->
	<script src="/jsp_web/jsp_website/js/main.js"></script>

	<!-- 헤더 시작 -->

	<%
	// 1. 세션 호출
	// String loginid = (String) session.getAttribute("loginid");
	Login_Id login_data = (Login_Id) session.getAttribute("login");
	String loginid = null; // 1.1 전역 변수로 사용, 스트링은 null 로 초기화 시켜둔다. 
	if (login_data != null) { // 1.2 세션이 있을때만 아이디 값을 부여해야한다. 아니면 계속 null 값 들어감
		loginid = login_data.getM_id();
	}
	%>

	<div class="fixed-top bg-white">
		<div class="container">
			<header class="py-3">
				<div class="row">
					<div class="text-center offset-4 text-center">
						<!-- 로고 혹은 웹 사이트명 -->
						<a href="/jsp_web/jsp_website/view/main.jsp" class="header_logo">
							T O P T E N Mall </a>
					</div>
					<div class="col-md-4 d-flex justify-content-end">
						<!-- 상단 메뉴 -->
						<ul class="nav">
							<%
							if (loginid != null) { // 1. 로그인이 되어있는 경우
								if (loginid.equals("admin")) { // 2. 관리자 계정으로 로그인 할 경우
							%>
								<li style="color: green;"><span>관리자님</span> 님 환영합니다.</li>
								<li><a href="/jsp_web/jsp_website/view/admin/dashboard.jsp" class="header_menu"> 관리자페이지 </a></li>
								<li><a href="/jsp_web/jsp_website/controller/logoutcontroller.jsp" class="header_menu"> 로그아웃 </a></li>
							<%
							} else {
							%>
								<li style="color: green;"><span><%=loginid%></span> 님 환영합니다.</li>
								<li><a href="/jsp_web/jsp_website/view/member/user_info.jsp" class="header_menu"> 회원정보 </a></li>
								<li><a href="/jsp_web/jsp_website/controller/logoutcontroller.jsp" class="header_menu"> 로그아웃 </a></li>
							<% } %>
							
							<%
							} else { /* 로그인 되어있지 않을 경우 */
							%>
							<li><a href="/jsp_web/jsp_website/view/member/login.jsp"
								class="header_menu">로그인</a></li>
							<li><a href="/jsp_web/jsp_website/view/member/signup.jsp"
								class="header_menu">회원가입</a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
			</header>

			<!-- 메인 메뉴 -->
			<nav class="navbar navbar-expand-lg navbar-light bg-white">

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-targer="#main_menu">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="main_menu">
					<ul class="navbar-nav col-md-12 justify-content-between">
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-item"> 아우터 </a></li>
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-item"> 상의 </a></li>
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-item"> 하의 </a></li>
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-item"> 남자 </a></li>
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-item"> 여자 </a></li>
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-item"> 이벤트 </a></li>
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-item"> 후기 </a></li>
						<li class="nav-item dropdown"><a
							href="/jsp_web/jsp_website/view/board/board_list.jsp"
							class="nav-link dropdown-item"> 고객센터 </a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>
</html>