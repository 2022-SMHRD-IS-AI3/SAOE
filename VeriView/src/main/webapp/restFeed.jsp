<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@page import="com.saoe.model.member.MemberMemberDAO"%>
<%@page import="com.saoe.model.category.CategoryDTO"%>
<%@page import="com.saoe.model.feed.FeedDAO"%>
<%@page import="com.saoe.model.feed.FeedDTO"%>
<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.reply.ReplyDTO"%>
<%@page import="com.saoe.model.review.ReviewPicDTO"%>
<%@page import="com.saoe.model.review.ReviewDAO"%>
<%@page import="com.saoe.model.review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"">
	<script src="https://kit.fontawesome.com/6dc009df2e.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

* {
	box-sizing: border-box;
}

.h7 {
	font-size: 15px;
	color: rgb(218, 0, 0);
}

#img1{
   object-fit:contain;
}
#img2{
   object-fit:contain;
}


.gedf-wrapper {
	margin-top: 10px;
}

@media ( min-width : 992px) {
	.gedf-main {
		padding-left: 4rem;
		padding-right: 4rem;
	}
	.gedf-card {
		margin-bottom: 2.77rem;
	}
}

.fix-nav {
	position: sticky;
	top: 0;
	/* width: 100% */
	left: 0;
	right: 0;
	z-index: 2;

	/* 생략 */
}

/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}

</style>
</head>

