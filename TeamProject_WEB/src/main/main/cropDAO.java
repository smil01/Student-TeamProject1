package main.main;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

public class cropDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private static cropDAO dao;

	private cropDAO() {
		super();
	}

	public static cropDAO getDao() {
		if (dao == null) {
			dao = new cropDAO();
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

	public cropDTO getCropSelectAll(int x) {
		cropDTO result = null;

		try {
			getCon();

			String sql = "select * from crop where CROP_CODE = ?";

			pst = conn.prepareStatement(sql);
			pst.setInt(1, x);

			rs = pst.executeQuery();

			if (rs.next()) {
				result = new cropDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5),
						rs.getInt(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}
	
	public ArrayList<localDTO> getLocalSelectAll(int x) {
		ArrayList<localDTO> list = new ArrayList<localDTO>();

		try {
			getCon();

			String sql = "select * from LOCAL where LOCAL_CODE = ? ORDER by TIME ASC";

			pst = conn.prepareStatement(sql);
			pst.setInt(1, x);

			rs = pst.executeQuery();

			while (rs.next()) {
				list.add(new localDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
}
