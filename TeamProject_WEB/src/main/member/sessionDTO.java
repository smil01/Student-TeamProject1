package main.member;

public class sessionDTO {
	private String id;
	private String name;
	private String src;
	private String access; // 로그인 소셜 유형
	private String token;// 메인 소셜 유형
	private int member_id;

	public sessionDTO(String id, String name, String src, String access, String token, int member_id) {
		super();
		this.id = id;
		this.name = name;
		this.src = src;
		this.access = access;
		this.token = token;
		this.member_id = member_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "sessionDTO [id=" + id + ", name=" + name + ", src=" + src + ", access=" + access + ", token=" + token
				+ ", member_id=" + member_id + "]";
	}

}
