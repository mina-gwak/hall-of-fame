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
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="board-header">
				<h1 class="board-title sub">자유게시판</h1>
			</div>
		</div>
		<div class="col-12">
		<%
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			int postId = Integer.parseInt(request.getParameter("id"));
			Post post = PostDao.getInstance().selectOne(postId);
			post.setP_hit(post.getP_hit() + 1);
			PostDao.getInstance().updatePost(post);
		%>
			<table class="board-table">
				<tr>
					<th class="info-title" colspan="2"><span>[<%=post.getP_category() %>] <%=post.getP_title()%></span></th>
				</tr>
				<tr class="sub-info">
					<td class="info-user"><%=post.getP_writer()%></td>
					<td class="info-date"><%=sdf.format(post.getP_date())%></td>
				</tr>		
				<tr>
					<td class="info-content" colspan="2">
						<textarea name="content"><%=post.getP_content()%></textarea>
					</td>
				</tr>
			</table>
			<div class="info-btns">
				<button type="button" onclick="location.href='board.jsp'">이전</button>
				<div>
					<button type="button" onclick="location.href='deleteBoard.jsp?id=<%=postId%>'">삭제</button>
					<button type="button" onclick="location.href='updateBoard.jsp?id=<%=postId%>'">수정</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="./footer.jsp" %></html>