<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.saoe.model.member.MemberDAO"%>
<%@page import="com.saoe.model.FeedDAO"%>
<%@page import="com.saoe.model.FeedDTO"%>
<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.ReplyDTO"%>
<%@page import="com.saoe.model.ReviewPicDTO"%>
<%@page import="com.saoe.model.ReviewDAO"%>
<%@page import="com.saoe.model.ReviewDTO"%>
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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"">

    <style>
        @import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");

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

        @media (min-width: 992px) {
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
		String id = request.getParameter("id");
		pageContext.setAttribute("id", id);
		MemberDAO m_dao = new MemberDAO();
		MemberDTO user = m_dao.selectMember(id);
		pageContext.setAttribute("user", user);
		
		ReviewDAO r_dao = new ReviewDAO();
		List<ReviewDTO> reviewList = r_dao.selectUserReview(id);
		pageContext.setAttribute("reviewList", reviewList);
		
		List<MemberDTO> followingList = m_dao.selectFollowingList(id);
		List<MemberDTO> followerList = m_dao.selectFollowerList(id);
		pageContext.setAttribute("followingList", followingList);
		pageContext.setAttribute("followerList", followerList);
		
	%>

 <!-- 프로필 시작 -->
    <div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <div class="media" style="text-align: center;">
                            <a class="thumbnail pull-left" href="#">
                                <img class="rounded-circle" width="80px" src="https://picsum.photos/50/50" alt="">
                            </a>
                        </div>
                        <div class="h4" style="height: 40px;">
                            <a href="#"
                                style="color: rgb(218, 0, 0); height: 50px; position: absolute; top: 120px;">@${pageScope.user.nick}</a>
                        </div>
                        <div class="h7 text-muted" style="height: 40px;">
       						<c:if test="${empty pageScope.user.profile_message}">@회원 코멘트가 없습니다.</c:if>
							<c:if test="${not empty pageScope.user.profile_message}">@${pageScope.user.profile_message}</c:if>
                        </div>
                        	<c:if test="${sessionScope.member.id eq pageScope.id}">
		                        <div class="h7" style="height: 80px;">
		                            <a href="#" style="color: rgb(218, 0, 0);">프로필 수정</a>
		                            <br>
		                            <a href="#" style="color: rgb(218, 0, 0);">회원 목록</a>
		                            <br>
		                            <a href="#" style="color: rgb(218, 0, 0);">리뷰 목록</a>
		                            <br>
		                            <a href="#" style="color: rgb(218, 0, 0);">음식점 목록</a>
		                        </div>
	                        </c:if>
                        
                        
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="h6 text-muted">Riview</div>
                            <div class="h5">1</div>
                        </li>
                        <c:choose>
	                        <c:when test="${sessionScope.member.id eq pageScope.id}">
								<li class="list-group-item">
		                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
		                                style="color: rgb(218, 0, 0);" onclick="location.href='LogoutCon'">
		                                로그아웃
		                            </button>
		                        </li>
	                        <li class="list-group-item">
	                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
	                                style="color: rgb(218, 0, 0);" onclick="location.href='#'">
	                                회원탈퇴
	                            </button>
	                        </li>
	                        </c:when>
	                        <c:otherwise>
	                        <li class="list-group-item">
	                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
	                                style="color: rgb(218, 0, 0);" onclick="location.href='BlockMemberCon?id=${pageScope.user.id}&state=1'">
	                                차단하기
	                            </button>
	                        </li>
	                        <li class="list-group-item">
	                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
	                                style="color: rgb(218, 0, 0);" onclick="location.href='ReportMemberCon?id=${pageScope.user.id}'">
	                                신고하기
	                            </button>
	                        </li>
	                        </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
            
                        <div class="col-md-6 gedf-main">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#a">팔로잉</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#b">팔로워</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#c">차단</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#d">신고</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="a">

                        <div class="container" style="margin-top: 20px;">
                            <div class="row">
                                <div class="col-12">
                                    <ul class="list-group">
										<%
											MemberDTO member = (MemberDTO)session.getAttribute("member");
											List<MemberDTO> myFollowingList = m_dao.selectFollowingList(member.getId());
											List<MemberDTO> myFollowerList = m_dao.selectFollowingList(member.getId());
											List<MemberDTO> myBlockList = m_dao.selectBlockList(member.getId());
											List<MemberDTO> myReportList = m_dao.selectReportList(member.getId());
											pageContext.setAttribute("myFollowingList", myFollowingList);
											pageContext.setAttribute("myFollowerList", myFollowerList);
											pageContext.setAttribute("myBlockList", myBlockList);
											pageContext.setAttribute("myReportList", myReportList);
										%>                    	
										<c:forEach var="myFollowing" items="${pageScope.myFollowingList}">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                                    src="https://picsum.photos/50/50"></td>
                                            닉네임 1
                                            <button class="btn btn-danger" id="w1" onmouseover="w1_mouseover()"
                                                onmouseout="w1_mouseout()">팔로우</button>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="b">

                        <div class="container" style="margin-top: 20px;">
                            <div class="row">
                                <div class="col-12">
                                    <ul class="list-group">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                                    src="https://picsum.photos/50/50"></td>
                                            닉네임 1
                                            <button class="btn btn-outline-danger">팔로우</button>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                                    src="https://picsum.photos/50/50"></td>
                                            닉네임 2
                                            <button class="btn btn-danger" id="w2" onmouseover="w2_mouseover()"
                                                onmouseout="w2_mouseout()">팔로우</button>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="tab-pane fade" id="c">

                        <div class="container" style="margin-top: 20px;">
                            <div class="row">
                                <div class="col-12">
                                    <ul class="list-group">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                                    src="https://picsum.photos/50/50"></td>
                                            닉네임 1
                                            <button class="btn btn-danger" id="w3" onmouseover="w3_mouseover()"
                                            onmouseout="w3_mouseout()">차단</button>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="d">
                        <div class="container" style="margin-top: 20px;">
                            <div class="row">
                                <div class="col-12">
                                    <ul class="list-group">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                                    src="https://picsum.photos/50/50"></td>
                                            닉네임 1
                                            <div>
                                                <span>신고사유</span>
                                            </div>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                                    src="https://picsum.photos/50/50"></td>
                                            닉네임 2
                                            <div>
                                                <span>신고사유</span>
                                            </div>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                                    src="https://picsum.photos/50/50"></td>
                                            닉네임 3
                                            <div>
                                                <span>신고사유</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

           
            <!-- 광고 배너 -->
            <div class="col-md-3">
                <div class="card gedf-card">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title"><span
                                    style="color: rgb(218, 0, 0); margin-right: 15px;">Followers</span>${pageScope.user.followingCnt}</h4>
                        </div>
                        <div>
                            <table class="modal_table" style="top: 80px;">
                            <c:if test="${empty pageScope.followerList}">팔로우한 회원이 없습니다.</c:if>
                            <c:forEach var="follower" items="${pageScope.followerList}">
                                <tr>
                                    <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></td>
                                    <td id="modal_userID">닉네임</td>
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
                                    style="color: rgb(218, 0, 0); margin-right: 15px;">Following</span>${pageScope.user.followerCnt}</h4>
                        </div>
                        <div>
                            <table class="modal_table" style="top: 80px;">
                            <c:if test="${empty pageScope.followingList}">팔로잉한 회원이 없습니다.</c:if>
                            <c:forEach var="follwing" items="${pageScope.followingList}">
                                <tr>
                                    <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></td>
                                    <td id="modal_userID">닉네임</td>
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
    <div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
    </ul>
    <p class="text-center text-body-secondary">© 2023 Company, Inc</p>
  </footer>
</div>
 <!-- 마우스 오버 스크립트 -->
    <script>
        function w1_mouseover() {
            w1.innerText = '팔로우 취소';
            w1.style.color = "rgb(218, 0, 0)";
            w1.style.background = "white";
        }

        function w1_mouseout() {
            w1.innerText = '팔로우';
            w1.style.color = "white";
            w1.style.background = "rgb(218, 0, 0)";
        }
    </script>

    <script>
        function w2_mouseover() {
            w2.innerText = '팔로우 취소';
            w2.style.color = "rgb(218, 0, 0)";
            w2.style.background = "white";
        }

        function w2_mouseout() {
            w2.innerText = '팔로우';
            w2.style.color = "white";
            w2.style.background = "rgb(218, 0, 0)";
        }
    </script>

    <script>
        function w3_mouseover() {
            w3.innerText = '차단 취소';
            w3.style.color = "rgb(218, 0, 0)";
            w3.style.background = "white";
        }

        function w3_mouseout() {
            w3.innerText = '차단';
            w3.style.color = "white";
            w3.style.background = "rgb(218, 0, 0)";
        }
    </script>
    
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>

</html>