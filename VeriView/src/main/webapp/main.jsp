<%@page import="com.saoe.model.MemberDTO"%>
<%@page import="com.saoe.model.ReviewDTO"%>
<%@page import="com.saoe.model.ReviewDAO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");

/* font-family: 'Abril Fatface', cursive;
font-family: 'Open Sans', sans-serif; */

        body {
            font-family: "Open Sans", sans-serif;
        }

        a {
            color: white;
            text-decoration: none;
        }

        section {
            text-align: center;
        }

        section>div {
            display: inline-block;
            background-color: rgb(222, 49, 49);
            padding: 0 30px;
            border-radius: 7px;
        }

        section>div>nav {
            display: inline-block;
        }

        section>div>nav>a {
            display: block;
            padding: 20px 10px 20px 10px;
            font-size: 20px;
        }

        section>div>nav>a:hover {
            background-color: white;
            color: black;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%
	MemberDTO member = (MemberDTO)session.getAttribute("member");
%>
    <section>
        <div>
            <nav><a href="#">피드</a></nav>
            <nav><a href="#">음식점</a></nav>
            <nav><a href="#">랭킹</a></nav>
            <nav><a href="messageMain.jsp">쪽지</a></nav>
            <nav><a href="mypage.jsp">마이페이지</a></nav>
            <nav><a href="LogoutCon">로그아웃</a></nav>
        </div>
    </section>
	<a href="writeReview.jsp"><button>리뷰작성</button></a>
	<a href="feed.jsp"><button>리뷰피드</button></a>	
	<a href="feedtest.jsp"><button>리뷰피드 테스트</button></a>	
	
	
</body>
</html>