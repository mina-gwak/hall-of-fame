<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, java.text.*" %>
<%@ page import="search.Selenium"%>
<jsp:useBean id="Selenium" class="search.Selenium" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 검색</title>
</head>
<body>
<%
	String store = request.getParameter("store-name");
	Selenium sel = new Selenium();
	sel.crawl(store);
%>
<script>
location.href="main.jsp";
</script>
</body>
</html>