<%@page import="com.saoe.model.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원 정보 페이지
	<table border="1px solid black">
		<tr>
			<td>프사 :</td>
			<td>${sessionScope.member.profile}</td>
		</tr>
		<tr>
			<td>프로필 메시지 :</td>
			<td>${sessionScope.member.profile_message}</td>
		</tr>
		<tr>
			<td>아이디 :</td>
			<td>${sessionScope.member.id}</td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td>${sessionScope.member.pw}</td>
		</tr>
		<tr>
			<td>이름 :</td>
			<td>${sessionScope.member.name}</td>
		</tr>
		<tr>
			<td>별명 :</td>
			<td>${sessionScope.member.nick}</td>
		</tr>
		<tr>
			<td>전화번호 :</td>
			<td>${sessionScope.member.tel}</td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td>${sessionScope.member.addr}</td>
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
			<td>포인트 :</td>
			<td>${sessionScope.member.member_score}</td>
		</tr>
		<tr>
			<td>등급 :</td>
			<td>${sessionScope.member.grade}</td>
		</tr>
	</table>
	<a href="updateMember.jsp"><button>회원정보수정</button></a>
	${sessionScope.member.reviewMemberList}<br>
	${sessionScope.member.memberMemberList}<br>
	${sessionScope.member.restMemberList}<br>
</body>
</html>