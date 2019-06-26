package test;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;

class jtest {

	@Test
	void selectAllTest() {
		testDAO dao = testDAO.getDao();
		ArrayList<testDTO>list = dao.selectAll();
		
		if(list.size() != 0)
		for(int i = 0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	
	@Test
	void selectTest() {
		testDAO dao = testDAO.getDao();
		ArrayList<testDTO>list = dao.selectAll();
		
		if(list.size() != 0)
		for(int i = 0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
	}

}
