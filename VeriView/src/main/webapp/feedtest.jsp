<%@page import="com.saoe.model.member.MemberMemberDAO"%>
<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@page import="com.saoe.model.feed.FeedDAO"%>
<%@page import="com.saoe.model.feed.FeedDTO"%>
<%@page import="com.saoe.model.review.ReviewMemberDTO"%>
<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.reply.ReplyDTO"%>
<%@page import="com.saoe.model.review.ReviewPicDTO"%>
<%@page import="com.saoe.model.review.ReviewDAO"%>
<%@page import="com.saoe.model.review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	MemberMemberDAO memberMemberDAO = new MemberMemberDAO();
	FeedDAO feedDAO = new FeedDAO();

	if (session.getAttribute("member") != null) {
		System.out.println("로그인 되어있음");
		SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");

		int followerCnt = memberMemberDAO.selectFollowerCnt(member.getId());
		int followingCnt = memberMemberDAO.selectFollowingCnt(member.getId());
		pageContext.setAttribute("followerCnt", followerCnt);
		pageContext.setAttribute("followingCnt", followingCnt);

		List<FeedDTO> feedList = feedDAO.selectUserFeed(member.getId());
		pageContext.setAttribute("feedList", feedList);
	} else {
		System.out.println("로그인 안되어있음");
		List<FeedDTO> feedList = feedDAO.selectFeed();
		pageContext.setAttribute("feedList", feedList);
	}
	%>
	
${feedList.size()}
</body>
</html>