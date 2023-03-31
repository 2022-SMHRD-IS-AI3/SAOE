<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="com.saoe.model.review.ReviewDTO"%>
<%@page import="com.saoe.model.review.ReviewDAO"%>
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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"">
<script src="https://kit.fontawesome.com/6dc009df2e.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
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
	<form action="DatalistCon" method="post" enctype="multipart/form-data">
		<input class="form-control" list="datalistOptions" id="input1" name="test" placeholder="Type to search...">
		<datalist id="datalistOptions">
			<option value="test1"></option>
		</datalist>
		<input type="submit">
	
	</form>
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
	
	<script>

		$(function() {
			$("#input1").keyup(function() {
				$.ajax({
					url : "AjaxTestCon",
					type : 'post',
					data : {
						searchWord : $('#input1').val()
					},
					timeout : 3000,
					success : function(data) {
						$("#datalistOptions").empty();
						let obj = JSON.parse(data);
						for (var i = 0; i < obj.length; i++) {
							$("#datalistOptions").append("<option value=\"" + obj[i].rest_no + "\">" + obj[i].rest_name + "</option>");
							console.log(obj[i].rest_no, obj[i].rest_name);
						}
					},
					error : function() {
						console.log("error");
					}
				})

			})
		})
		
		
	</script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>