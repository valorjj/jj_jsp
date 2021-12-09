<%@page import="dto.Member"%>
<%@page import="dto.Reply"%>
<%@page import="dao.ReplyDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.File"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
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
	/* 
	클릭한 사람들의 IP 를 넣는다. 
	ArrayList<String> temp = new ArrayList<>(); 
	*/

	// 1. 이렇게 하면 1명 밖에 적용이 안된다.. 클래스를 만들자 ! 
	int b_no = Integer.parseInt(request.getParameter("b_no")); // 1. 이전 페이지에서 클릭한 게시물 번호를 넘겨받는다.
	String board_views = loginid + ":" + b_no;

	if (session.getAttribute(board_views) == null) {
		BoardDao.getboardDao().board_view_count_update(b_no);
		// 2. 조회수 증가 방지 [세션 : 세션 아이디 : 세션 값]
		// 2.1 해당 로그인한 사람이 봤는지 안봤는지 체크하는 방법 --- 방법이 여러가지 존재한다 (구글링하세요 좀)

		String board_view = loginid + ":" + b_no;
		session.setAttribute(board_view, true);
		session.setMaxInactiveInterval(60 * 60 * 24); // 세션 유효 시간 : 하루 ( 1초 * 60 = 1분, 1분 * 60 = 1시간 )
	}
	// 1. 조회수 증가시키기

	Board board = BoardDao.getboardDao().get_board(b_no);

	String pagenum = request.getParameter("pagenum");

	if (pagenum == null) {
		pagenum = "1";
	}
	// 1. 댓글 페이지 처리 
	int lastrow = ReplyDao.getreplyDao().reply_count(b_no);
	int listsize = 10;
	int lastpage = 0;
	if (lastrow % listsize == 0) {
		lastpage = lastrow / listsize;
	} else {
		lastpage = (lastrow / listsize) + 1;
	}

	int currentpage = Integer.parseInt(pagenum);
	int startrow = (currentpage - 1) * listsize;
	
	ArrayList<Reply> replys = ReplyDao.getreplyDao().get_reply_instance(b_no, startrow, listsize);
	
	%>

	<div class="container">
		<div>
			<p style="font-size: 30px; font-family: 'NanumGothicBold';"
				class="text-center ">게시물 등록</p>
		</div>
		<hr>
		<div class="row">

			<div class="input-group d-flex justify-content-end my-3">

				<a href="board_list.jsp">
					<button class="form-control">목록보기</button>
				</a>

				<%
				if (loginid != null) {
					if (loginid.equals(board.getB_writer())) {
				%> 

				<a href="board_update.jsp?b_no=<%=board.getB_no()%>">
					<button class="form-control">수정하기</button>
				</a> <a
					href="../../controller/board_delete_controller.jsp?b_no=<%=board.getB_no()%>">
					<button class="form-control">삭제하기</button>
				</a>
				<%
				}
				%>	
				<% } else {  } %>
			</div>

			<div class="row">
				<div class="col-md-3">
					<img src="../../images/side1.jpg" class="img-fluid">
				</div>

				<div class="col-md-9">
					<table class="table">
						<tr>
							<td>제목</td>
							<td colspan="2"><%=board.getB_title()%></td>
						</tr>

						<tr>
							<td>작성자 : <%=board.getB_writer()%></td>
							<td>작성일 : <%=board.getB_date()%></td>
							<td>조회수 : <%=board.getB_view()%></td>
						</tr>

						<tr>
							<td>내용</td>
							<td colspan="2" style="height: 300px;"><%=board.getB_content()%></td>
						</tr>

						<%
						if (board.getB_file() != null) {
						%>
						<tr>
							<td>첨부파일1</td>
							<%
							String folderpath = request.getSession().getServletContext().getRealPath("jsp_website/upload/" + board.getB_file());
							%>
							<td><img src="../../upload/<%=board.getB_file()%>"
								style="max-width: 100%; max-height: 100%;"> <%=board.getB_file()%></td>
							<td>다운로드 <a href="../../upload/<%=board.getB_file()%>"><%=board.getB_file()%></a>
							</td>
						</tr>

						<%
						} else {
						%>

						<%
						}
						%>

						<%
						if (board.getB_file2() != null) {
						%>
						<tr>
							<td>첨부파일2</td>
							<td><img src="../../upload/<%=board.getB_file2()%>"
								style="max-width: 100%; max-height: 100%;"> <%=board.getB_file2()%></td>
							<td>다운로드 <a
								href="../../controller/filedown_controller.jsp?file=<%=board.getB_file2()%>"><%=board.getB_file2()%></a>
							</td>
						</tr>

						<%
						} else {
						%>

						<%
						}
						%>

					</table>

					<br> <br>

					<hr>

					<form action="../../controller/reply_write_controller.jsp?b_no=<%=board.getB_no()%>" method="post">
						<div class="input-group input-group-sm my-3">
							<div class="col-md-2">
								<label> <i class="bi bi-file-lock-fill"></i> 댓글 작성
								</label>
							</div>
							<div class="col-md-8">
								<textarea rows="5" cols="50" class="form-control" name="r_content"></textarea>
							</div>
							<div class="col-md-2">
								<input class="btn btn-success form-control" value="댓글등록" type="submit">
							</div>
						</div>
					</form>

					<div>
						<p class="text-center" style="color: orange; font-size: 22px;">
							등록된 댓글 목록</p>
					</div>

					<table class="table">
						<tr>
							<th>작성자</th>
							<th>내용</th>
							<th>작성일</th>
							<th>삭제</th>
						</tr>
						<%
						
						for (Reply reply : replys) {
						%>
						<!-- 등록된 댓글을 table 에 출력합니다. -->
						<tr>

							<td><%=reply.getR_writer()%></td>
							<td><%=reply.getR_content()%></td>
							<td><%=reply.getR_date()%></td>

							<%
							int m_num = login_data.getM_num();
							if (loginid != null && reply.getM_num() == m_num) { %>
							<td>
								<form action="../../controller/reply_delete_controller.jsp"
									method="get">
									<input type="hidden" name="b_no" value="<%=reply.getB_no()%>">
									<input type="hidden" name="r_no" value="<%=reply.getR_no()%>">
									<input type="submit" class="btn btn-warning form-control"
										value="삭제">
								</form>
							</td>
							<% } else { } %>
						</tr>
						<% } %>

					</table>
					<div class="row">
					<div class="mx-auto">
						<ul class="pagination">
							<%
							if (currentpage == 1) {
							%>
							<li class="page-item"><a
								href="board_view.jsp?pagenum=<%=currentpage%>&b_no=<%=board.getB_no() %>" class="page-link">
									<span aria-hidden="true"> &laquo; </span>
							</a></li>

							<%
							} else {
							%>
							<li class="page-item"><a
								href="board_view.jsp?pagenum=<%=currentpage - 1%>&b_no=<%=board.getB_no() %>"
								class="page-link"> <span aria-hidden="true"> &laquo;
								</span>
							</a></li>
							<%
							}
							%>

							<%
							for (int i = 1; i <= lastpage; i++) {
							%>
							<li class="page-item"><a
								href="board_view.jsp?pagenum=<%=i%>&b_no=<%=board.getB_no() %>" class="page-link"> <%=i%>
							</a></li>
							<%
							}
							%>

							<%
							if (currentpage == lastpage) {
							%>
							<li class="page-item"><a
								href="board_view.jsp?pagenum<%=currentpage%>&b_no=<%=board.getB_no() %>" class="page-link"> <span
									aria-hidden="true"> &raquo; </span>
							</a></li>
							<%
							} else {
							%>
							<li class="page-item"><a
								href="board_view.jsp?pagenum<%=currentpage + 1%>&b_no=<%=board.getB_no() %>" class="page-link"> <span
									aria-hidden="true"> &raquo; </span>
							</a></li>
							<%
							}
							%>
						</ul>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>