package com.saoe.controllers.memberController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saoe.model.MemberDAO;
import com.saoe.model.MemberDTO;

public class UpdateMemberCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String profile_message = request.getParameter("profile_message");
		
		HttpSession session = request.getSession();
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		MemberDTO updateMember = new MemberDTO(member.getId(), pw);
		updateMember.setNick(nick);
		updateMember.setTel(tel);
		updateMember.setAddr(addr);
		
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.updateMember(updateMember);
		
		if(cnt > 0) {
			System.out.println("회원 정보 수정 성공");
			member.setPw(pw);
			member.setNick(nick);
			member.setTel(tel);
			member.setAddr(addr);
		}else {
			System.out.println("회원 정보 수정 실패");			
		}
		
		response.sendRedirect("mypage.jsp");
		
	
	}

}
