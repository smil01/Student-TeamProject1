package main.main;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class localLvDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private static localLvDAO dao;

	private localLvDAO() {
		super();
	}

	public static localLvDAO getDao() {
		if (dao == null) {
			dao = new localLvDAO();
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
	
	public localLvDTO getSelect(int crop_code, int local_code) {
		localLvDTO result = null;

		try {
			getCon();

			String sql = "select * from LOCAL_LV where crop_code = ? and local_code = ?";

			pst = conn.prepareStatement(sql);

			pst.setInt(1, crop_code);
			pst.setInt(2, local_code);

			rs = pst.executeQuery();

			if (rs.next()) {
				result = new localLvDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}
}
