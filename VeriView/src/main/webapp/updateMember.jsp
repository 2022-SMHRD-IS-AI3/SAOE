<%@page import="com.saoe.model.member.MemberDTO"%>
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
<title>Insert title here</title>
<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

.fix-nav {
	position: sticky;
	top: 0;
	/* width: 100% */
	left: 0;
	right: 0;
	z-index: 2;
	/* 생략 */
}

* {
	box-sm izing: border-box;
}

body {
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

.card-header {
	padding: 0.75rem 1.25rem;
	margin-bottom: 0;
	background-color: rgba(0, 0, 0, .03);
	border-bottom: 1px solid rgba(0, 0, 0, .125);
}

.user_edit_from_btn {
	justify-content: space-between;
	width: 100%;
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
		rel="stylesheet">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<!-- html 시작 -->

	<%
	SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");
	String id = member.getId();
	pageContext.setAttribute("id", id);

	ProfileDAO profileDAO = new ProfileDAO();
	ProfileDTO profile = profileDAO.selectProfile(id);
	
	MemberDTO updateMember = new MemberDAO().selectUpdateMember(member.getId());
	pageContext.setAttribute("updateMember", updateMember);

	List<ProfileFollowDTO> profileFollowerList = profileDAO.selectProfileFollower(id);
	List<ProfileFollowDTO> profileFollowingList = profileDAO.selectProfileFollowing(id);


	pageContext.setAttribute("profile", profile);
	pageContext.setAttribute("profileFollowerList", profileFollowerList);
	pageContext.setAttribute("profileFollowingList", profileFollowingList);
	%>


	<!-- header -->
	<c:import url="./layout/header.jsp"></c:import>

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
							<a href="./updateMember.jsp" style="color: rgb(218, 0, 0);">프로필
								수정</a> <br> <a href="./myUserList.jsp"
								style="color: rgb(218, 0, 0);">회원 목록</a> <br> <a
								href="./myReviewList.jsp" style="color: rgb(218, 0, 0);">리뷰
								목록</a> <br> <a href="./myRestList.jsp"
								style="color: rgb(218, 0, 0);">음식점 목록</a>
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
				<hr width="100%">
				<form action="" method="post">
					<fieldset>
						<legend>회원정보수정</legend>
					</fieldset>
					<hr width="100%">
					<br>
					<!-- 회원정보 수정 start -->
					<!-- 비밀번호 변경-->
					<div class="form-floating">
						<label for="floatingPassword">비밀번호</label> <input type="password"
							class="form-control" id="floatingPassword" placeholder="Password">
					</div>
					<!-- 비밀번호 변경확인-->
					<label for="floatingPassword">비밀번호 확인</label>
					<div class="form-floating">
						<input type="password" class="form-control" id="floatingPassword"
							placeholder="Password">
					</div>
					<br>
					<!-- 닉네임 입력-->
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="${pageScope.updateMember.nick}"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" style="width: 170px"
							type="button" id="button-addon2">닉네임만 변경</button>
					</div>
					<br>
					<!-- 전화번호 입력-->
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="${pageScope.updateMember.tel}"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" style="width: 170px"
							type="button" id="button-addon2">전화번호만 변경</button>
					</div>
					<br>
					<!-- 주소 입력-->
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="${pageScope.updateMember.addr}"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" style="width: 170px"
							type="button" id="button-addon2">주소만 변경</button>
					</div>
					<br>
					<!-- 상태메시지 -->
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="${pageScope.updateMember.profile_message}"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" style="width: 170px"
							type="button" id="button-addon2">상태메시지만 변경</button>
					</div>



					<br>
					<div class="user_edit_from_btn">
						<button type="reset" class="btn btn-outline-warning">취소</button>
						<a href=""><button type="submit"
								class="btn btn-outline-danger" style="float: right; width: 170;">회원정보
								전체 수정</button></a>
					</div>
				</form>
				<!-- 회원정보 수정 end -->
			</div>
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
		</div>
	</div>

</body>

</html>