package main.board;

import org.junit.jupiter.api.Test;

class boardtest {

	@Test
	void insert() {
		boardDAO dao = boardDAO.getDao();
		boardDTO dto = new boardDTO(0, "g", "g", 8222, null);
		
		System.out.println(dao.insert(dto));
	}
	
	@Test
	void selectNum() {
		boardDAO dao = boardDAO.getDao();

		System.out.println(dao.selectNum(11));

	}
	
	@Test
	void delete() {
		boardDAO dao = boardDAO.getDao();
	
		System.out.println("삭제"+dao.delete(11));
	}

	@Test
	void update() {

		boardDAO dao = boardDAO.getDao();

		System.out.println(dao.update("하이", 12));

	}

}
