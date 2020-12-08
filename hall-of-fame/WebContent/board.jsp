<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, java.text.*" %>
<%@ page import="posting.Post"%>
<%@ page import="posting.PostDao"%>
<jsp:useBean id="Post" class="posting.Post" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>
<script src="./js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/base.css" />
<script src="./js/base.js"></script>
<link rel="stylesheet" href="./css/board.css" />
</head>
<body>
<%@include file="./header.jsp" %>
<script>
function isLogin() {
	if (<%=isLogin%>) return true;
	else {
		var goLogin = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
		if (goLogin) {
			location.href="login.jsp";
			return false;
		}
		return false;
	}
}
</script>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="board-header">
				<h1 class="board-title">자유게시판</h1>
				<div class="board-desc">
					<p>자유롭게 이야기해요</p>
				</div>
			</div>
		</div>
		<div class="col-12">
		<%
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			List<Post> list = PostDao.getInstance().selectAll();
		%>
			<table class="board-table">
				<tr class="table-header">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일자</th>
					<th>조회수</th>
				</tr>
		<%	
			if (list.size() == 0) {
				out.print("<tr><td colspan='5'><p class='no-post'>등록된 게시물이 없습니다.</p></td></tr>");
			}
			for (Post p : list) {
		%>
				<tr class="table-content">
					<td align="center"><%=p.getP_id() %></td>
					<td align="center"><a href = "boardInfo.jsp?id=<%=p.getP_id()%>">[<%=p.getP_category() %>]<span> <%=p.getP_title() %></span></a></td>
					<td align="center"><%=p.getP_writer() %></td>
					<td align="center"><%=sdf.format(p.getP_date()) %></td>
					<td align="center"><%=p.getP_hit() %></td>
				</tr>
		<%
			}
		%>
			</table>
			<form action="writePost.jsp" onsubmit="return isLogin();">
				<button type="submit" class="post-btn">글쓰기</button>
			</form>	
		</div>
	</div>
</div>
<%@include file="./footer.jsp" %>