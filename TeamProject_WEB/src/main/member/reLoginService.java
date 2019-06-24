package main.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.front.CommandService;

public class reLoginService implements CommandService {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String socialId = request.getParameter("id");
		String name = request.getParameter("name");
		String src = !request.getParameter("profile_image").equals("null") ? request.getParameter("profile_image")
				: "img/std.gif";
		String access = request.getParameter("access");

		if (socialId == null) {
			System.out.println("reLoginService. id : " + socialId);
			return "error.do";
		}

		memberDAO dao = memberDAO.getDao();
		sessionDTO sdto = null;
		ArrayList<socialDTO> list = new ArrayList<socialDTO>();

		while (true) {
			memberDTO dto = dao.selectId(socialId);

			if (dto != null) {
				HttpSession session = request.getSession();
				sessionDTO target_dto = (sessionDTO) session.getAttribute("member");

				if (!dao.deleteMember(dto.getMember_code())) {
					System.out.println("reLoginService dto.getMember_code(). 결과 : 실패");
					return "error.do";
				}

				String table = null;
				if (access.equals("k")) {
					table = "KAKAO_ID";
				} else if (access.equals("n")) {
					table = "NAVER_ID";
				} else if (access.equals("g")) {
					table = "GOOGLE_ID";
				}

				if (!dao.updateMember(socialId, target_dto.getMember_id(), table)) {
					System.out.println("reLoginService dao.updateMember(socialId, table). 결과 : 실패");
					return "error.do";
				}
				list = dao.selectSocial(target_dto.getMember_id());
				break;
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
						System.out.println("reLoginService dao.socialJoin. 결과 : 실패");
						return "error.do";
					}
				} else {
					System.out.println("reLoginService dao.Join. 결과 : 실패");
					return "error.do";
				}
			}

		}

		if (list.size() == 0) {
			System.out.println("reLoginService. sdto : " + sdto);
			return "error.do";
		} else {
			request.getSession().setAttribute("check", "check"); // 계정의 전체 정보
			request.getSession().removeAttribute("list");
			request.getSession().setAttribute("list", list); // 계정의 전체 정보
		}

		return "lobbyService.do";
	}

	@Override
	public boolean getType() {
		// 센드리다이렉트true, 포워드로false
		return false;
	}

}
