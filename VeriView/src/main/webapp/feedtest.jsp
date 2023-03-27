<%@page import="com.saoe.model.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.ReplyDTO"%>
<%@page import="com.saoe.model.ReviewPicDTO"%>
<%@page import="com.saoe.model.ReviewDAO"%>
<%@page import="com.saoe.model.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	MemberDTO member = (MemberDTO)session.getAttribute("member");
	
	ReviewDAO dao = new ReviewDAO();
	List<ReviewDTO> reviewList = dao.feedReview();

	for (ReviewDTO review : reviewList) {
		if (review.getReview_display() == 1) {
			out.print("<hr>==========리뷰=========<br>");
			out.print("리뷰 번호 : " + review.getReview_no() + ", ");
			out.print("리뷰게시자 : " + review.getId() + ", ");
			out.print("외부 리뷰 url : " + review.getForeign_review_url() + ", ");
			out.print("리뷰 카테고리 : " + review.getRest_no() + ", ");
			out.print("리뷰 내용 : " + review.getReview_content() + ", ");
			out.print("리뷰 점수 : " + review.getReview_score() + ", ");
			out.print("리뷰 보여주기 여부 : " + review.getReview_display() + ", ");
			out.print("리뷰 게시 날짜 : " + review.getReview_post_date() + "<br>");
			out.print("리뷰 식당 이름 : " + review.getRestaurant().getRest_name() + "<br>");
			out.print("리뷰 식당 주소 : " + review.getRestaurant().getRest_addr() + "<br>");
			out.print("리뷰 식당 : " + review.getRestaurant().getRest_tel() + "<br>");
			out.print("<a href=\"restDetail.jsp?rest_no=" + review.getRest_no() + "\"><button>식당상세보기</button></a>");
			out.print("리뷰 메인 카테고리 : " + review.getRestaurant().getCategory().getMain_cate() + "<br>");
			out.print("리뷰 서브 카테고리 : " + review.getRestaurant().getCategory().getSub_cate() + "<br>");
			out.print("리뷰 게시자 닉네임 : " + review.getNick() + "<br>");
			out.print("리뷰 게시자 프로필 사진 : " + review.getProfile() + "<br>");
			out.print("<a href=\"profile.jsp?id=" + member.getId() + "\"><button>회원 프로필 보기</button></a>");
			out.print("<a href=\"FollowMemberCon?id=" + member.getId() + "&state=1\"><button>회원팔로우</button></a>");
			out.print("<a href=\"BlockMemberCon?id=" + member.getId() + "&state=1\"><button>회원 차단</button></a>");
			out.print("<a href=\"ReportMemberCon?id=" + member.getId() + "&state=1\"><button>회원 신고</button></a>");

			for (ReplyDTO reply : review.getReplyList()) {
		out.print("댓글 번호 : " + reply.getReply_no() + ", ");
		out.print("리뷰 번호 : " + reply.getReview_no() + ", ");
		out.print("댓글 게시 날짜 : " + reply.getReply_date() + ", ");
		out.print("댓글 게시자 : " + reply.getId() + ", ");
		out.print("댓글 내용 : " + reply.getReply_content() + ", ");
		out.print("부모 댓글 번호 : " + reply.getParent_no() + "<br>");
			}

			for (ReviewPicDTO reviewPic : review.getReviewPicList()) {
		String src = URLDecoder.decode(reviewPic.getReview_pic_src(), "UTF-8");
		out.print("사진 번호 : " + reviewPic.getReview_pic_no() + ", ");
		out.print("리뷰 번호 : " + reviewPic.getReview_no() + ", ");
		out.print("사진 : " + src + ", ");
		out.print("사진 크기 : " + reviewPic.getReview_pic_size() + "<br>");
	%>
	<img alt="ㅇㄹㅇㄹ" src="<%=src%>" width="300px" height="200px">
	<a href="updateReview.jsp?review_no=<%=review.getReview_no()%>"><button>리뷰수정</button></a>
	<a href="DeleteReviewCon?review_no=<%=review.getReview_no()%>"><button>리뷰삭제</button></a>
	<a href="ScrapReviewCon?review_no=<%=review.getReview_no()%>"><button>리뷰 스크랩</button></a>
	<a href="BlockReviewCon?review_no=<%=review.getReview_no()%>"><button>리뷰 차단</button></a>
	<a href="ReportReviewCon?review_no=<%=review.getReview_no()%>"><button>리뷰 신고</button></a>
	<a href="GBReviewCon?review_no=<%=review.getReview_no()%>&state=1"><button>리뷰 좋아요</button></a>
	<a href="GBReviewCon?review_no=<%=review.getReview_no()%>&state=-1"><button>리뷰 싫어요</button></a>
	
	
	<%
	}
	}
	}
	%>
</body>
</html>