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
<title>포스트 수정하기</title>
<script src="./js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/base.css" />
<script src="./js/base.js"></script>
<link rel="stylesheet" href="./css/board.css" />
</head>
<body>
<%
	int postId = Integer.parseInt(request.getParameter("id"));
	Post post = PostDao.getInstance().selectOne(postId);
%>
<%@include file="./header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1 class="board-title sub">자유게시판</h1>
		</div>
		<div class="col-12">
			<form action="update.jsp">
				<table class="board-table">
				<input type="hidden" name="id" value="<%=post.getP_id() %>">
				<tr>
					<td class="select">
						<select id="category" name="category">
							<option value="잡담">잡담</option>
							<option value="혼밥러 찾기">혼밥러 찾기</option>
							<option value="맛집">맛집</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="write-title"><input type="text" name="title" value="<%=post.getP_title()%>" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td class="fill">내용</td>
				</tr>
				<tr>
					<td class="info-content write">
						<textarea name="content" style="width: 100%; height: 100%;"><%=post.getP_content()%></textarea>
					</td>
				</tr>
			</table>
			<div class="write-btns">
				<button type="submit">수정</button>
				<button type="button" onclick="history.back()">취소</button>
			</div>
		</form>
		</div>
	</div>
</div>
<%@include file="./footer.jsp" %>