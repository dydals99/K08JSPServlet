package ex.board;

public class ExDTO {
	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private java.sql.Date revisiondate;
	private String visitcount;
	private String name;
	private String pass;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	//수정일 게터세터
	public java.sql.Date getRevisiondate() {
		return revisiondate;
	}
	public void setRevisiondate(java.sql.Date revisiondate) {
		this.revisiondate = revisiondate;
	}
	
}
