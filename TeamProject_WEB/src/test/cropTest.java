package test;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import main.main.cropDAO;
import main.main.cropDTO;
import main.main.localDTO;

class cropTest {

	@Test
	void test1() {
		cropDAO dao = cropDAO.getDao();
		ArrayList<cropDTO> list = dao.getCropSelectAll();
		
		for(cropDTO dto : list) {
			System.out.println(dto);
		}
	}
	
	@Test
	void test2() {
		cropDAO dao = cropDAO.getDao();
		ArrayList<localDTO> list = dao.getLocalSelectAll();
		
		for(localDTO dto : list) {
			System.out.println(dto);
		}
	}

}
