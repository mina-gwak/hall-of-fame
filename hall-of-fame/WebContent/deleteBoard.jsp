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
<title>Insert title here</title>
</head>
<body>
<body>
<%
	int postId = Integer.parseInt(request.getParameter("id"));
	PostDao.getInstance().deletePost(postId);
	response.sendRedirect("board.jsp");
%>
</body>
</html>