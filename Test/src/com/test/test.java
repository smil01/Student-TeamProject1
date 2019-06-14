package com.test;

public class test {

	public static void main(String[] args) {
		MemberDAO dao = MemberDAO.getDao();
		dao.join(new MemberDTO("test2", "test2", "test2", "test2"));
	}

}
