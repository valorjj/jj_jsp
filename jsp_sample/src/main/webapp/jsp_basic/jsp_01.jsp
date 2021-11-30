<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p> jsp(java server pages) : 자바 서버 페이지 </p>
	
	<ul>
		<li> 1. HTML + JAVA 코드를 삽입할 수 있는 페이지 </li>
		<li> 2. (기본적으로) SERVLET 으로 변환된다. </li>
		<li> 3. JAVA 를 쓰다보니 웹 프로그래밍이 필요해졌다. 그래서 나온게 서블릿 </li>
		<li> 4. 근데 서블릿은 HTML 과 혼용해서 쓸 수 없었다. </li>
		<li> 5. 그래서 java + html 랑 섞어서 쓸 수 있는 jsp 가 나왔다. </li>
		<li> 6. Spring 은 프론트, 백엔드 따로따로 해야한다 </li>
		<li> 7. jsp 파일 내에서 java + html + css + js 동시에 쓸 수 있다. !</li>
		<li> 8. jsp 파일 실행했을 때, 서블릿[java]으로 변환된다. </li>
		
		
	
	</ul>
	
	<h1> 스크립트 예 </h1>
	
	<!-- JSP 구역 (선언문 태그 : 변수, 메소드 선언) -->
	<!-- 1. 변수 선언[전역 변수] 가능 2. 메소드 선언 가능 3. 출력은 안됨 -->
	<%! String 문자열 = "jsp 선언문"; %>
	<%! 
		public String 메소드(){return "jsp 메소드선언";}
	%>
	
	
	<!-- JSP 구역 (스크립트 태그, 메소드 선언 불가능, 변수 선언이나 실행만 가능하다.) -->
	<!-- 1. 변수 선언[지역 변수] 가능 2. 출력 가능 3. 메소드 선언 불가능 -->
	<% 
		String 스크립트 = "jsp 스크립트";
		String 내용 = "jsp testing";
		System.out.println("콘솔에 출력하는 메소드"); // 콘솔 출력 
		out.print("콘솔에 출력하는 메소드"); // html 에 출력 
	%>
	
	<!-- HTML 구역 -->
	<br> 선언문 출력 : <%=문자열 %> <!-- 표현식 태그 : 변수 / 메소드를 호출할 때 쓰인다. -->
	<br> 메소드 출력 : <%=메소드() %>
	<br> 스크립트 출력 : <%=스크립트 %>
	
	<!-- 주석 -->
	<br> html : <!-- html 주석 -->
	<br> css : /* CSS 주석*/
	<br> jsp : <%-- jsp 주석 --%>
	
	
	
</body>
</html>