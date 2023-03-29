<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 @import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");

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

        @media (min-width : 992px) {
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

        .user_edit_from_btn{
            justify-content: space-between;
			width: 100%;
        }
    </style>
</head>

<body>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <!-- html 시작 -->
    <div class="fix-nav" style="background-color: rgb(218, 0, 0); height: 70px;">
        <nav class="tab" style="padding: 10px;">
            <div class="header" style="float: left; margin-right: 50px; margin-left: 20px;">
                <a href="#" class="navbar-brand" style="color: white; font-size: 25px;">VeriView🍒</a>
            </div>
            <!-- navigator -->
            <div class="nav"
                style="height: 50px; float: left; display: flex; justify-content: center; align-items: center;">
                <a href="#" style="color: white; font-size: 20px; float: left; margin-right: 50px;">음식점</a>
                <a href="#" style="color: white; font-size: 20px; float: left; margin-right: 50px;">랭킹</a>
                <a href="#" style="color: white; font-size: 20px; float: left; margin-right: 50px;">쪽지</a>
            </div>
            <form class="form-inline" style="float: right; height: 50px;">
                <div class="input-group">
                    <input type="text" class="form-control">
                    <div class="input-group-append">
                        <button class="btn btn-outline-danger" type="button" id="button-addon2"
                            style="color: rgb(218, 0, 0);">
                            <i class="fa fa-search" style="color: white;"></i>
                        </button>
                    </div>
                </div>
            </form>
        </nav>
    </div>
    <div style="height: 60px; display: flex; justify-content: center; align-items: center;">
        <a href="#" style="margin-right: 30px; color: rgb(218, 0, 0); font-size: 20px;">새글</a>
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
                        <div class="h7 text-muted" style="height: 40px;">간단한 자기소개
                        </div>
                        <div class="h7" style="height: 100px;">
                            <a href="#" style="color: rgb(218, 0, 0);">프로필 수정</a>
                            <br> <a href="#" style="color: rgb(218, 0, 0);">My
                                목록</a> <br> <a href="#" style="color: rgb(218, 0, 0);">신고 목록</a> <br> <a href="#"
                                style="color: rgb(218, 0, 0);">회원탈퇴</a>
                        </div>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="h6 text-muted">Followers</div>
                            <div class="h5">${sessionScope.member.getFollowerCnt()}
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="h6 text-muted">Following</div>
                            <div class="h5">${sessionScope.member.getFollowingCnt()}
                            </div>
                        </li>
                        <li class="list-group-item">
                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
                                style="color: rgb(218, 0, 0);"
                                onclick="location.href='/VeriView/LogoutCon'">로그아웃</button>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6 gedf-main">
                <hr width="100%">
                <form action="" method="post">
                    <fieldset>
                <legend>회원정보수정</legend></fieldset>
                <br>
                <!-- 회원정보 수정 start -->
                    <!-- 비밀번호 변경-->
                    <div class="form-floating">
                        <label for="floatingPassword">비밀번호</label>
                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                    </div>
                    <!-- 비밀번호 변경확인-->
                    <label for="floatingPassword">비밀번호 확인</label>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                    </div>
                    <br>
                    <!-- 닉네임 입력-->
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="${sessionScope.member.nick}" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">닉네임만 변경</button>
                    </div>
                    <br>
                    <!-- 전화번호 입력-->
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="${sessionScope.member.tel}" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">전화번호만 변경</button>
                    </div>
                    <br>
                    <!-- 주소 입력-->
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="${sessionScope.member.addr}" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">주소만 변경</button>
                    </div>
                    <br>
                    <!-- 상태메시지 -->
                        <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">상태메시지만 변경</button>
                    </div>


                    
                    <br>
                    <div class="user_edit_from_btn">
                    <a href=""><button type="reset" class="btn btn-outline-danger"> 취소 </button></a>
                     <a href=""><button type="submit" class="btn btn-outline-danger" style="float: right;">회원정보 전체 수정</button></a>
                </div>
                </form>
                <!-- 회원정보 수정 end -->
            </div>
        </div>
    </div>
    </div>
</body>

</html>