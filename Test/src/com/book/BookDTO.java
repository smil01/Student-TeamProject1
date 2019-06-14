package com.book;

public class BookDTO {
	private String id;
	private String pw;
	private String nick;
	private String eamil;
	private String tel;

	public BookDTO(String id, String pw, String nick, String eamil, String tel) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.eamil = eamil;
		this.tel = tel;
	}

	public BookDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEamil() {
		return eamil;
	}

	public void setEamil(String eamil) {
		this.eamil = eamil;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "BookDTO [id=" + id + ", pw=" + pw + ", nick=" + nick + ", eamil=" + eamil + ", tel=" + tel + "]";
	}

}
