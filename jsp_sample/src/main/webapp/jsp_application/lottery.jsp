<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="header.jsp" %>

	<%! 
	// 전역 변수로 쓰려면 여기에 선언한다. 
		int[] lottery_list = new int[6];  // 1. 유저가 선택한 숫자를 담는 배열
		int[] selected_numbers = new int[6]; // 2. 난수로 생성된 숫자가 담기는 배열 
		int count = 6;
		int win = 0;
		int idx = 0;
	%>
	
	<%
		
		request.setCharacterEncoding("UTF-8");
		for(int i=1; i<=45; i++) {
			boolean check = true;
			if(request.getParameter(i+"") != null && request.getParameter(i+"").equals(i+"")){
				for(int j=0; j<6; j++){
					if(lottery_list[j] == i){
						// 1. 중복 존재 
						out.print("중복 ");
						check = false;
						break;
					}
				}
				if(check){
					if(idx<=5){
						lottery_list[idx++] = i;
					} else{
						out.print("선택 종료 ");
						break;
					}
				}
			} 
		}
	%>
	
	<% 
		// 1. 난수 생성해서 당첨 번호를 만든다. 
		Random random = new Random();
		
		for(int i=0; i<6; i++){
			
			if(selected_numbers[i] == 0){
				int rand = random.nextInt(45);
				if(selected_numbers[i] != rand){
					selected_numbers[i] = rand;
				}
			}
		}
	%>
	
	<%
		// 1. 몇개나 당첨인지 출력한다.
		for(int i=0; i<6; i++){
			for(int j=0; j<6; j++){
				if(lottery_list[i] == selected_numbers[j]){
					win++;
				}
			}
		}
	%>

	<div class="container my-3 p-2">
		<div class="row" style="border: solid 1px #cccccc">
			<div class="col-md-6">
				<h3 style="color: green; font-size: 25px;"><% out.print("랜덤하게 생성된 숫자"); %></h3>
			</div>
			<div class="col-md-6" style="font-size: 30px; color: green;"> 
				<%
					for(int i=0; i<6; i++){
					out.print(selected_numbers[i] + "  ");
					} 
				%>
			</div>
		</div>
		
		<div class="row my-3" style="border: solid 1px #cccccc">
			<div class="col-md-6">
			 <h3 style="color: red; font-size: 25px;"><% out.print("유저가 선택한 숫자"); %></h3>
			</div>
			<div class="col-md-6" style="font-size: 30px; color: red;">
				<%
					for(int i=0; i<6; i++) { 
						out.print(lottery_list[i] + "\n");
					}
				%>
			</div>
		</div>
		
		<% if(lottery_list[5] != 0) { %>
	 		<div class="row my-3" style="border: solid 1px #cccccc" class="text-center">
				<h2 style="color: green; font-size : 30px;" > <% out.print("축하합니다. [ " + win +" ] 개 당첨입니다."); %></h2>
			</div> 
		<% } %>
		
		<form action="lottery.jsp" method="get">
			<table class="table table-borderless">
				<tr>
					<th> 1열 </th>
					<th> 2열 </th>
					<th> 3열 </th>
					<th> 4열 </th>
					<th> 5열 </th>
					<th> 6열 </th>
					<th> 7열 </th>
					<th> 8열 </th>
					<th> 9열 </th>
				</tr>
				
				<tr>
					<% for(int i=1; i<=45; i++) { %>
						<td> <button type="submit" class="btn btn-dark" name="<%=i %>" value="<%=i %>"> <%=i %>번</button> </td>
						<% if(i % 9 == 0) { %>
							</tr>
							<tr>
						<% } %>
					<% } %>
				</tr>
			</table>
		</form>
		
	</div>
</body>
</html>