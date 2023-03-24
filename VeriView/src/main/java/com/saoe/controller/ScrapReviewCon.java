package com.saoe.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saoe.model.MemberDTO;
import com.saoe.model.ReviewDAO;
import com.saoe.model.ReviewDTO;

public class ScrapReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String id = member.getId();
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		ReviewDTO review = new ReviewDTO();
		review.setId(id);
		review.setReview_no(review_no);
		
		int cnt = new ReviewDAO().scrapReview(review);
		
		System.out.println(id+review_no);
		
		if(cnt > 0) {
			System.out.println("리뷰 스크랩 성공");
		}else {
			System.out.println("리뷰 스크랩 실패");			
		}
		
		response.sendRedirect("feed.jsp");
	}

}
