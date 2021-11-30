<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<%
	// 초기값이 null 이기 때문에 값을 하나 입력한다. 검색을 하기 전에는 null 값이니께 ~ 
	int year = 2021;
	int month = 11;
	// 검색이 있다 -> request 가 있다 
	if (request.getParameter("year") != null && request.getParameter("month") != null) {
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
	}
	%>

	<%
	Calendar calendar = Calendar.getInstance();
	int eday = calendar.getActualMaximum(calendar.DAY_OF_MONTH);

	calendar.set(year, month - 1, 1);
	int sweek = calendar.get(Calendar.DAY_OF_WEEK);
	%>

	<h1>
		<%=year%>
		년 :
		<%=month%>
		월 달력
	</h1>

	<form action="jsp_check_1.jsp" method="get">
		검색 : <input type="text" name="year" placeholder="연도"> <input
			type="text" name="month" placeholder="월"> <input
			type="submit" value="검색">

	</form>

	<table border="1">
		<thead>
			<tr>
				<th>일요일</th>
				<th>월요일</th>
				<th>화요일</th>
				<th>수요일</th>
				<th>목요일</th>
				<th>금요일</th>
				<th>토요일</th>
			</tr>
		</thead>

		<tbody>

			<tr>

				<%
				for (int i = 1; i < sweek; i++) {
				%>

				<td></td>

				<%
				}
				%>

				<%
				for (int i = 1; i <= eday; i++) {
				%>
				<td><%=i%></td>

				<%
				if (sweek % 7 == 0) {
				%>

				</tr>
				
				
				<tr>
				<%
				}
				sweek++;
				}
				%>

			</tr>
		</tbody>
	</table>
</body>
</html>