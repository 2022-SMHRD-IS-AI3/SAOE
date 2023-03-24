package com.saoe.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.saoe.model.MemberDTO;
import com.saoe.model.ReviewDAO;
import com.saoe.model.ReviewDTO;
import com.saoe.model.ReviewPicDTO;

@WebServlet("/WriteReviewCon")
public class WriteReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 파일 저장할 경로
		String path = request.getServletContext().getRealPath("file");
		System.out.println(path);

		int maxSize = 10 * 1024 * 1024;

		// 인코딩 방식
		String encoding = "UTF-8";

		// 파일 이름 중복 방지
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		// 파일 업로드 객체
		MultipartRequest multi;

		try {
			
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			
			// 리뷰 작성 페이지에서 받아오는 값들
			String review_content = multi.getParameter("review_content");
			String img = multi.getFilesystemName("img");
			String img_en = URLEncoder.encode(img, "UTF-8");

			// 이미지 파일 이름 분리
			int dot = img_en.indexOf(".");
			String review_pic_title = img_en.substring(0, dot);
			String review_pic_type = img_en.substring(dot, img_en.length());
			String review_pic_src = "./file/";

			// 리뷰 작성자 id를 세션에서 받아옴
			HttpSession session = request.getSession();
			MemberDTO dto = (MemberDTO) session.getAttribute("member");
			String id = dto.getId();

			// review 테이블에 넣기위해 객체에 담음
			ReviewDTO review = new ReviewDTO(id, 1, review_content);

			// 사진을 업로드하기위해 생성된 게시글 시퀀스를 받음
			ReviewDAO dao = new ReviewDAO();
			
			// 사진을 객체에 담음
			ReviewPicDTO reviewPic = new ReviewPicDTO(review_pic_title, review_pic_type, review_pic_src, 0);

			int cnt = dao.uploadReview(review, reviewPic);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("main.jsp");

	}

}