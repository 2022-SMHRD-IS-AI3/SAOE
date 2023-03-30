<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
/* 		String id = request.getParameter("id");
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
 */		
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
                                style="color: rgb(218, 0, 0); height: 50px; position: absolute; top: 120px;">@닉네임</a>
                        </div>
                        <div class="h7 text-muted" style="height: 40px;">간단한 자기소개</div>
                        <div class="h7" style="height: 80px;">
                            <a href="#" style="color: rgb(218, 0, 0);">프로필 수정</a>
                            <br>
                            <a href="#" style="color: rgb(218, 0, 0);">회원 목록</a>
                            <br>
                            <a href="#" style="color: rgb(218, 0, 0);">리뷰 목록</a>
                            <br>
                            <a href="#" style="color: rgb(218, 0, 0);">음식점 목록</a>
                        </div>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="h6 text-muted">Riview</div>
                            <div class="h5">1</div>
                        </li>
                        <!-- <li class="list-group-item">
                            <div class="h6 text-muted"><a href="#" style="color: gray;">Followers</a></div>
                            <div class="h5">0</div>
                        </li>
                        <li class="list-group-item">
                            <div class="h6 text-muted"><a href="#" style="color: gray;">Following</a></div>
                            <div class="h5">0</div>
                        </li> -->
                        <li class="list-group-item">
                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
                                style="color: rgb(218, 0, 0);" onclick="location.href='./첫화면.html'">
                                로그아웃
                            </button>
                        </li>
                        <li class="list-group-item">
                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
                                style="color: rgb(218, 0, 0);" onclick="location.href='#'">
                                회원탈퇴
                            </button>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- <div class="col-md-6 gedf-main">
                - \\\\\\\Post1111111111111
                <div class="card gedf-card">

                    

                </div>
                Post /////
            </div> -->


            <div class="col-md-6 gedf-main">
                <div class="container">
                    <div class="row">
                        <div class="card gedf-card" style="margin-right: 30px;">
                            <div class="box">
                                <div>
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
                                        class="aaa">
                                </div>
                                <div class="card-body">
                                    <div class="box-title">
                                        <h4>식당이름</h4>
                                    </div>
                                    <div class="box-text">
                                        <span>간단한 리뷰 내용</span>
                                    </div>
                                    <div class="box-btn">
                                        <a href="#">더보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card gedf-card" style="margin-right: 30px;">
                            <div class="box">
                                <div>
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
                                        class="aaa">
                                </div>
                                <div class="card-body">
                                    <div class="box-title">
                                        <h4>식당이름</h4>
                                    </div>
                                    <div class="box-text">
                                        <span>간단한 리뷰 내용</span>
                                    </div>
                                    <div class="box-btn">
                                        <a href="#">더보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card gedf-card" style="margin-right: 30px;">
                            <div class="box">
                                <div>
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
                                        class="aaa">
                                </div>
                                <div class="card-body">
                                    <div class="box-title">
                                        <h4>식당이름</h4>
                                    </div>
                                    <div class="box-text">
                                        <span>간단한 리뷰 내용</span>
                                    </div>
                                    <div class="box-btn">
                                        <a href="#">더보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card gedf-card" style="margin-right: 30px;">
                            <div class="box">
                                <div>
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
                                        class="aaa">
                                </div>
                                <div class="card-body">
                                    <div class="box-title">
                                        <h4>식당이름</h4>
                                    </div>
                                    <div class="box-text">
                                        <span>간단한 리뷰 내용</span>
                                    </div>
                                    <div class="box-btn">
                                        <a href="#">더보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card gedf-card" style="margin-right: 30px;">
                            <div class="box">
                                <div>
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
                                        class="aaa">
                                </div>
                                <div class="card-body">
                                    <div class="box-title">
                                        <h4>식당이름</h4>
                                    </div>
                                    <div class="box-text">
                                        <span>간단한 리뷰 내용</span>
                                    </div>
                                    <div class="box-btn">
                                        <a href="#">더보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card gedf-card" style="margin-right: 30px;">
                            <div class="box">
                                <div>
                                    <img src="https://images.mypetlife.co.kr/content/uploads/2019/08/09153147/thomas-q-INprSEBbfG4-unsplash.jpg"
                                        class="aaa">
                                </div>
                                <div class="card-body">
                                    <div class="box-title">
                                        <h4>식당이름</h4>
                                    </div>
                                    <div class="box-text">
                                        <span>간단한 리뷰 내용</span>
                                    </div>
                                    <div class="box-btn">
                                        <a href="#">더보기</a>
                                    </div>
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
                                    style="color: rgb(218, 0, 0); margin-right: 15px;">Followers</span>0</h4>
                        </div>
                        <div>
                            <table class="modal_table" style="top: 80px;">
                                <tr>
                                    <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></td>
                                    <td id="modal_userID">닉네임</td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-outline-danger" style="margin-left: 20px;">팔로우</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></td>
                                    <td id="modal_userID">닉네임</td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-outline-danger" style="margin-left: 20px;">팔로우</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></td>
                                    <td id="modal_userID">닉네임</td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-outline-danger" style="margin-left: 20px;">팔로우</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card gedf-card">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title"><span
                                    style="color: rgb(218, 0, 0); margin-right: 15px;">Following</span>0</h4>
                        </div>
                        <div>
                            <table class="modal_table" style="top: 80px;">
                                <tr>
                                    <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></td>
                                    <td id="modal_userID">닉네임</td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-danger" style="margin-left: 20px;">언팔로우</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></td>
                                    <td id="modal_userID">닉네임</td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-danger" style="margin-left: 20px;">언팔로우</button>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width:70px;"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></td>
                                    <td id="modal_userID">닉네임</td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-danger" style="margin-left: 20px;">언팔로우</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>

</html>