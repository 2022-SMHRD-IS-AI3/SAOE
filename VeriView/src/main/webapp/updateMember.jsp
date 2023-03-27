<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원 정보 수정 페이지
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
	</form>
</body>
</html>