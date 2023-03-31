<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@page import="com.saoe.model.profile.ProfileReportDTO"%>
<%@page import="com.saoe.model.profile.ProfileBlockDTO"%>
<%@page import="com.saoe.model.profile.ProfileFollowDTO"%>
<%@page import="com.saoe.model.profile.ProfileFeedDTO"%>
<%@page import="com.saoe.model.profile.ProfileDTO"%>
<%@page import="com.saoe.model.profile.ProfileDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.saoe.model.member.MemberDAO"%>
<%@page import="com.saoe.model.feed.FeedDAO"%>
<%@page import="com.saoe.model.feed.FeedDTO"%>
<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.reply.ReplyDTO"%>
<%@page import="com.saoe.model.review.ReviewPicDTO"%>
<%@page import="com.saoe.model.review.ReviewDAO"%>
<%@page import="com.saoe.model.review.ReviewDTO"%>
<%@page import="java.util.List"%>
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

<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

* {
	box-sizing: border-box;
}

body {
	font-family: "Open Sans", sans-serif;
	background: white;
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

a {
	color: rgb(218, 0, 0);
}

.aaa {
	height: 150px;
	width: 200px;
}

/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}

/* 프로필 css */
.social-box .box {
	background: #FFF;
	border-radius: 10px;
	cursor: pointer;
	margin: 20px 0;
	padding: 40px 10px;
	transition: all 0.5s ease-out;
}

.social-box .box:hover {
	box-shadow: 0 0 6px #4183D7;
}

.social-box .box-text {
	font-size: 15px;
	line-height: 30px;
	margin: 20px 0;
}

.social-box .box-btn a {
	color: #4183D7;
	font-size: 16px;
	text-decoration: none;
}

.social-box .fa {
	color: #4183D7;
}
</style>
</head>

