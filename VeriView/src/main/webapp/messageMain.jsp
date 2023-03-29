<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="com.saoe.model.MessageDAO"%>
<%@page import="com.saoe.model.MessageDTO"%>
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
    </style>
</head>

<body>
    <!-- 부트 스트랩 링크 start -->
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
    <!-- 부트스트랩 링크 end -->

    <!-- html start -->
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
                <form action="WriteReviewCon" method="post" enctype="multipart/form-data">
                    <hr width="100%">
                </form>

                <!-- 메시지 start -->
                <form class="message_main">
                    <a href="writeMessage.jsp"><button class="btn btn-outline-danger">쪽지 보내기</button></a>
                    <a href="main.jsp"><button class="btn btn-outline-danger">메인으로</button></a>
                    <br>

                    <table class="table table-striped table-hover ">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">보낸이</th>
                                <th scope="col">내용</th>
                                <th scope="col">시간 </th>
                                <th scope="col">삭제 </th>
                            </tr>
                        </thead>
                        <!-- 메세지 리스트 자리-->
                        <!-- 
    <%
for (MessageDTO msg : messageList) {
%>
    <%=msg.getSend_id() %>, 
    <%=msg.getReceive_id() %>, 
    <%=msg.getMessage_content() %>, 
    <%=msg.getMessage_date() %>, 
    <%=msg.getReview_no() %>
    <a href="DeleteMessageCon"><button class="btn btn-outline-danger">쪽지 삭제</button></a><br>
<%
}
%> -->
                        <tbody>
                            <!-- 메시지 리시트 for 문-->
                            <tr>
                                <% for (MessageDTO msg : messageList) { %>
                                    <th scope="row">
                                        <%= i%>,
                                    </th>
                                    <td>
                                        <%=msg.getSend_id() %>,
                                    </td>
                                    <td>
                                        <%=msg.getMessage_content() %>,
                                    </td>
                                    <td>
                                        <%=msg.getMessage_date() %>,
                                    </td>
                                    <th><a href="DeleteMessageCon"><button class="btn btn-outline-danger">쪽지
                                                삭제</button></a><br>
                                        <%< /th>
                                            }
                                            %>
                            </tr>
                        </tbody>
                    </table>
                    

                    <!-- 메시지 리스트 페이지?? -->
                    <a href=""><button type="button" class="btn btn-outline-danger">이전</button></a>
                    <a href=""><button type="button" class="btn btn-outline-danger">다음</button></a>
                </form>
                <!-- 메시지 end-->
            </div>
        </div>
    </div>
    </div>
</body>

</html>