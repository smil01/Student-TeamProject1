package main.member;

public class memberDTO {
	private int member_code;
	private int faeming_code;
	private String kakao_id;
	private String naver_id;
	private String google_id;
	private String main_code;

	public memberDTO(int member_code, int faeming_code, String kakao_id, String naver_id, String google_id,
			String main_code) {
		super();
		this.member_code = member_code;
		this.faeming_code = faeming_code;
		this.kakao_id = kakao_id;
		this.naver_id = naver_id;
		this.google_id = google_id;
		this.main_code = main_code;
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

	public String getGoogle_id() {
		return google_id;
	}

	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}

	public String getMain_code() {
		return main_code;
	}

	public void setMain_code(String main_code) {
		this.main_code = main_code;
	}

	@Override
	public String toString() {
		return "memberDTO [member_code=" + member_code + ", faeming_code=" + faeming_code + ", kakao_id=" + kakao_id
				+ ", naver_id=" + naver_id + ", google_id=" + google_id + ", main_code=" + main_code + "]";
	}

}
