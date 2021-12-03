<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	// out.print( session.getAttribute("id"));
	// 1. 여러개의 세션 호출 [ 반환타입이 Enumetarator, Iterator 사용 불가-> Iterator 는 Object 타입인데 변환 불가능]
	Enumeration enumeration = session.getAttributeNames();
	
	while(enumeration.hasMoreElements()){
		// 2. 쿠키의 이름 하나 가져오기
		String name = (String)enumeration.nextElement();
		// 3. 
		String value= (String)session.getAttribute(name);
		
		out.println(" <br> 세션이름 : " + name + " <br> 세션 값은 : " + value);
		
	}
	
	%>

</body>
</html>