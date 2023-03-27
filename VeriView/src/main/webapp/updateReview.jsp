<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.ReviewPicDTO"%>
<%@page import="com.saoe.model.ReviewDAO"%>
<%@page import="com.saoe.model.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int review_no = Integer.parseInt(request.getParameter("review_no"));
	ReviewDAO dao = new ReviewDAO();
	ReviewDTO review = dao.selectReview(review_no);

	%>
	<table border="1px solid black">
		<form action="UpdateReviewCon" method="post">
			<tr>
				<td>리뷰 번호 :</td>
				<td><input type="text" name="review_no"
					value="<%=review.getReview_no()%>" readonly></td>
			</tr>
			<tr>
				<td>리뷰 게시자 :</td>
				<td><input type="text" name="id" value="<%=review.getId()%>"
					readonly></td>
			</tr>
			<tr>
				<td>외부 리뷰 url :</td>
				<td><input type="text" name="foreign_review_url"
					value="<%=review.getForeign_review_url()%>" readonly></td>
			</tr>
			<tr>
				<td>리뷰 내용 :</td>
				<td><textarea name="review_content"><%=review.getReview_content()%></textarea></td>
			</tr>
			<tr>
				<td>리뷰 점수 :</td>
				<td><input type="text" name="review_score"
					value="<%=review.getReview_score()%>" readonly></td>
			</tr>
			<tr>
				<td>리뷰 보여주기 여부 :</td>
				<td><input type="text" name="review_display"
					value="<%=review.getReview_display()%>" readonly></td>
			</tr>
			<tr>
				<td>리뷰 게시 날짜 :</td>
				<td><input type="text" name="review_post_date"
					value="<%=review.getReview_post_date()%>" readonly></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정하기"></td>
			</tr>
		</form>
	</table>
	<% if(review.getReviewPicList() != null){
	for (ReviewPicDTO reviewPic : review.getReviewPicList()) {
			String src = URLDecoder.decode(reviewPic.getReview_pic_src(),"UTF-8");
	%>
			<img alt="ㅇㄹㅇㄹ" src="<%= src%>" width="300px" height="200px">
	<% }}%>
	
</body>
</html>