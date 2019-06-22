package main.member;

public class memberDTO {
	private int member_code;
	private int faeming_code;
	private String kakao_id;
	private String naver_id;
	private String name;
	private String src;

	public memberDTO(int member_code, int faeming_code, String kakao_id, String naver_id, String name, String src) {
		super();
		this.member_code = member_code;
		this.faeming_code = faeming_code;
		this.kakao_id = kakao_id;
		this.naver_id = naver_id;
		this.name = name;
		this.src = src;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public int getFaeming_code() {
		return faeming_code;
	}

	public void setFaeming_code(int faeming_code) {
		this.faeming_code = faeming_code;
	}

	public String getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

	public String getNaver_id() {
		return naver_id;
	}

	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
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

	@Override
	public String toString() {
		return "memberDTO [member_code=" + member_code + ", faeming_code=" + faeming_code + ", kakao_id=" + kakao_id
				+ ", naver_id=" + naver_id + ", name=" + name + ", src=" + src + "]";
	}

}