<body>
	<!-- html 시작 -->

	<!-- header -->
	<c:import url="./layout/header.jsp"></c:import>

	<%
	SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
	String id = member.getId();
	pageContext.setAttribute("id", id);

	ProfileDAO profileDAO = new ProfileDAO();
	ProfileDTO profile = profileDAO.selectProfile(id);
	List<ProfileFollowDTO> profileFollowerList = profileDAO.selectProfileFollower(id);
	List<ProfileFollowDTO> profileFollowingList = profileDAO.selectProfileFollowing(id);

	List<ProfileFeedDTO> profileScrapReviewList = profileDAO.selectProfileScrapReview(id);
	List<ProfileFeedDTO> profileGoodReviewList = profileDAO.selectProfileGoodReview(id);
	List<ProfileFeedDTO> profileBadReviewList = profileDAO.selectProfileBadReview(id);
	List<ProfileFeedDTO> profileBlockReviewList = profileDAO.selectProfileBlockReview(id);
	List<ProfileFeedDTO> profileReportReviewList = profileDAO.selectProfileReportReview(id);

	pageContext.setAttribute("profile", profile);
	pageContext.setAttribute("profileFollowerList", profileFollowerList);
	pageContext.setAttribute("profileFollowingList", profileFollowingList);

	pageContext.setAttribute("profileScrapReviewList", profileScrapReviewList);
	pageContext.setAttribute("profileGoodReviewList", profileGoodReviewList);
	pageContext.setAttribute("profileBadReviewList", profileBadReviewList);
	pageContext.setAttribute("profileBlockReviewList", profileBlockReviewList);
	pageContext.setAttribute("profileReportReviewList", profileReportReviewList);
	%>

	<!-- 프로필 시작 -->
	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<div class="media" style="text-align: center;">
							<a class="thumbnail pull-left" href="./profile.jsp?id=${pageScope.profile.id}"> <img
								class="rounded-circle" width="80px"
								src="https://picsum.photos/50/50" alt="">
							</a>
						</div>
						<div class="h4" style="height: 40px;">
							<a href="./profile.jsp?id=${pageScope.profile.id}"
								style="color: rgb(218, 0, 0); height: 50px; position: absolute; top: 120px;">@${pageScope.profile.nick}</a>
						</div>
						<div class="h7 text-muted" style="height: 40px;">
							<c:if test="${empty pageScope.profile.profile_message}">@회원 코멘트가 없습니다.</c:if>
							<c:if test="${not empty pageScope.profile.profile_message}">@${pageScope.profile.profile_message}</c:if>
						</div>
                        <div class="h7" style="height: 80px;">
                            <a href="./updateMember.jsp" style="color: rgb(218, 0, 0);">프로필 수정</a> <br>
                            <a href="./myUserList.jsp" style="color: rgb(218, 0, 0);">회원 목록</a> <br>
                            <a href="./myReviewList.jsp" style="color: rgb(218, 0, 0);">리뷰 목록</a> <br>
                            <a href="./myRestList.jsp" style="color: rgb(218, 0, 0);">음식점 목록</a>
                        </div>


					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<div class="h6 text-muted">Riview</div>
							<div class="h5">${fn:length(pageScope.profileFeedList)}</div>
						</li>
						<li class="list-group-item">
							<button class="btn btn-outline-danger" type="button"
								id="button-addon2" style="color: rgb(218, 0, 0);"
								onclick="location.href='LogoutCon'">로그아웃</button>
						</li>
						<li class="list-group-item">
							<button class="btn btn-outline-danger" type="button"
								id="button-addon2" style="color: rgb(218, 0, 0);"
								onclick="location.href='./quit.jsp'">회원탈퇴</button>
						</li>

					</ul>
				</div>
			</div>

			<div class="col-md-6 gedf-main">

				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#a">즐겨찾기</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#b">좋아요</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#c">싫어요</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#d">차단</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#e">신고</a></li>
				</ul>

				<div class="tab-content" style="margin-top: 20px;">
					<div class="tab-pane fade show active" id="a">

						<div class="row">
							<c:forEach var="scrapReview" items="${pageScope.profileScrapReviewList}">
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img
												src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
												class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="#" style="color: rgb(218, 0, 0);">${fn:substring(scrapReview.rest_name,0,5) }...</a>
												</h4>
											</div>
											<div class="box-text">
												<span>${fn:substring(scrapReview.review_content,0,8)}...</span>
											</div>
											<div>
												<a href="#" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
											<div class="box-btn"
												style="text-align: center; margin-top: 10px;">
												<button class="btn btn-danger" id="w1"
													onmouseover="w1_mouseover()" onmouseout="w1_mouseout()">스크랩</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>


					<div class="tab-pane fade" id="b">

						<div class="row">
							<c:forEach var="goodReview"
								items="${pageScope.profileGoodReviewList}">
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img
												src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
												class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="#" style="color: rgb(218, 0, 0);">${fn:substring(goodReview.rest_name,0,5) }...</a>
												</h4>
											</div>
											<div class="box-text">
												<span>${fn:substring(goodReview.review_content,0,8)}...</span>
											</div>
											<div>
												<a href="#" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
										<div class="box-btn"
											style="text-align: center; margin-top: 10px;">
											<button class="btn btn-danger" id="w2"
												onmouseover="w2_mouseover()" onmouseout="w2_mouseout()">좋아요</button>
										</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="card gedf-card" style="margin-right: 30px;">
								<div class="box">
									<div>
										<img
											src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
											class="aaa">
									</div>
									<div class="card-body">
										<div class="box-title">
											<h4>
												<a href="#" style="color: rgb(218, 0, 0);">식당이름</a>
											</h4>
										</div>
										<div class="box-text">
											<span>간단한 리뷰 내용</span>
										</div>
										<div>
											<a href="#" style="color: rgb(218, 0, 0);">더보기</a>
										</div>
										<div class="box-btn"
											style="text-align: center; margin-top: 10px;">
											<button class="btn btn-danger" id="w2"
												onmouseover="w2_mouseover()" onmouseout="w2_mouseout()">좋아요</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>


					<div class="tab-pane fade" id="c">
						<div class="row">
							<c:forEach var="badReview"
								items="${pageScope.profileBadReviewList}">
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img
												src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
												class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="#" style="color: rgb(218, 0, 0);">${fn:substring(badReview.rest_name,0,5) }...</a>
												</h4>
											</div>
											<div class="box-text">
												<span>${fn:substring(badReview.review_content,0,8)}...</span>
											</div>
											<div>
												<a href="#" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
										<div class="box-btn"
											style="text-align: center; margin-top: 10px;">
											<button class="btn btn-danger" id="w3"
												onmouseover="w3_mouseover()" onmouseout="w3_mouseout()">싫어요</button>
										</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="card gedf-card" style="margin-right: 30px;">
								<div class="box">
									<div>
										<img
											src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
											class="aaa">
									</div>
									<div class="card-body">
										<div class="box-title">
											<h4>
												<a href="#" style="color: rgb(218, 0, 0);">식당이름</a>
											</h4>
										</div>
										<div class="box-text">
											<span>간단한 리뷰 내용</span>
										</div>
										<div>
											<a href="#" style="color: rgb(218, 0, 0);">더보기</a>
										</div>
										<div class="box-btn"
											style="text-align: center; margin-top: 10px;">
											<button class="btn btn-danger" id="w3"
												onmouseover="w3_mouseover()" onmouseout="w3_mouseout()">싫어요</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="tab-pane fade" id="d">

						<div class="row">
						<c:forEach var="blockReview" items="${pageScope.profileBlockReviewList}">
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img
												src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
												class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="#" style="color: rgb(218, 0, 0);">${fn:substring(blockReview.rest_name,0,5) }...</a>
												</h4>
											</div>
											<div class="box-text">
												<span>${fn:substring(blockReview.rest_name,0,7) }...</span>
											</div>
											<div>
												<a href="#" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
										<div class="box-btn"
											style="text-align: center; margin-top: 10px;">
											<button class="btn btn-danger" id="w4"
												onmouseover="w4_mouseover()" onmouseout="w4_mouseout()">차단</button>
										</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="card gedf-card" style="margin-right: 30px;">
								<div class="box">
									<div>
										<img
											src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
											class="aaa">
									</div>
									<div class="card-body">
										<div class="box-title">
											<h4>
												<a href="#" style="color: rgb(218, 0, 0);">식당이름</a>
											</h4>
										</div>
										<div class="box-text">
											<span>간단한 리뷰 내용</span>
										</div>
										<div>
											<a href="#" style="color: rgb(218, 0, 0);">더보기</a>
										</div>
										<div class="box-btn"
											style="text-align: center; margin-top: 10px;">
											<button class="btn btn-danger" id="w4"
												onmouseover="w4_mouseover()" onmouseout="w4_mouseout()">차단</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="tab-pane fade" id="e">

						<div class="container" style="margin-top: 20px;">
							<div class="row">
							<c:forEach var="reportReview" items="${pageScope.profileReportReviewList}">
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img
												src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
												class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="#" style="color: rgb(218, 0, 0);">{fn:substring(reportReview.rest_name,0,7) }...</a>
												</h4>
											</div>
											<div class="box-text">
												<span>{fn:substring(reportReview.rest_name,0,7) }...</span>
											</div>
											<div>
												<a href="#" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
											<div class="box-text" style="margin-top: 5px;">
												<p>신고사유</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img
												src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
												class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="#" style="color: rgb(218, 0, 0);">식당이름</a>
												</h4>
											</div>
											<div class="box-text">
												<span>간단한 리뷰 내용</span>
											</div>
											<div>
												<a href="#" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
											<div class="box-text" style="margin-top: 5px;">
												<p>신고사유</p>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>



			<!-- 팔로잉 팔로워 -->
            <div class="col-md-3">
                <div class="card gedf-card">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title"><span
                                    style="color: rgb(218, 0, 0); margin-right: 15px;">Followers</span>${fn:length(pageScope.profileFollowerList)}</h4>
                        </div>
                        <div>
                            <table class="modal_table" style="top: 80px;">
                            <c:if test="${empty pageScope.profileFollowerList}">팔로우한 회원이 없습니다.</c:if>
                            <c:forEach var="follower" items="${pageScope.profileFollowerList}">
                                <tr>
                                    <td style="width:70px;"><a href="./profile.jsp?id=${follower.id}"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></a></td>
                                    <td id="modal_userID"><a href="./profile.jsp?id=${follower.id}">${follower.nick}</a></td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-outline-danger" style="margin-left: 20px;">팔로우</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card gedf-card">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title"><span
                                    style="color: rgb(218, 0, 0); margin-right: 15px;">Following</span>${fn:length(pageScope.profileFollowingList)}</h4>
                        </div>
                        <div>
                            <table class="modal_table" style="top: 80px;">
                            <c:if test="${empty pageScope.profileFollowingList}">팔로잉한 회원이 없습니다.</c:if>
                            <c:forEach var="following" items="${pageScope.profileFollowingList}">
                                <tr>
                                    <td style="width:70px;"><a href="./profile.jsp?id=${following.id}"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></a></td>
                                    <td id="modal_userID"><a href="./profile.jsp?id=${following.id}">${following.nick}</a></td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-danger" style="margin-left: 20px;">언팔로우</button>
                                    </td>
                                </tr>
							</c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
			<div class="container">
				<footer class="py-3 my-4">
					<ul class="nav justify-content-center border-bottom pb-3 mb-3">
						<li class="nav-item"><a href="#"
							class="nav-link px-2 text-body-secondary">Home</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link px-2 text-body-secondary">Features</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link px-2 text-body-secondary">Pricing</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link px-2 text-body-secondary">FAQs</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link px-2 text-body-secondary">About</a></li>
					</ul>
					<p class="text-center text-body-secondary">© 2023 Company, Inc</p>
				</footer>
			</div>
			<!-- 마우스 오버 스크립트 -->
			<script>
				function w1_mouseover() {
					w1.innerText = '스크랩 취소';
					w1.style.color = "rgb(218, 0, 0)";
					w1.style.background = "white";
				}

				function w1_mouseout() {
					w1.innerText = '스크랩';
					w1.style.color = "white";
					w1.style.background = "rgb(218, 0, 0)";
				}
			</script>

			<script>
				function w2_mouseover() {
					w2.innerText = '좋아요 취소';
					w2.style.color = "rgb(218, 0, 0)";
					w2.style.background = "white";
				}

				function w2_mouseout() {
					w2.innerText = '좋아요';
					w2.style.color = "white";
					w2.style.background = "rgb(218, 0, 0)";
				}
			</script>

			<script>
				function w3_mouseover() {
					w3.innerText = '싫어요 취소';
					w3.style.color = "rgb(218, 0, 0)";
					w3.style.background = "white";
				}

				function w3_mouseout() {
					w3.innerText = '싫어요';
					w3.style.color = "white";
					w3.style.background = "rgb(218, 0, 0)";
				}
			</script>

			<script>
				function w4_mouseover() {
					w4.innerText = '차단 취소';
					w4.style.color = "rgb(218, 0, 0)";
					w4.style.background = "white";
				}

				function w4_mouseout() {
					w4.innerText = '차단';
					w4.style.color = "white";
					w4.style.background = "rgb(218, 0, 0)";
				}
			</script>

			<script
				src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
			<script
				src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>

</html>