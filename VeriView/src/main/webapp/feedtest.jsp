<%@page import="com.saoe.model.ReviewMemberDTO"%>
<%@page import="com.saoe.model.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.ReplyDTO"%>
<%@page import="com.saoe.model.ReviewPicDTO"%>
<%@page import="com.saoe.model.ReviewDAO"%>
<%@page import="com.saoe.model.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors" %>
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
	// ReviewMemberDTO rm = new ReviewMemberDTO(reviewList.get(2).getReview_no(), member.getId());
	

	%>
	<%= member.getReviewMemberList().get(0).getReview_no() %>
	<%= reviewList.get(0).getReview_no() %>
	<%= reviewList.get(1).getReview_no() %>
	<%= reviewList.get(2).getReview_no() %>
	<%=member.getReviewMemberList().indexOf(reviewList.get(0).getReview_no()) %>
	<%=member.getReviewMemberList().indexOf(reviewList.get(1).getReview_no()) %>
	<%=member.getReviewMemberList().indexOf(reviewList.get(2).getReview_no()) %>
</body>
</html>