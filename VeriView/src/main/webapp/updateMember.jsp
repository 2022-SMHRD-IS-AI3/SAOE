<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

      .myForm {
        display: grid;
        grid-template-columns: [labels] auto [controls] 1fr;
        grid-auto-flow: row;
        grid-gap: .8em;
        padding: 1.2em;
        background: rgba(236, 230, 231, 0.952);
        opacity: 0.9;
        border-radius: 10px;
        box-shadow: 1px 1px 1px 1px gray;

    }

    /* 라벨링 , 색깔 흰색글씨, 배경 빨간색, 테두리 border-radius: 10px */
    .myForm>label {
        grid-column: labels;
        grid-row: auto;
        text-align: center;
        background: rgb(249, 63, 76);
        color: #ffffff;
        border: 1px solid red;
        border-radius: 10px;
        width: 150px;
        box-shadow: 5px 5px 5px 5px rgb(172, 127, 127);

        /*  인풋태그 자동? */
    }

    .myForm>input {
        grid-column: controls;
        grid-row: auto;
        box-shadow: 5px 5px 5px 5px gray;

    }

    .myForm>button {
        grid-column: span 2;
        background-color: rgb(249, 63, 76);
        color: #ffffff;
        border: 1px solid red;
        border-radius: 10px;
        box-shadow: 1px 1px 1px 1px gray;

    }

    .myForm {
        border-color: #0982f0;
        outline: none;
    }

    .submit1 {
        font-size: large;
    }

    .editUserlengend {
        color: #f58c8cf1;
        font-size: large;
        grid-row: auto;
        text-align: center;
        font-weight: bolder;
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
							<a href="#" style="color: rgb(218, 0, 0);">@닉네임</a>
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
							<div class="h5">0</div>
						</li>
						<li class="list-group-item">
							<div class="h6 text-muted">Following</div>
							<div class="h5">0</div>
						</li>
						<li class="list-group-item">
							<button class="btn btn-outline-danger" type="button"
								id="button-addon2" style="color: rgb(218, 0, 0);"
								onclick="location.href='/VeriView/LogoutCon'">로그아웃</button>
						</li>
					</ul>
				</div>
			</div>
			<!--  여기까지 기존 form -->
			
			<!--  여기서부터 회원 정보 form 으로 작성  -->
			<div class="col-md-6 gedf-main">
                <form class="myForm" action="" method="post">
                    <div class="editUserlengend">
                        <legend>회원정보 페이지</legend>
    
                    </div>
                    <label for="id"> 아이디 </label>
                    <input type="text" name="id" id="id" value="${sessionScope.member.id}"disabled>
                    <!-- disabled 넣으면 전달 -->
    
                    <label for="pw"> 비밀번호 </label>
                    <input type="password" name="pw" id="pw" required>
                    <label for="pw"> 비밀번호 확인 </label>
                    <input type="password" name="pw" id="pw" required>
    
                    <!-- 회원 닉네임-->
                    <label for="nick"> 닉네임 </label>
                    <input type="text" name="nick" id="nick" value="${sessionScope.member.nick}"> <!-- ${nick} 닉네임 넣으면 폰트가 안이쁨. 폰트-->
    
                    <!-- 회원 전화번호 값을 -->
                    <label for="tel"> 전화번호 </label>
                    <input type="text" name="tel" id="tel" value="${sessionScope.member.tel}"> <!-- ${tel}  폰트가 안이쁨. 폰트-->
    
                    <!-- 회원 주소-->
                    <label for="addr"> 주소 </label>
                    <input type="text" name="addr" id="addr" value="${sessionScope.member.addr}"> <!-- ${addr} -->
    
                    <!-- 상태메세지 -->
                    <label for="profile_message"> 상태메세지 </label>
                    <input type="text" name="profile_message" id="profile_message" value=""> <!-- -->
    
                    <br>
    
                    <button type="submit"> 회원정보 수정완료 </button>
                    <button type="reset"> 취소 </button>
    
               </form>
                
                
	<%-- 회원 정보 수정 페이지
	<form action="UpdateMemberCon" method="post">
		<table border="1px solid black">
			<tr>
				<td>프사 :</td>
				<td>${sessionScope.member.profile}</td>
			</tr>
			<tr>
				<td>프로필 메시지 :</td>
				<td><input type="text" name="profile_message"
					value="${${sessionScope.member.profile_message}}"></td>
			</tr>
			<tr>
				<td>아이디 :</td>
				<td>${sessionScope.member.id}</td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td>${sessionScope.member.name}</td>
			</tr>
			<tr>
				<td>별명 :</td>
				<td><input type="text" name="nick"
					value="${sessionScope.member.nick}"></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><input type="text" name="tel"
					value="${sessionScope.member.tel}"></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><input type="text" name="addr"
					value="${sessionScope.member.addr}"></td>
			</tr>
			<tr>
				<td>생년월일 :</td>
				<td>${sessionScope.member.birth}</td>
			</tr>
			<tr>
				<td>성별 :</td>
				<td>${sessionScope.member.gender}</td>
			</tr>
			<tr>
				<td><input type="submit" value="수정하기"></td>
				<td><input type="reset"></td>
			</tr>
		</table>
	</form> --%>
	
</body>
</html>