<body>
	<!-- html 시작 -->

	<!-- header -->
	<c:import url="./layout/header.jsp"></c:import>
	<%
	MemberMemberDAO memberMemberDAO = new MemberMemberDAO();
	FeedDAO feedDAO = new FeedDAO();

	if (session.getAttribute("member") != null) {
		SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");

		int followerCnt = memberMemberDAO.selectFollowerCnt(member.getId());
		int followingCnt = memberMemberDAO.selectFollowingCnt(member.getId());
		pageContext.setAttribute("followerCnt", followerCnt);
		pageContext.setAttribute("followingCnt", followingCnt);

		List<FeedDTO> feedList = feedDAO.selectUserFeed(member.getId());
		pageContext.setAttribute("feedList", feedList);
	} else {
		List<FeedDTO> feedList = feedDAO.selectFeed();
		pageContext.setAttribute("feedList", feedList);
	}
	%>

	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3">
				<c:if test="${not empty sessionScope.member}">
					<div class="card">
						<div class="card-body">
							<div class="row" height="80px">
								<div class="media" style="text-align: center;">
									<a class="thumbnail pull-left"
										href="profile.jsp?id=${sessionScope.member.id}"> <img
										class="rounded-circle" width="80px"
										src="https://picsum.photos/50/50" alt="">
									</a>
								</div>
							</div>
							<div class="row-fluid">
								<div class="h4" style="height: 40px;">
									<a href="profile.jsp?id=${sessionScope.member.id}" style="color: rgb(218, 0, 0); height: 50px; position: absolute; top: 120px;">
										@${sessionScope.member.getNick()}
									</a>
								</div>
								<div class="h7 text-muted" style="height: 40px;">
									<c:if test="${empty sessionScope.member.profile_message}">@회원 코멘트가 없습니다.</c:if>
									<c:if test="${not empty sessionScope.member.profile_message}">@${sessionScope.member.profile_message}</c:if>
								</div>
								<div class="h7">
									<a href="updateMember.jsp" style="color: rgb(218, 0, 0);">프로필 수정</a> <br> 
									<a href="profile.jsp?id=${sessionScope.member.id}" style="color: rgb(218, 0, 0);">My 목록</a> <br>
								</div>
							</div>
						</div>

						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="h6 text-muted">Followers</div>
								<div class="h5">${pageScope.followerCnt }</div>
							</li>
							<li class="list-group-item">
								<div class="h6 text-muted">Following</div>
								<div class="h5">${pageScope.followingCnt }</div>
							</li>
							<li class="list-group-item">
								<button class="btn btn-outline-danger" type="button"
									id="button-addon2" style="color: rgb(218, 0, 0);"
									onclick="location.href='/VeriView/LogoutCon'">로그아웃</button>
							</li>
						</ul>
					</div>
				</c:if>
				<c:if test="${empty sessionScope.member}">
					<div class="card">
						<div class="card-body">
							<div class="h5" style="height: 30px; color: rgb(218, 0, 0);">게스트</div>
							<div class="h7 text-muted" style="height: 40px;">로그인 후 이용해 주세요!</div>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<button class="btn btn-outline-danger" type="button"
									id="button-addon2" style="color: rgb(218, 0, 0);"
									onclick="location.href='./start.jsp'">로그인</button>
							</li>
							<li class="list-group-item">
								<button class="btn btn-outline-danger" type="button"
									id="button-addon2" style="color: rgb(218, 0, 0);"
									onclick="location.href='./start.jsp'">회원가입</button>
							</li>
						</ul>
					</div>
				</c:if>
			</div>

			<div class="col-md-6 gedf-main">
			
				<%
				List<CategoryDTO> cateList = new FeedDAO().selectCate();
				pageContext.setAttribute("cateList", cateList);
				%>

				<div class="row my-3">
					<c:forEach var="cate" items="${pageScope.cateList}">
						<button type="button" class="btn btn-outline-light mx-1"
							style="background-color: #da0000 !important; - -bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;"
							data-bs-toggle="tooltip" data-bs-placement="top"
							data-bs-title="Tooltip on top">${cate.main_cate}</button>
					</c:forEach>
				</div>

				<c:forEach var="cate" items="${pageScope.cateList}">
					<div class="row my-3">
						<button type="button" class="btn btn-outline-light mx-1"
							style="background-color: #da0000 !important; - -bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;"
							data-bs-toggle="tooltip" data-bs-placement="top"
							data-bs-title="Tooltip on top">${cate.main_cate}</button>
						<c:forEach var="sub" items="${cate.sub_cateList}">
							<button type="button" class="btn btn-outline-light mx-1"
								style="background-color: #da0000 !important; - -bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;"
								data-bs-toggle="tooltip" data-bs-placement="top"
								data-bs-title="Tooltip on top">${sub.sub_cate}</button>
						</c:forEach>
					</div>
				</c:forEach>



				<div class="row-fluid">
					<!--- \\\\\\\Post2222222222222222222222-->
					<div class="card gedf-card">
						<div class="card-header">
							<div class="d-flex justify-content-between align-items-center">
								<div class="d-flex justify-content-between align-items-center">
									<div class="mr-2">
										<img class="rounded-circle" width="45"
											src="https://picsum.photos/50/50" alt="">
									</div>
									<div class="ml-2">
										<div class="h5 m-0">
											<a href="" style="color: rgb(0, 0, 0);">식당</a> 
											<a href="#" class="card-link actionBtn" style="color: rgb(218, 0, 0);">
												<i class="fa fa-regular fa-heart"></i>
											</a>
										</div>
										<!-- <div class="h7 text-muted">Miracles Lee Cross</div> -->
									</div>
								</div>
								<div>
									<div class="dropdown">
										<button class="btn btn-link dropdown-toggle" type="button"
											id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false" style="color: rgb(218, 0, 0);">
											<i class="fa fa-ellipsis-h" style="color: rgb(218, 0, 0);"></i>
										</button>
										<div class="dropdown-menu dropdown-menu-right"
											aria-labelledby="gedf-drop1">
											<a class="dropdown-item actionBtn" href="#" style="color: rgb(218, 0, 0);">스크랩</a> 
											<a class="dropdown-item actionBtn" href="#" style="color: rgb(218, 0, 0);">식당 차단</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="card-body">
							<div class="text-muted h7 mb-2">
								<i class="fa fa-clock-o"></i>10 min ago
							</div>
							<p class="card-text">
							<div id="carouselExampleIndicators2" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#carouselExampleIndicators2" data-slide-to="0"
										class="active"></li>
									<li data-target="#carouselExampleIndicators2" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators2" data-slide-to="2"></li>
								</ol>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img class="d-block w-100"
											src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100"
											src="https://www.nongmin.com/-/raw/srv-nongmin/data2/content/image/2022/02/13/.cache/512/2022021301068644.jpg"
											alt="Second slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100"
											src="https://cdn.mindgil.com/news/photo/202007/69545_3802_1558.jpg"
											alt="Third slide">
									</div>
								</div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators2" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators2" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
							리뷰내용 블라블라 리뷰내용 블라블라 리뷰내용 블라블라 리뷰내용 블라블라 리뷰내용 블라블라 리뷰내용 블라블라 리뷰내용
							블라블라 리뷰내용 블라블라 리뷰내용 블라블라 리뷰내용 블라블라
							</p>
							<div>
								<span class="badge badge-danger">한식</span> <span
									class="badge badge-danger">중식</span> <span
									class="badge badge-danger">일식</span> <span
									class="badge badge-danger">양식</span> <span
									class="badge badge-danger">카페</span>
							</div>
						</div>
						<div class="card-footer">
							<a href="#" class="card-link actionBtn" style="color: rgb(218, 0, 0);">
								<i class="fa fa-thumbs-up" style="color: rgb(218, 0, 0);"></i> 좋아요
							</a>
							<a href="#" class="card-link actionBtn" style="color: rgb(218, 0, 0);">
								<i class="fa fa-thumbs-down" style="color: rgb(218, 0, 0);"></i> 싫어요
							</a>
							<a href="#" class="card-link actionBtn" style="color: rgb(218, 0, 0);">
								<i class="fa fa-mail-forward" style="color: rgb(218, 0, 0);"></i> 공유
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 광고 배너 -->
			<div class="col-md-3">
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">
							<a href="#">광고 배너</a>
						</h5>
						<h6 class="card-subtitle mb-2 text-muted">게시자</h6>
						<p class="card-text">광고 내용</p>
					</div>
				</div>
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
			</div>
		</div>
	</div>	




<script>
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>

</html>