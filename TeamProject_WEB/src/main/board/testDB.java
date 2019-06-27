package test;

import java.util.ArrayList;

public class testDB {

	public static void main(String[] args) {
		testDAO dao = testDAO.getDao();
		ArrayList<testDTO>list = dao.selectAll();
		
		if(list.size() != 0)
		for(int i = 0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
	}

}
