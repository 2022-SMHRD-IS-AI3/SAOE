<%@page import="com.saoe.model.RestaurantDAO"%>
<%@page import="com.saoe.model.RestaurantDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#map{ /*카카오맵을 담은 박스 API 정보 APP키 없음 아직 */
    width : 330px;
            height: 220px;
            outline : solid 4px rgb(249,63,76);
            display: inline-block;
        }
          
.rest_list{
    display: grid;
            grid-template-columns: [labels] auto [controls] 1fr; /*테두리*/
            grid-auto-flow: row;
            grid-gap: .8em;
            padding: 1.2em;
            background: rgba(236, 230, 231, 0.952);
            opacity: 0.9;
            border-radius: 8px;
            box-shadow: 1px 1px 1px 1px gray;   /*그림자 효과*/
            min-width: 400px; /* 최소 너비 */
 	max-width: 550px; /* 최대 너비 */
    border-spacing: 5px;

}
/* 식당 정보  */
.rest_info {
            grid-column: labels;
            grid-row: auto;
            text-align: center;
            background: rgb(249, 63, 76);
            color: #ffffff;
            border: 1px solid red;
            border-radius: 10px;
            width: 150px;
            box-shadow: 5px 5px 5px 5px rgb(172, 127, 127);
            height: 33px;


            /*  인풋태그 자동? */
        }

        /* 식당 내용 디테일  */
        .rest_detail{
            position: relative;
        left: 20px;
        box-shadow: 1px 1px 1px 1px rgb(172, 127, 127);
            
        }

        /* 반응박스? 식당 팔로우 좋아요 스타일. */
        .rest_react{    
            max-width: 600px;
            justify-content: space-between;
        }

        /* 버튼 박스  */
        .btn_st{
            grid-column: labels;
                    grid-row: auto;
                    text-align: center;
                    background: rgb(176, 176, 176);
                    color: #ffffff;
                    border-radius: 10px;
                    width: 150px;
                    box-shadow: 1px 1px 1px 1px rgb(172, 127, 127);
                    height: 30px;
                    min-width: 50px; /* 최소 너비 */
                    max-width: 130px; /* 최대 너비 */
        }

</style>

</head>
<body>
	<%
		int rest_no = Integer.parseInt(request.getParameter("rest_no"));
		RestaurantDTO rest = new RestaurantDAO().selectRest(rest_no);
	%>
	
	<table class="rest_list" border="1px solid black">
		<tr>
			<td class="rest_info">음식점 순번</td>
			<td class="rest_detail"><%=rest.getRest_no()%></td>
		</tr>
		<tr>
			<td class="rest_info">카테고리 순번</td>
			<td class="rest_detail"><%=rest.getRest_no()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 이름</td>
			<td class="rest_detail"><%=rest.getRest_name()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 프로필 사진</td>
			<td class="rest_detail"><%=rest.getRest_profile()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 번호</td>
			<td class="rest_detail"><%=rest.getRest_tel()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 주소</td>
			<td class="rest_detail"> 
                <div id="map" style="width:330px; height:220px;"></div>
                <script>
                    var container = document.getElementById('map');
                    var options = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667),
                        level: 3 };
                    var map = new kakao.maps.Map(container, options);
                </script>
                <br>
                <%=rest.getRest_addr()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 네이버 점수</td>
			<td class="rest_detail"><%=rest.getRest_naver_score()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 카카오 점수</td>
			<td class="rest_detail"><%=rest.getRest_kakao_score()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 구글 점수</td>
			<td class="rest_detail"><%=rest.getRest_google_score()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 내용</td>
			<td class="rest_detail"><%=rest.getRest_content()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 점수</td>
			<td class="rest_detail"><%=rest.getRest_score()%></td>
		</tr>
		<tr>
			<td class="rest_info">음식점 날짜</td>
			<td class="rest_detail"><%=rest.getRest_post_date()%></td>
		</tr>
	</table>
    <br>
    <div class="rest_react">
	<a href="FollowRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button class="btn_st">식당 팔로우</button></a>
	<a href="GBRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button class="btn_st">식당 좋아요</button></a>
	<a href="GBRestCon?rest_no=<%=rest.getRest_no()%>&state=-1"><button class="btn_st">식당 싫어요</button></a>
	<a href="BlockRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button class="btn_st">식당 차단</button></a>
</div>
	
	<%-- 기존 꺼
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
	<a href="BlockRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button>식당 차단</button></a> --%>
	
	
</body>
</html>