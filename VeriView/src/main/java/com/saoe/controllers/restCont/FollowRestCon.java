package com.saoe.controllers.restCont;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saoe.model.member.MemberDTO;
import com.saoe.model.member.SessionUserDTO;
import com.saoe.model.member.RestMemberDTO;
import com.saoe.model.restaurant.RestaurantDAO;

public class FollowRestCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int rest_no = Integer.parseInt(request.getParameter("rest_no"));
		int state = Integer.parseInt(request.getParameter("state"));

		HttpSession session = request.getSession();
		SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");

		RestMemberDTO restMember = new RestMemberDTO(rest_no, member.getId());
		restMember.setRest_follow_yn(state);

		RestaurantDAO dao = new RestaurantDAO();
		int cnt = dao.followRest(restMember);

		if (cnt > 0) {
			System.out.println("음식점 팔로우 성공");
		} else {
			System.out.println("음식점 팔로우 실패");
		}

		response.sendRedirect("feed.jsp");

	}

}
