package main.board;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

public class boardDAO {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private static boardDAO dao;

	public static boardDAO getDao() {
		if (dao == null) {
			dao = new boardDAO();
		}
		return dao;
	}

	private void getCon() {
		try {
			InputStream in = this.getClass().getResourceAsStream("../../db.properties");
			Properties p = new Properties();
			p.load(in);

			Class.forName(p.getProperty("driver"));

			String url = p.getProperty("url");
			String user = p.getProperty("id");
			String password = p.getProperty("pw");

			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}

			if (pst != null) {
				pst.close();
			}

			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<boardDTO> selectAll() {
		ArrayList<boardDTO> list = new ArrayList<boardDTO>();
		try {
			getCon();

			String sql = "select * from board order by num desc";

			pst = conn.prepareStatement(sql);

			rs = pst.executeQuery();

			while (rs.next()) {
				list.add(new boardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public boardDTO selectNum(int num) {

		boardDTO result = null;

		try {
			getCon();

			String sql = "select * from board where num=?";

			pst = conn.prepareStatement(sql);

			pst.setInt(1, num);
			rs = pst.executeQuery();

			if (rs.next()) {
				result = new boardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public boolean insert(boardDTO dto) {

		try {
			getCon();
			String sql = "insert into board values(BOARD_NUM_SEQ.NEXTVAL, ?, ?, ?, ADD_MONTHS(SYSDATE,0), ?)";

			pst = conn.prepareStatement(sql);

			pst.setString(1, dto.getTitle());
			pst.setString(2, dto.getContent());
			pst.setInt(3, dto.getMember_code());
			pst.setString(4, dto.getWriter());

			if (pst.executeUpdate() > 0) {
				close();
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return false;

	}

	public boolean update(String content, int num) {

		try {
			getCon();
			String sql = "update board set content=? where num=?";

			pst = conn.prepareStatement(sql);
			pst.setString(1, content);
			pst.setInt(2, num);

			if (pst.executeUpdate() > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return false;
	}

	public boolean delete(int num) {

		try {
			getCon();
			String sql = "delete from board where num = ?";

			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);

			if (pst.executeUpdate() > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return false;
	}

}
