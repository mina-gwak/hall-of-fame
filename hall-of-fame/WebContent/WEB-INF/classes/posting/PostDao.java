package posting;

import java.sql.*;
import java.util.*;

public class PostDao {

	private static PostDao instance;

	private Connection con;

	private PostDao(){

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/object_project?useSSL=false","root", "990711");

		} catch (SQLException e1) {
			out.print(e1);
		} catch (Exception e) {
			out.print(e);
		}
		
	}

	public static PostDao getInstance(){

		if(instance == null)

			instance = new PostDao();

		return instance;

	}
	
	//레코드 추가 함수

	public void insertPost(Post post){

		PreparedStatement pstmt = null;

		try {

			pstmt = connection.prepareStatement("insert into post values(?,?,?,?,?,?)");

			pstmt.setInt(1, post.getP_id());
			pstmt.setString(2, post.getP_title());
			pstmt.setString(3, post.getP_content());
			pstmt.setString(4, post.getP_writer());		
			pstmt.setString(5, post.getP_date());			
			pstmt.setInt(6, post.getP_hit());
			pstmt.executeUpdate();

		} catch(SQLException e1) {
			out.print(e1);
		} catch(Exception e) {
			out.print(e);
		}

		finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e1) {
					out.print(e1);
				} catch (Exception e) {
					out.print(e);
				}
			}
		}
	}


	//레코드 업데이트 함수

	public void updatePost(Post post){

		PreparedStatement pstmt = null;
		
		try {

			pstmt = connection.prepareStatement("update product set p_title = ?, p_content = ?, "

					+ "p_date = ? where p_id = ?");

			pstmt.setInt(4, product.getP_id());
			pstmt.setString(1, product.getP_title());
			pstmt.setString(2, product.getP_content());
			pstmt.setString(3, product.getP_date());
			pstmt.executeUpdate();

		} catch(SQLException e1) {
			out.print(e1);
		} catch(Exception e) {
			out.print(e);
		}

		finally {

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e1) {
					out.print(e1);
				} catch (Exception e) {
					out.print(e);
				}
			}
		}
	}

	//지정한 id 값을 가진 레코드 삭제

	public void deletePost(int p_id){

		PreparedStatement pstmt = null;

		try {

			pstmt = connection.prepareStatement("delete from post where p_id = ?");
			pstmt.setInt(1, p_id);
			pstmt.executeUpdate();

		} catch(SQLException e1) {
			out.print(e1);
		} catch(Exception e) {
			out.print(e);
		}

		finally {

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e1) {
					out.print(e1);
				} catch (Exception e) {
					out.print(e);
				}
			}
		}
	}

	//지정한 id값을 가진 레코드 호출

	public Post selectOne(int p_id){

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		Post post = new Post();

		try {

			pstmt = connection.prepareStatement("select * from post where p_id = ?");
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				post.setP_id(rs.getInt("p_id"));
				post.setP_title(rs.getString("p_title"));
				post.setP_content(rs.getString("p_content"));
				post.setP_date(rs.getString("p_date"));
				post.setP_writer(rs.getString("p_writer"));
				post.setP_hit(rs.getInt("p_hit"));

			}

		} catch (SQLException e1) {
			out.print(e1);
		} catch (Exception e) {
			out.print(e);
		}

		finally{
			try {
				if(pstmt != null)
					pstmt.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e1) {
				out.print(e1);
			} catch (Exception e) {
				out.print(e);
			}
		}
		return post;
	}

	

	//product table에 있는 모든 레코드 호출!

	public List<Post> selectAll(){

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		List<Post> list = new ArrayList<Post>();

		try {

			pstmt = connection.prepareStatement("select * from post");
			rs = pstmt.executeQuery();

			while(rs.next()) {

				Post post = new Post();

				post.setP_id(rs.getInt("p_id"));
				post.setP_title(rs.getString("p_title"));
				post.setP_content(rs.getString("p_content"));
				post.setP_date(rs.getString("p_date"));
				post.setP_writer(rs.getString("p_writer"));
				post.setP_hit(rs.getInt("p_hit"));

				list.add(post);

			}

		} catch (SQLException e1) {
			out.print(e1);
		} catch (Exception e) {
			out.print(e);
		}

		finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e1) {
				out.print(e1);
			} catch (Exception e) {
				out.print(e);
			}

		}
		return list;
	}
	
	public static void main (String[] args) {
		
	}

}