<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.*" %>
<%@ page import="posting.Post"%>
<%@ page import="posting.PostDao"%>
<jsp:useBean id="Post" class="posting.Post" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String writer = (String) session.getAttribute("id");
	String content = request.getParameter("content");
	Date date = new Date(System.currentTimeMillis());
	String category = request.getParameter("category");

	Post post = new Post();
	post.setP_title(title);
	post.setP_writer(writer);
	post.setP_content(content);
	post.setP_date(date);
	post.setP_category(category);
	PostDao.getInstance().insertPost(post);
	
	response.sendRedirect("board.jsp");
%>
</body>
</html>