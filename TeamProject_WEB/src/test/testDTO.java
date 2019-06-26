package test;

public class testDTO {
	private int num;
	private String title;
	private String content;
	private int member_code;

	public testDTO(int num, String title, String content, int member_code) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.member_code = member_code;
	}

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

	@Override
	public String toString() {
		return "testDTO [num=" + num + ", title=" + title + ", content=" + content + ", member_code=" + member_code
				+ "]";
	}

}
