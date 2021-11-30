<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 	<jsp:scriptlet>
		String name ="ddd";
	</jsp:scriptlet> --%>
	
	
	<jsp:forward page="action_tag_result_3.jsp">
		<jsp:param value="forwarded data" name="contents"/>
	</jsp:forward>
	
	
	

</body>
</html>