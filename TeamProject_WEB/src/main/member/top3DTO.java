package main.member;

public class top3DTO {
	private String title;
	private String lenth;
	private String count;
	private String time;
	private String src;
	private String link;

	public top3DTO(String title, String lenth, String count, String time, String src, String link) {
		super();
		this.title = title;
		this.lenth = lenth;
		this.count = count;
		this.time = time;
		this.src = src;
		this.link = link;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLenth() {
		return lenth;
	}

	public void setLenth(String lenth) {
		this.lenth = lenth;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "top3DTO [title=" + title + ", lenth=" + lenth + ", count=" + count + ", time=" + time + ", src=" + src
				+ ", link=" + link + "]";
	}

}
