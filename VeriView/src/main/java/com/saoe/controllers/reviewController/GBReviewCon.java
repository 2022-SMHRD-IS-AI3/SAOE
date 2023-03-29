package com.saoe.controllers.reviewController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saoe.model.ReviewDAO;
import com.saoe.model.ReviewMemberDTO;
import com.saoe.model.member.MemberDTO;

@WebServlet("/GBReviewCon")
public class GBReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String id = member.getId();
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		int state = Integer.parseInt(request.getParameter("state"));
		

		ReviewMemberDTO reviewMember = new ReviewMemberDTO();
		reviewMember.setActor_id(id);
		reviewMember.setReview_no(review_no);
		reviewMember.setReview_gb(state);

		int cnt = new ReviewDAO().gbReview(reviewMember);

		System.out.println(id + review_no);

		if (cnt > 0) {
			System.out.println("리뷰 평가 성공");
		} else {
			System.out.println("리뷰 평가 실패");
		}

		response.sendRedirect("feed.jsp");

	
	}

}
