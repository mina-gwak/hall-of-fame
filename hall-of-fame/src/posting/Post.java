package posting;

import java.sql.*;

public class Post {

	private int p_id;
	private String p_title;
	private String p_content;
	private String p_writer;
	private Date p_date;
	private int p_hit;
	private String p_category;
	

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_writer() {
		return p_writer;
	}

	public void setP_writer(String p_writer) {
		this.p_writer = p_writer;
	}
	
	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	
	public int getP_hit() {
		return p_hit;
	}

	public void setP_hit(int p_hit) {
		this.p_hit = p_hit;
	}
	
	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	@Override

	public String toString() {
		return "Product [p_id=" + p_id + ", p_title=" + p_title + ", p_content=" + p_content + ", p_writer=" + p_writer + ", p_date=" + p_date + ", p_hit=" + p_hit + ", p_category=" + p_category + "]";
	}

}