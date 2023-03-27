<%@page import="com.saoe.model.RestaurantDAO"%>
<%@page import="com.saoe.model.RestaurantDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int rest_no = Integer.parseInt(request.getParameter("rest_no"));
		RestaurantDTO rest = new RestaurantDAO().selectRest(rest_no);
	%>
	<table border="1px solid black">
		<tr>
			<td>음식점 순번 :</td>
			<td><%=rest.getRest_no()%></td>
		</tr>
		<tr>
			<td>카테고리 순번 :</td>
			<td><%=rest.getRest_no()%></td>
		</tr>
		<tr>
			<td>음식점 이름 :</td>
			<td><%=rest.getRest_name()%></td>
		</tr>
		<tr>
			<td>음식점 프로필 사진 :</td>
			<td><%=rest.getRest_profile()%></td>
		</tr>
		<tr>
			<td>음식점 번호 :</td>
			<td><%=rest.getRest_tel()%></td>
		</tr>
		<tr>
			<td>음식점 주소 :</td>
			<td><%=rest.getRest_addr()%></td>
		</tr>
		<tr>
			<td>음식점 네이버 점수 :</td>
			<td><%=rest.getRest_naver_score()%></td>
		</tr>
		<tr>
			<td>음식점 카카오 점수 :</td>
			<td><%=rest.getRest_kakao_score()%></td>
		</tr>
		<tr>
			<td>음식점 구글 점수 :</td>
			<td><%=rest.getRest_google_score()%></td>
		</tr>
		<tr>
			<td>음식점 내용 :</td>
			<td><%=rest.getRest_content()%></td>
		</tr>
		<tr>
			<td>음식점 점수 :</td>
			<td><%=rest.getRest_score()%></td>
		</tr>
		<tr>
			<td>음식점 날짜 :</td>
			<td><%=rest.getRest_post_date()%></td>
		</tr>
	</table>
	<a href="FollowRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button>식당 팔로우</button></a>
	<a href="GBRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button>식당 좋아요</button></a>
	<a href="GBRestCon?rest_no=<%=rest.getRest_no()%>&state=-1"><button>식당 싫어요</button></a>
	<a href="BlockRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button>식당 차단</button></a>
</body>
</html>