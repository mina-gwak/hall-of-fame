<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	Connection con;
	PreparedStatement pstmt;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/object_project?useSSL=false","root", "990711");
		
		String sql = "select userid, nickname, password from user";
		pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getString("userid").equals(id) && rs.getString("password").equals(password)) {
				session.setAttribute("id", id);
				out.println("<script>");
				out.println("alert('"+rs.getString("nickname")+"님 어서오세요');");
				out.println("location.href='main.jsp'");
				out.println("</script>");
			}
			else if(rs.getString("userid").equals(id) && rs.getString("password").equals(password) == false) {
				out.println("<script>");
				out.println("alert('비밀번호를 잘못 입력하셨습니다. 다시 한 번 확인 후 입력해주세요');");
				out.println("location.href='login.jsp'");
				out.println("</script>");
			}
			else if (rs.getString("userid").equals(id) == false) {
				out.println("<script>");
				out.println("alert('"+rs.getString("userid")+"')");
				out.println("alert('"+id+"')");
				out.println("alert('존재하지 않는 아이디입니다.');");
				out.println("location.href='login.jsp'");
				out.println("</script>");
			}
		}
		
	} catch(SQLException e1) {
		out.print(e1);
	} catch(Exception e) {
		out.print(e);
	}
%>
</body>
</html>