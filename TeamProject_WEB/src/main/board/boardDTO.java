package main.board;

public class boardDTO {
	private int num;
	private String title;
	private String content;
	private int member_code;
	private String date;
	private String writer;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
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
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public boardDTO(int num, String title, String content, int member_code, String date, String writer) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.member_code = member_code;
		this.date = date;
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "boardDTO [num=" + num + ", title=" + title + ", content=" + content + ", member_code=" + member_code
				+ ", date=" + date + ", writer=" + writer + "]";
	}
	
	
	
	

	

}
