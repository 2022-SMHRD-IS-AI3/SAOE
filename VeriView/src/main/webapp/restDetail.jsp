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
         box-sizing: border-box;
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

      #map {
         /*카카오맵을 담은 박스 API 정보 APP키 없음 아직 */
         width: 330px;
         height: 220px;
         outline: solid 1px rgb(249, 63, 76);
         display: inline-block;

      }

      /* 식당 정보 폼*/
      .rest_list {
         opacity: 0.9;
         min-width: 100px;
         /* 최소 너비 */
         max-width: 550px;
         /* 최대 너비 */
         border-spacing: 5px;

      }

      .card-header {
         padding: 0.75rem 1.25rem;
         margin-bottom: 0;
         background-color: rgba(0, 0, 0, .03);
         border-bottom: 1px solid rgba(0, 0, 0, .125);
      }

      /* 식당 정보  */
      .rest_info {
         grid-row: auto;
         text-align: center;
         width: 150px;
         height: 33px;
      }

      /* 식당 내용 디테일  */
      .rest_detail {
         position: relative;
         left: 20px;

      }

      /* 반응박스? 식당 팔로우 좋아요 스타일. */
      .rest_react {
         justify-content: space-between;
         width: 100%;
      }

      /* 버튼 박스  */
      .btn_st {

         font-size: 15px;
         font-weight: 600;
         color: rgb(218, 0, 0);
         background-color: rgb(255, 255, 255);
         line-height: 0rem;
         text-align: center grid-row: auto;
         border-radius: 4px;
         width: 95px;
         height: 30px;
         min-width: 50px;
         max-width: 130px;
      }

      .rest_score {
         font-size: xx-small;
      }


      .rest_act_btn {
         justify-content: space-between;
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
            <form action="WriteReviewCon" method="post" enctype="multipart/form-data">
               <!--- \\\\\\\Post-->
               <div class="card gedf-card">
                  <div class="card-header">
                     <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="posts-tab" data-toggle="tab"
                              href="#posts" role="tab" aria-controls="posts" aria-selected="true">리뷰</a></li>

                     </ul>
                  </div>
                  <div class="card-body">
                     <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="posts" role="tabpanel"
                           aria-labelledby="posts-tab">
                           <div class="form-group">
                              <label class="sr-only" for="message">post</label>
                              <textarea name="review_content" class="form-control" id="message" rows="3"
                                 placeholder="리뷰를 작성해주세요!"></textarea>
                           </div>
                           <div class="form-group">
                              <div class="custom-file">
                                 <input type="file" class="custom-file-input" id="customFile" name="img">
                                 <label class="custom-file-label" for="customFile">Upload
                                    image</label>
                              </div>
                           </div>
                           <div class="btn-toolbar justify-content-between">
                              <div class="btn-group">
                                 <button type="submit" class="btn btn-outline-danger">업로드</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </form>

                           <!-- 피드에 뜨는 음식점 프로필 -->
               <form action="">
               <div class="card gedf-card">
                  <div class="card-header">
                     <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex justify-content-between align-items-center">
                           <div class="mr-2">
                              <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                           </div>
                           <div class="ml-2">
                              <div class="h5 m-0">
                                 <a href="" style="color: rgb(0, 0, 0);">
                                    <%=rest.getRest_name(i)%> 음식점이름
                                 </a>
                              </div>
                              <!-- <div class="h7 text-muted">Miracles Lee Cross</div> -->

                           </div>
                        </div>
                        <div>
                           <div class="dropdown">
                              <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1"
                                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                 style="color: rgb(218, 0, 0);">
                                 <i class="fa fa-ellipsis-h" style="color: rgb(218, 0, 0);"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                 <!-- <div class="h6 dropdown-header">Configuration</div> -->
                                 <a class="dropdown-item" href="#" style="color: rgb(218, 0, 0);">스크랩</a>
                                 <a class="dropdown-item" href="#" style="color: rgb(218, 0, 0);">신고</a>
                                 <a class="dropdown-item" href="#" style="color: rgb(218, 0, 0);">게시물
                                    차단</a>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>

                  <div class="card-body">

                     <div class="rest_cate">
                        <span class="badge badge-danger">한식</span>
                        <span class="badge badge-danger">중식</span>
                        <span class="badge badge-danger">일식</span>
                        <span class="badge badge-danger">카페</span>
                     </div>
                     <div class="text-muted h7 mb-2">
                        <i class="fa fa-clock-o"></i>10 min ago
                     </div>
                     <a class="card-link" href="#" style="color: rgb(62, 52, 52);">
                        <form object-fit: cover>
                           <hr width="100%">
                           <div>
                              음식점 대표 사진 <!-- 부트스트랩 슬라이드 -->
                              <div id="carouselExample" class="carousel slide">
                                 <div class="carousel-inner">
                                    <div class="carousel-item active">
                                       <img src="https://t1.kakaocdn.net/thumb/T800x0.q80/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Ffiy_reboot%2Fplace%2F2EF8DABB112949E1911AF9891E5B2F1F"
                                          class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                       <img src="https://t1.kakaocdn.net/thumb/T800x0.q80/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Ffiy_reboot%2Fplace%2F348DC23AD0EE409A895D73F3BF323CF8"
                                          class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                       <img src="https://t1.kakaocdn.net/thumb/T800x0.q80/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F202F393B4FCC601C3E"
                                          class="d-block w-100" alt="...">
                                    </div>
                                 </div>
                                 <button class="carousel-control-prev" type="button"
                                    data-bs-target="#carouselExample" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                 </button>
                                 <button class="carousel-control-next" type="button"
                                    data-bs-target="#carouselExample" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                 </button>
                              </div>
                              <!-- 여기까지 -->
                           </div>
                           <hr width="100%">
                           <td class="rest_score">음식점 점수</td>
                           <td>
                              <%=rest.getRest_score()%>
                           </td>
                           <br>
                           <!--  식당 좋아요 싫어요 번튼 -->
                           <div class="rest_act_btn">
                              <!-- 
                                <script> function rest_follow() {
                                 FollowRestCon?rest_no=<%=rest.getRest_no()%>&state= 1 } 
                              </script> -->
                              <button type="button" onclick="rest_follow();" class="btn btn-outline-danger">식당
                                 팔로우</button>

                                 <!-- <script> function rest_like(){
                                    GBRestCon?rest_no=<%=rest.getRest_no()%>&state= 1 }
                                    -->
                              <button type="button" onclick="rest_like();" class="btn btn-outline-danger">식당
                                 좋아요</button>

                                 <!-- <script> function rest_dislike(){
                                    GBRestCon?rest_no=<%=rest.getRest_no()%>&state= -1 }
                                    -->
                              <button type="button" onclick="rest_dislike();"
                                 class="btn btn-outline-danger">식당 싫어요</button>
                           
                              <!-- <script> function rest_block(){
                                    BlockRestCon?rest_no=<%=rest.getRest_no()%>&state=1 } -->
                              <button type="button" onclick="rest_block()" class="btn btn-outline-danger">식당
                                 차단</button>

                              <!--<%=rest.getRest_name()%> -->
                           </div>
                           <hr width="100%">
                           <br>

                           <table class="rest_list" object-fit: cover>
                              <tr>
                                 <td class="rest_info">업태 </td> <!-- 카테고리 순번-->
                                 <td class="rest_detail">
                                    <%=rest.getRest_no()%>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="rest_info">주소</td>
                                 <td class="rest_detail">
                                    <%=rest.getRest_addr()%>
                                 </td>
                              </tr>
                              </td>
                              <tr>
                                 <td class="rest_info">네이버 점수</td>
                                 <td class="rest_detail">
                                    <%=rest.getRest_naver_score()%>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="rest_info">카카오 점수</td>
                                 <td class="rest_detail">
                                    <%=rest.getRest_kakao_score()%>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="rest_info">음식점 내용</td>
                                 <td class="rest_detail">
                                    <%=rest.getRest_content()%>
                                 </td>
                              </tr>
                           </table>
                           <br>

                           <hr width="100%">
                           <div id="map" style=" width: 100%; height:220px;">카카오api 맵 <%=rest.getRest_addr()%>
                                 주소검색방식 </div>
                           <script type="text/javascript"
                              src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d380a4c2450d34abdf2a93857f8be93"></script>
                           <script>
                              var container = document.getElementById('map');
                              var options = {
                                 center: new kakao.maps.LatLng(33.450701, 126.570667),
                                 level: 3
                              };
                              var map = new kakao.maps.Map(container, options);
                           </script>
                        </form>
                        </p>

                        <!-- <div class="card-footer">  card_footer 박스에 식당 반응형 버튼 (팔로우, 좋아요, 싫어요, 차단)
                           <a href="FollowRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button
                                 class="btn_st">식당 팔로우</button></a>
                           <a href="GBRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button class="btn_st">식당
                                 좋아요</button></a>
                           <a href="GBRestCon?rest_no=<%=rest.getRest_no()%>&state=-1"><button
                                 class="btn_st">식당 싫어요</button></a>
                           <a href="BlockRestCon?rest_no=<%=rest.getRest_no()%>&state=1"><button
                                 class="btn_st">식당 차단</button></a>
                        </div> -->

                        <div class="card mb-2">
                           <div class="card-header bg-light" style="color: rgb(218, 0, 0);">
                              <i class="fa fa-comment fa" style="color: rgb(218, 0, 0);"></i>
                              댓글
                           </div>
                           <div class="card-body">
                              <form>
                                 <div class="form-group">
                                    <textarea class="form-control" rows="3"></textarea>
                                 </div>
                                 <div class="container">
                                    <div class="row">
                                       <div class="col text-center">
                                          <button class="btn btn-outline-danger" type="submit">작성</button>
                                       </div>
                                    </div>
                                 </div>
                              </form>
                           </div>
                        </div>

                        <!-- Single comment-->
                        <div class="card-body">
                           <div class="d-flex justify-content-between align-items-center">
                              <div class="d-flex justify-content-between align-items-center">
                                 <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50"
                                       alt="">
                                 </div>
                                 <div class="ml-2">
                                    <div class="h5 m-0">
                                       <a href="" style="color: rgb(0, 0, 0);">닉네임</a>
                                    </div>
                                    <h5 class="mt-0">댓글</h5>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </form>



                        <!-- 댓글 / 대댓글 
                  <div class="card-body">
                     <div class="media mb-4">
                        <div class="mr-2">
                           <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                        </div>
                        <div class="media-body">
                           <h5 class="mt-0">
                              <a href="" style="color: rgb(0, 0, 0);"> 닉네임
                              </a>
                           </h5>
                           댓글
                           <div class="media mt-4">
                              <div class="mr-2">
                                 <img class="rounded-circle" width="45" src="https://picsum.photos/50/50"
                                    alt="">
                              </div>
                              <div class="media-body">
                                 <h5 class="mt-0">
                                    <a href="" style="color: rgb(0, 0, 0);">
                                       닉네임 </a>
                                 </h5>
                                 대댓글 
                              </div>
                           </div>
                           <div class="media mt-4">
                              <div class="mr-2">
                                 <img class="rounded-circle" width="45" src="https://picsum.photos/50/50"
                                    alt="">
                              </div>
                              <div class="media-body">
                                 <h5 class="mt-0">
                                    <a href="" style="color: rgb(0, 0, 0);">
                                       닉네임 </a>
                                 </h5>
                                 대댓글
                              </div> 
                           </div>
                        </div>
                     </div>
                  </div> -->
                  </div>

               </div>
         </div>
      </div>
</body>

</html></html>