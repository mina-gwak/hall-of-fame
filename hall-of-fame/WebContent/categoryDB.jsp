<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>

<%
Connection con;
Statement stmt;
ResultSet rs = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/object_project?useSSL=false","root", "990711");
	
	stmt = con.createStatement();
	String sql = "select * from store";
	rs = stmt.executeQuery(sql);
	
	if(rs.next()) {
		do {
			out.print("<div class='col-6 col-md-3'><a href='#' class='store-link' data-toggle='modal' data-target='#store-info'><div class='menu-store'>");
			out.print("<img src='./storeImage/"+rs.getString("name")+".jpg' alt='"+rs.getString("name")+"' />");
			out.print("<h2>"+rs.getString("name")+"</h2></div></a></div>");
		} while(rs.next());
	} else {
		out.print("결과가 없습니다.");
	}
	con.close();
} catch(SQLException e1) {
	out.print(e1);
} catch(Exception e) {
	out.print(e);
}

%>

<!-- out.print(rs.getString("kind")); -->