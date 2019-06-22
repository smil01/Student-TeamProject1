package main.member;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
			System.out.println("=======================DAO가 생성 되었습니다.");
		} else {
			System.out.println("=======================DAO가 있습니다.");
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

			String sql = "select * from member where kakao_id = ? or naver_id = ?";
		
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, id);
			pst.setString(2, id);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				result = new memberDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}

	public int getJoin(memberDTO dto) {
		int cnt = 0;
		
		try {
			getCon();

			String sql = "insert into MEMBER VALUES(MEMBER_CODE_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
			
			pst = conn.prepareStatement(sql);
			pst.setInt(1, dto.getFaeming_code());
			pst.setString(2, dto.getKakao_id());
			pst.setString(3, dto.getNaver_id());
			pst.setString(4, dto.getName());
			pst.setString(5, dto.getSrc());
			
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
}
