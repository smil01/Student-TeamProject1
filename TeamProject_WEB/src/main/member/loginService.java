package main.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.front.CommandService;

public class loginService implements CommandService {

	@SuppressWarnings("unused")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String socialId = request.getParameter("id");
		String name = request.getParameter("name");
		String src = !request.getParameter("profile_image").equals("null") ? request.getParameter("profile_image")
				: "img/std.gif";
		String access = request.getParameter("access");
		String token = request.getParameter("token");

		if (socialId == null) {
			System.out.println("loginService. id : " + socialId);
			return "error.do";
		}

		memberDAO dao = memberDAO.getDao();
		memberDTO dto = dao.selectId(socialId);
		sessionDTO sdto = null;

		if (dto != null) {
			socialDTO scdto = null;

			if (dto.getMain_code().equals("k")) {
				scdto = dao.selectKakao(dto.getKakao_id());
			} else if (dto.getMain_code().equals("n")) {
				scdto = dao.selectNaver(dto.getNaver_id());
			} else if (dto.getMain_code().equals("g")) {
				scdto = dao.selectGoogle(dto.getGoogle_id());
			}

			if (scdto == null) {
				System.out.println("scdto. id : " + scdto);
				return "error.do";
			}

			sdto = new sessionDTO(socialId, scdto.getName(), scdto.getSrc(), access, token);
		} else {
			socialDTO scdto = new socialDTO(socialId, name, src);
			String table = null;

			if (access.equals("k")) {
				dto = new memberDTO(0, 0, socialId, null, null, "k");
				table = "kakao";
			} else if (access.equals("n")) {
				dto = new memberDTO(0, 0, null, socialId, null, "n");
				table = "naver";
			} else if (access.equals("g")) {
				dto = new memberDTO(0, 0, null, null, socialId, "g");
				table = "google";
			}

			if (dao.Join(dto)) {
				if (!dao.socialJoin(scdto, table)) {
					System.out.println("dao.socialJoin. 결과 : 실패");
					return "error.do";
				}
			} else {
				System.out.println("dao.Join. 결과 : 실패");
				return "error.do";
			}

			sdto = new sessionDTO(socialId, name, src, access, token);
		}

		if (sdto == null) {
			System.out.println("loginService. sdto : " + sdto);
			return "error.do";
		} else {
			request.getSession().setAttribute("member", sdto);
		}

		return "lobbyService.do";
	}

	@Override
	public boolean getType() {
		return true;
	}

}
