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


<%!
	String[] board = {" "," "," "," "," "," "," "," "," "};
%>

<%

	out.print(Arrays.toString(board));

%>


<%

	for(int j=0; j<board.length; j++){
		if(request.getParameter(j+"") != null && request.getParameter(j+"").equals(j+"") && board[j].equals(" ")) {
			out.print(j + " 번 선택 ");
			// user[j] = Integer.parseInt(request.getParameter("j"));
			board[j] = "O";
			
			// 컴퓨터 난수 
			
			while(true){
				Random random = new Random();
				int com = random.nextInt(9);
				
				if(board[com].equals(" ")){
					board[com] = "X";
					break;
				}
			}
		}
	}

%>

<form action="jsp_tic.jsp" method="get">

	<% for(int i=0; i<board.length; i++){ %>
		<button type="submit" value="<%=i %>" name=<%=i %>>
			<%=i %> 버튼
		</button>
		<% if(i%3 == 2){ out.print("<br>"); } %>
	<% } %>

</form>

	<%
		// 승리 조건 
		// 1,2,3 - 012
		// 4,5,6 - 345
		// 7,8,9 - 678
		// 1,4,7 - 036
		// 2,5,8 - 147
		// 3,6,9 - 258
		// 3,5,7
		// 1,5,9
		int player1 = 0;
		int player2 = 0;
		
		for(int i=0; i<board.length; i=i+3){
			if(board[i].equals("O") && board[i+1].equals("O") && board[i+2].equals("O")){
				player1++;
			}
			if(board[i].equals("X") && board[i+1].equals("X") && board[i+2].equals("X")){
				player2++;
			}
		}
		
		for(int i=0; i<3; i++){
			if(board[i].equals("O") && board[i+3].equals("O") && board[i+3].equals("O")){
				player1++;
			}
			if(board[i].equals("X") && board[i+3].equals("X") && board[i+3].equals("X")){
				player2++;
			}
		}
		
		if(board[0].equals("O") && board[4].equals("O") && board[8].equals("O")){
			player1++;
		}
		if(board[2].equals("O") && board[4].equals("O") && board[6].equals("O")){
			player1++;
		}
		if(board[0].equals("X") && board[4].equals("X") && board[8].equals("X")){
			player2++;
		}
		if(board[2].equals("X") && board[4].equals("X") && board[6].equals("X")){
			player2++;
		}
		
		if(player1 > player2){
			out.print("플레이어 승리");
		} else if(player1 < player2){
			out.print("컴퓨터 승리");
		}
	
	%>

</body>
</html>