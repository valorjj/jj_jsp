<%@page import="dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
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
	// 검색이 있을 경우 
	String key = request.getParameter("key");
	String keyword = request.getParameter("keyword");

	String pagenum = request.getParameter("pagenum");
	if (pagenum == null) {
		pagenum = "1";
	}

	// 페이징 처리 
	int lastrow = BoardDao.getboardDao().board_count(key, keyword); // 1. 총 게시물 수
	int listsize = 10; // 2. 페이지 당 화면에 표시할 게시물 수
	int lastpage = 0;
	if (lastrow % listsize == 0) {
		lastpage = lastrow / listsize;
	} else {
		lastpage = (lastrow / listsize) + 1;
	}

	int currentpage = Integer.parseInt(pagenum);
	int startrow = (currentpage - 1) * listsize; // 현재 페이지의 시작 번호

	ArrayList<Board> boards = BoardDao.getboardDao().board_list(startrow, listsize, key, keyword);
	%>

	<div class="container">

		<div class="text-center">
			<p style="font-size: 25px; color: green;" class="text-center">질문게시판</p>
		</div>

		<div class="text-center m-2">
			<div class="row">
				<div class="col-md-6 align-self-center" style="color: gray">고객센터
					1577-7011 연중무휴</div>
				<div class="col-md-6 align-self-center" style="color: gray">
					<p>자주 물어보는 질문</p>
					<table class="table">
						<tr>
							<td>Q&A</td>
							<td>아이디 분실</td>
						</tr>
						<tr>
							<td>Q&A</td>
							<td>비밀번호 분실</td>
						</tr>
						<tr>
							<td>Q&A</td>
							<td>배송조회</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<hr>

		<% if (keyword != null) { %>
			<p>
				총 게시물 수 : <%=lastrow%>
			</p>
		<% } else { %>
			<p>
				총 게시물 수 : <%=lastrow%>
			</p>
		<% } %>

		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>

			<%
			if (boards.size() == 0) {
			%>

			<tr>
				<td colspan="5">검색 결과가 존재하지 않습니다.</td>
			</tr>

			<%
			}
			%>

			<%
			for (Board board : boards) {
			%>

			<tr>
				<td><i class="bi bi-file-lock-fill"></i> <%=board.getB_no()%></td>
				<td><a href="board_view.jsp?b_no=<%=board.getB_no()%>"
					class="text-dark"><%=board.getB_title()%></a></td>
				<!-- 클릭한 게시물 번호도 같이 이동하게 만들자 -->
				<td><%=board.getB_writer()%></td>
				<td><%=board.getB_date()%></td>
				<td><%=board.getB_view()%></td>
			</tr>

			<%
			}
			%>

		</table>

		<div class="row">

			<div class="mx-auto">

				<ul class="pagination">

					<% if (currentpage == 1) { %>
					
						<% if (keyword == null) { %>
						<li class="page-item">
							<a href="board_list.jsp?pagenum=<%=currentpage%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link">
								<span aria-hidden="true"> &laquo; </span>
							</a>
						</li>

						<% } else { %>
							<li class="page-item">
								<a href="board_list.jsp?pagenum=<%=currentpage%>" class="page-link"> 
									<span aria-hidden="true"> &laquo; </span>
								</a>
							</li>
						<% } %>
						
					<% } else { %>

						<li class="page-item">
							<a href="board_list.jsp?pagenum=<%=currentpage - 1%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link"> 
								<span aria-hidden="true"> &laquo;</span>
							</a>
						</li>

					<% } %>
					
					<% for (int i = 1; i <= lastpage; i++) { %>
	
						<li class="page-item">
							<a href="board_list.jsp?pagenum=<%=i%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link"> <%=i%></a>
						</li>

					<% } %>

					<% if (currentpage == lastpage) { %>
						<li class="page-item">
							<a href="board_list.jsp?pagenum=<%=currentpage%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link">
								<span aria-hidden="true"> &raquo; </span>
							</a>
						</li>
					<% } else { %>
						<li class="page-item">
							<a href="board_list.jsp?pagenum=<%=currentpage + 1%>&key=<%=key%>&keyword=<%=keyword%>" class="page-link"> 
								<span aria-hidden="true"> &raquo; </span>
							</a>
						</li>
					<% } %>

				</ul>
			</div>
		</div>

		<form action="board_list.jsp?pagenum=<%=currentpage%>" method="get" class="col-md-6 offset-3 input-group my-2">
			<select class="custom-select col-md-3" name="key">
			
				<option value="b_title">제목</option>
				<option value="b_no">번호</option>
				<option value="b_writer">작성자</option>
				
			</select> 
			
				<input type="text" class="form-control" name="keyword"> 
				<input type="submit" class="form-control btn btn-outline-info" value="검색">
		</form>

		<%
		if (loginid != null) {
		%>
		<div class="d-md-flex justify-content-md-end">
			<a href="board_write.jsp">
				<button class="form-control btn btn-primary my-1">글쓰기</button>
			</a>
		</div>

		<%
		} else {
		%>
		<div class="d-md-flex justify-content-md-end">
			<p>로그인 후 글을 작성할 수 있습니다.</p>
		</div>
		<%
		}
		%>


	</div>

</body>
</html>