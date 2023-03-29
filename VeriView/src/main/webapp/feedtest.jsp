<%@page import="com.saoe.model.FeedDAO"%>
<%@page import="com.saoe.model.FeedDTO"%>
<%@page import="com.saoe.model.ReviewMemberDTO"%>
<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.ReplyDTO"%>
<%@page import="com.saoe.model.ReviewPicDTO"%>
<%@page import="com.saoe.model.ReviewDAO"%>
<%@page import="com.saoe.model.ReviewDTO"%>
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
	MemberDTO member = (MemberDTO) session.getAttribute("member");
	FeedDAO feedDAO = new FeedDAO();
	List<FeedDTO> feedList = feedDAO.selectFeed(member);
	pageContext.setAttribute("feedList", feedList);
	

	%>
	<c:forEach var="feed" items="${pageScope.feedList}"> 		
		${feed.review.replyList}		
	</c:forEach>
</body>
</html>