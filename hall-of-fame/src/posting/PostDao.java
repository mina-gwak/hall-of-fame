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
			e1.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
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

			pstmt = con.prepareStatement("insert into post values(?,?,?,?,?,?,?)");

			pstmt.setInt(1, post.getP_id());
			pstmt.setString(2, post.getP_title());
			pstmt.setString(3, post.getP_content());
			pstmt.setString(4, post.getP_writer());		
			pstmt.setDate(5, post.getP_date());			
			pstmt.setInt(6, post.getP_hit());
			pstmt.setString(7, post.getP_category());
			pstmt.executeUpdate();

		} catch(SQLException e1) {
			e1.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}

		finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}


	//레코드 업데이트 함수

	public void updatePost(Post post){

		PreparedStatement pstmt = null;
		
		try {

			pstmt = con.prepareStatement("update post set title = ?, content = ?, regDate = ?, hit = ?, category = ? where id = ?");

			pstmt.setInt(6, post.getP_id());
			pstmt.setString(1, post.getP_title());
			pstmt.setString(2, post.getP_content());
			pstmt.setDate(3, post.getP_date());
			pstmt.setInt(4,  post.getP_hit());
			pstmt.setString(5, post.getP_category());
			pstmt.executeUpdate();

		} catch(SQLException e1) {
			e1.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}

		finally {

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	//지정한 id 값을 가진 레코드 삭제

	public void deletePost(int p_id){

		PreparedStatement pstmt = null;

		try {

			pstmt = con.prepareStatement("delete from post where id = ?");
			pstmt.setInt(1, p_id);
			pstmt.executeUpdate();

		} catch(SQLException e1) {
			e1.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}

		finally {

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
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

			pstmt = con.prepareStatement("select * from post where id = ?");
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				post.setP_id(rs.getInt("id"));
				post.setP_title(rs.getString("title"));
				post.setP_content(rs.getString("content"));
				post.setP_date(rs.getDate("regDate"));
				post.setP_writer(rs.getString("writer"));
				post.setP_hit(rs.getInt("hit"));
				post.setP_category(rs.getString("category"));

			}

		} catch (SQLException e1) {
			e1.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		finally{
			try {
				if(pstmt != null)
					pstmt.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
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

			pstmt = con.prepareStatement("select * from post");
			rs = pstmt.executeQuery();

			while(rs.next()) {

				Post post = new Post();

				post.setP_id(rs.getInt("id"));
				post.setP_title(rs.getString("title"));
				post.setP_content(rs.getString("content"));
				post.setP_date(rs.getDate("regDate"));
				post.setP_writer(rs.getString("writer"));
				post.setP_hit(rs.getInt("hit"));
				post.setP_category(rs.getString("category"));

				list.add(post);

			}

		} catch (SQLException e1) {
			e1.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		return list;
	}

}