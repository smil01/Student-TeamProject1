package main.member;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

public class memberDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private static memberDAO dao;

	private memberDAO() {
		super();
	}

	public static memberDAO getDao() {
		if (dao == null) {
			dao = new memberDAO();
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

	public memberDTO selectId(String id) {
		memberDTO result = null;
		try {
			getCon();

			String sql = "select * from member where kakao_id = ? or naver_id = ? or google_id = ?";

			pst = conn.prepareStatement(sql);

			pst.setString(1, id);
			pst.setString(2, id);
			pst.setString(3, id);

			rs = pst.executeQuery();

			if (rs.next()) {
				result = new memberDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public socialDTO selectKakao(String id) {
		socialDTO result = null;
		try {
			getCon();

			String sql = "select * from kakao where kakao_id = ?";

			pst = conn.prepareStatement(sql);

			pst.setString(1, id);

			rs = pst.executeQuery();

			if (rs.next()) {
				result = new socialDTO(rs.getString(1), rs.getString(2), rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public socialDTO selectNaver(String id) {
		socialDTO result = null;
		try {
			getCon();

			String sql = "select * from naver where naver_id = ?";

			pst = conn.prepareStatement(sql);

			pst.setString(1, id);

			rs = pst.executeQuery();

			if (rs.next()) {
				result = new socialDTO(rs.getString(1), rs.getString(2), rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public socialDTO selectGoogle(String id) {
		socialDTO result = null;
		try {
			getCon();

			String sql = "select * from google where google_id = ?";

			pst = conn.prepareStatement(sql);

			pst.setString(1, id);

			rs = pst.executeQuery();

			if (rs.next()) {
				result = new socialDTO(rs.getString(1), rs.getString(2), rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public ArrayList<socialDTO> selectSocial(int id) {
		ArrayList<socialDTO> list = new ArrayList<socialDTO>();
		try {
			getCon();
			String sql = "select * from kakao where kakao_id = (select KAKAO_ID from member where MEMBER_CODE = ?)";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				list.add(new socialDTO(rs.getString(1), rs.getString(2), rs.getString(3)));
			} else {
				list.add(null);
			}

			sql = "select * from naver where naver_id = (select NAVER_ID from member where MEMBER_CODE = ?)";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				list.add(new socialDTO(rs.getString(1), rs.getString(2), rs.getString(3)));
			} else {
				list.add(null);
			}

			sql = "select * from google where google_id = (select GOOGLE_ID from member where MEMBER_CODE = ?)";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				list.add(new socialDTO(rs.getString(1), rs.getString(2), rs.getString(3)));
			} else {
				list.add(null);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public boolean Join(memberDTO dto) {
		try {
			getCon();
			String sql = "insert into MEMBER VALUES(MEMBER_CODE_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";

			pst = conn.prepareStatement(sql);
			pst.setInt(1, dto.getFaeming_code());
			pst.setString(2, dto.getKakao_id());
			pst.setString(3, dto.getNaver_id());
			pst.setString(4, dto.getGoogle_id());
			pst.setString(5, dto.getMain_code());

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

	public boolean socialJoin(socialDTO scdto, String table) {
		try {
			getCon();
			String sql = "insert into " + table + " VALUES(?, ?, ?)";

			pst = conn.prepareStatement(sql);
			pst.setString(1, scdto.getId());
			pst.setString(2, scdto.getName());
			pst.setString(3, scdto.getSrc());

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
