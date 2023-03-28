<%@page import="com.saoe.model.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.ReplyDTO"%>
<%@page import="com.saoe.model.ReviewPicDTO"%>
<%@page import="com.saoe.model.ReviewDAO"%>
<%@page import="com.saoe.model.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

* {
	box-sizing: border-box;
}

body {
	padding: 100px;
	font-family: "Open Sans", sans-serif;
	background: white;
}

.h7 {
	font-size: 15px;
	color: rgb(218, 0, 0);
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

/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}
</style>
</head>

<body>
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->

	<link
		href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet"
		integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
		crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<!-- html 시작 -->
	<div style="background-color: rgb(218, 0, 0); height: 70px;">
		<nav class="tab" style="padding: 10px;">
			<div class="header"
				style="float: left; margin-right: 50px; margin-left: 20px;">
				<a href="#" class="navbar-brand"
					style="color: white; font-size: 25px;">VeriView🍒</a>
			</div>

			<!-- navigator -->
			<div class="nav"
				style="height: 50px; float: left; display: flex; justify-content: center; align-items: center;">
				<a href="#"
					style="color: white; font-size: 20px; float: left; margin-right: 50px;">음식점</a>
				<a href="#"
					style="color: white; font-size: 20px; float: left; margin-right: 50px;">랭킹</a>
				<a href="#"
					style="color: white; font-size: 20px; float: left; margin-right: 50px;">쪽지</a>
			</div>

			<form class="form-inline" style="float: right; height: 50px;">
				<div class="input-group">
					<input type="text" class="form-control">
					<div class="input-group-append">
						<button class="btn btn-outline-danger" type="button"
							id="button-addon2" style="color: rgb(218, 0, 0);">
							<i class="fa fa-search" style="color: white;"></i>
						</button>
					</div>
				</div>
			</form>
		</nav>
	</div>

	<div
		style="height: 60px; display: flex; justify-content: center; align-items: center;">
		<a href="#"
			style="margin-right: 30px; color: rgb(218, 0, 0); font-size: 20px;">새글</a>
		<a href="#" style="color: rgb(218, 0, 0); font-size: 20px;">팔로잉</a>
	</div>

	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<div class="h5" style="height: 30px;">
							<a href="#" style="color: rgb(218, 0, 0);">@${sessionScope.member.getNick()}</a>
						</div>
						<div class="h7 text-muted" style="height: 40px;">간단한 자기소개</div>
						<div class="h7" style="height: 100px;">
							<a href="#" style="color: rgb(218, 0, 0);">프로필 수정</a> <br> <a
								href="#" style="color: rgb(218, 0, 0);">My 목록</a> <br> <a
								href="#" style="color: rgb(218, 0, 0);">신고 목록</a> <br> <a
								href="#" style="color: rgb(218, 0, 0);">회원탈퇴</a>
						</div>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<div class="h6 text-muted">Followers</div>
							<div class="h5">${sessionScope.member.getFollowerCnt()}</div>
						</li>
						<li class="list-group-item">
							<div class="h6 text-muted">Following</div>
							<div class="h5">${sessionScope.member.getFollowingCnt()}</div>
						</li>
						<li class="list-group-item">
							<button class="btn btn-outline-danger" type="button"
								id="button-addon2" style="color: rgb(218, 0, 0);"
								onclick="location.href='/VeriView/LogoutCon'">로그아웃</button>
						</li>
					</ul>
				</div>
			</div>

			<div class="col-md-6 gedf-main">
				<form action="WriteReviewCon" method="post"
					enctype="multipart/form-data">
					<!--- \\\\\\\Post-->
					<div class="card gedf-card">
						<div class="card-header">
							<ul class="nav nav-tabs card-header-tabs" id="myTab"
								role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="posts-tab" data-toggle="tab" href="#posts" role="tab"
									aria-controls="posts" aria-selected="true">리뷰</a></li>

							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="posts"
									role="tabpanel" aria-labelledby="posts-tab">
									<div class="form-group">
										<label class="sr-only" for="message">post</label>
										<textarea name="review_content" class="form-control"
											id="message" rows="3" placeholder="리뷰를 작성해주세요!"></textarea>
									</div>
									<div class="form-group">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="customFile"
												name="img"> <label class="custom-file-label"
												for="customFile">Upload image</label>
										</div>
									</div>
									<div class="btn-toolbar justify-content-between">
										<div class="btn-group">
											<button type="submit" class="btn btn-outline-danger">업로드</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Post /////-->
				</form>
				<%
				ReviewDAO dao = new ReviewDAO();
				List<ReviewDTO> reviewList = dao.feedReview();
				pageContext.setAttribute("reviewList", reviewList);
				%>
				<c:forEach var="review" items="${pageScope.reviewList}">

					<!--- \\\\\\\Post1111111111111-->
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
											<a href="" style="color: rgb(0, 0, 0);">${review.getNick()}</a>
											<a href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
												class="fa fa-regular fa-heart"></i></a>
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
											<!-- <div class="h6 dropdown-header">Configuration</div> -->
											<a class="dropdown-item" href="#"
												style="color: rgb(218, 0, 0);">스크랩</a> <a
												class="dropdown-item" href="#"
												style="color: rgb(218, 0, 0);">신고</a> <a
												class="dropdown-item" href="#"
												style="color: rgb(218, 0, 0);">게시물 차단</a>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="card-body">
							<div class="text-muted h7 mb-2">
								<i class="fa fa-clock-o"></i>${review.getReview_post_date()},
								${review.getReview_update_date()}
							</div>
							<a class="card-link" href="#" style="color: rgb(218, 0, 0);">
								<h5 class="card-title">${review.getRestaurant().getRest_name()}</h5>
							</a>

							<p class="card-text">
							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#carouselExampleIndicators" data-slide-to="0"
										class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								</ol>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img class="d-block w-100"
											src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
											alt="First slide">
									</div>
									<c:forEach var="reviewPic" items="${review.getReviewPicList()}">
										<div class="carousel-item">
											<img class="d-block w-100"
												src="${URLDecoder.decode(reviewPic.getReview_pic_src(), "UTF-8")}" alt="${reviewPic.getReview_pic_src()}">
										</div>
									</c:forEach>
								</div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
							${review.getReview_content()}
							</p>
							<div>
								<span class="badge badge-danger">${review.getRestaurant().getCategory().getMain_cate()}</span>
								<span class="badge badge-danger">${review.getRestaurant().getCategory().getSub_cate()}</span>
							</div>
						</div>
						<div class="card-footer">
							<a href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
								class="fa fa-thumbs-up" style="color: rgb(218, 0, 0);"></i> 좋아요</a>
							<a href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
								class="fa fa-thumbs-down" style="color: rgb(218, 0, 0);"></i>
								싫어요</a> <a href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
								class="fa fa-mail-forward" style="color: rgb(218, 0, 0);"></i>
								공유</a>
						</div>

						<div class="card mb-2">
							<div class="card-header bg-light" style="color: rgb(218, 0, 0);">
								<i class="fa fa-comment fa" style="color: rgb(218, 0, 0);"></i>
								댓글
							</div>
							<div class="card-body">
								<form>
									<div class="form-group">
										<textarea class="form-control" rows="3"></textarea>
									</div>
									<div class="container">
										<div class="row">
											<div class="col text-center">
												<button class="btn btn-outline-danger" type="submit">작성</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>

						<!-- Single comment-->
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<div class="d-flex justify-content-between align-items-center">
									<div class="mr-2">
										<img class="rounded-circle" width="45"
											src="https://picsum.photos/50/50" alt="">
									</div>
									<div class="ml-2">
										<div class="h5 m-0">
											<a href="" style="color: rgb(0, 0, 0);">닉네임</a>
										</div>
										<h5 class="mt-0">댓글</h5>
									</div>
								</div>
							</div>
						</div>

						<!-- Comment with nested comments-->
						<div class="card-body">
							<div class="media mb-4">
								<div class="mr-2">
									<img class="rounded-circle" width="45"
										src="https://picsum.photos/50/50" alt="">
								</div>
								<div class="media-body">
									<h5 class="mt-0">
										<a href="" style="color: rgb(0, 0, 0);"> 닉네임 </a>
									</h5>
									댓글
									<div class="media mt-4">
										<div class="mr-2">
											<img class="rounded-circle" width="45"
												src="https://picsum.photos/50/50" alt="">
										</div>
										<div class="media-body">
											<h5 class="mt-0">
												<a href="" style="color: rgb(0, 0, 0);"> 닉네임 </a>
											</h5>
											대댓글
										</div>
									</div>
									<div class="media mt-4">
										<div class="mr-2">
											<img class="rounded-circle" width="45"
												src="https://picsum.photos/50/50" alt="">
										</div>
										<div class="media-body">
											<h5 class="mt-0">
												<a href="" style="color: rgb(0, 0, 0);"> 닉네임 </a>
											</h5>
											대댓글
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Post /////-->
				</c:forEach>
				<!--- \\\\\\\Post1111111111111-->
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
										<a href="" style="color: rgb(0, 0, 0);">닉네임</a> <a href="#"
											class="card-link" style="color: rgb(218, 0, 0);"><i
											class="fa fa-regular fa-heart"></i></a>
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
										<!-- <div class="h6 dropdown-header">Configuration</div> -->
										<a class="dropdown-item" href="#"
											style="color: rgb(218, 0, 0);">스크랩</a> <a
											class="dropdown-item" href="#" style="color: rgb(218, 0, 0);">신고</a>
										<a class="dropdown-item" href="#"
											style="color: rgb(218, 0, 0);">게시물 차단</a>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="card-body">
						<div class="text-muted h7 mb-2">
							<i class="fa fa-clock-o"></i>10 min ago
						</div>
						<a class="card-link" href="#" style="color: rgb(218, 0, 0);">
							<h5 class="card-title">식당이름</h5>
						</a>

						<p class="card-text">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
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
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
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
						<a href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
							class="fa fa-thumbs-up" style="color: rgb(218, 0, 0);"></i> 좋아요</a> <a
							href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
							class="fa fa-thumbs-down" style="color: rgb(218, 0, 0);"></i> 싫어요</a>
						<a href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
							class="fa fa-mail-forward" style="color: rgb(218, 0, 0);"></i> 공유</a>
					</div>

					<div class="card mb-2">
						<div class="card-header bg-light" style="color: rgb(218, 0, 0);">
							<i class="fa fa-comment fa" style="color: rgb(218, 0, 0);"></i>
							댓글
						</div>
						<div class="card-body">
							<form>
								<div class="form-group">
									<textarea class="form-control" rows="3"></textarea>
								</div>
								<div class="container">
									<div class="row">
										<div class="col text-center">
											<button class="btn btn-outline-danger" type="submit">작성</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

					<!-- Single comment-->
					<div class="card-body">
						<div class="d-flex justify-content-between align-items-center">
							<div class="d-flex justify-content-between align-items-center">
								<div class="mr-2">
									<img class="rounded-circle" width="45"
										src="https://picsum.photos/50/50" alt="">
								</div>
								<div class="ml-2">
									<div class="h5 m-0">
										<a href="" style="color: rgb(0, 0, 0);">닉네임</a>
									</div>
									<h5 class="mt-0">댓글</h5>
								</div>
							</div>
						</div>
					</div>

					<!-- Comment with nested comments-->
					<div class="card-body">
						<div class="media mb-4">
							<div class="mr-2">
								<img class="rounded-circle" width="45"
									src="https://picsum.photos/50/50" alt="">
							</div>
							<div class="media-body">
								<h5 class="mt-0">
									<a href="" style="color: rgb(0, 0, 0);"> 닉네임 </a>
								</h5>
								댓글
								<div class="media mt-4">
									<div class="mr-2">
										<img class="rounded-circle" width="45"
											src="https://picsum.photos/50/50" alt="">
									</div>
									<div class="media-body">
										<h5 class="mt-0">
											<a href="" style="color: rgb(0, 0, 0);"> 닉네임 </a>
										</h5>
										대댓글
									</div>
								</div>
								<div class="media mt-4">
									<div class="mr-2">
										<img class="rounded-circle" width="45"
											src="https://picsum.photos/50/50" alt="">
									</div>
									<div class="media-body">
										<h5 class="mt-0">
											<a href="" style="color: rgb(0, 0, 0);"> 닉네임 </a>
										</h5>
										대댓글
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Post /////-->

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
										<a href="" style="color: rgb(0, 0, 0);">식당</a> <a href="#"
											class="card-link" style="color: rgb(218, 0, 0);"><i
											class="fa fa-regular fa-heart"></i></a>
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
										<!-- <div class="h6 dropdown-header">Configuration</div> -->
										<a class="dropdown-item" href="#"
											style="color: rgb(218, 0, 0);">스크랩</a> <a
											class="dropdown-item" href="#" style="color: rgb(218, 0, 0);">식당
											차단</a>
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
						<a href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
							class="fa fa-thumbs-up" style="color: rgb(218, 0, 0);"></i> 좋아요</a> <a
							href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
							class="fa fa-thumbs-down" style="color: rgb(218, 0, 0);"></i> 싫어요</a>
						<a href="#" class="card-link" style="color: rgb(218, 0, 0);"><i
							class="fa fa-mail-forward" style="color: rgb(218, 0, 0);"></i> 공유</a>
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
</body>

</html>