package main.member;

public class sessionDTO {
	private String id;
	private String name;
	private String src;
	private String access;
	private String token;

	public sessionDTO(String id, String name, String src, String access, String token) {
		super();
		this.id = id;
		this.name = name;
		this.src = src;
		this.access = access;
		this.token = token;
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

	@Override
	public String toString() {
		return "sessionDTO [id=" + id + ", name=" + name + ", src=" + src + ", access=" + access + ", token=" + token
				+ "]";
	}

}
