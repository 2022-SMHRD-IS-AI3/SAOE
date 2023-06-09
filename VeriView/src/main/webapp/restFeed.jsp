<%@page import="com.saoe.model.member.MemberDAO"%>
<%@page import="com.saoe.model.member.ReviewMemberDTO"%>
<%@page import="com.saoe.model.member.RestMemberDTO"%>
<%@page import="com.saoe.model.member.MemberMemberDTO"%>
<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@page import="com.saoe.model.member.MemberMemberDAO"%>
<%@page import="com.saoe.model.category.CategoryDTO"%>
<%@page import="com.saoe.model.feed.FeedDAO"%>
<%@page import="com.saoe.model.feed.FeedDTO"%>
<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.reply.ReplyDTO"%>
<%@page import="com.saoe.model.review.ReviewPicDTO"%>
<%@page import="com.saoe.model.review.ReviewDAO"%>
<%@page import="com.saoe.model.review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"">
<script src="https://kit.fontawesome.com/6dc009df2e.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

* {
	box-sizing: border-box;
}

.h7 {
	font-size: 15px;
	color: rgb(218, 0, 0);
}

#img1{
   object-fit:contain;
}
#img2{
   object-fit:contain;
}


.gedf-wrapper {
	margin-top: 10px;
}

@media ( min-width : 992px) {
	.gedf-main {
		padding-left: 4rem;
		padding-right: 4rem;
	}
	.gedf-card {
		margin-bottom: 2.77rem;
	}
}

.fix-nav {
	position: sticky;
	top: 0;
	/* width: 100% */
	left: 0;
	right: 0;
	z-index: 2;

	/* 생략 */
}

/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}

</style>
</head>

<body>
	<!-- html 시작 -->

	<!-- header -->
	<c:import url="./layout/header.jsp"></c:import>
	<%
		int rest_no = Integer.parseInt(request.getParameter("rest_no"));
		
	
	
	MemberMemberDAO memberMemberDAO = new MemberMemberDAO();
	MemberDAO memberDAO = new MemberDAO();
	FeedDAO feedDAO = new FeedDAO();

	if (session.getAttribute("member") != null) {
		SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");
		
		List<MemberMemberDTO> memberMemberList = memberDAO.selectMemberMemberList(member.getId());
		List<RestMemberDTO> restMemberList = memberDAO.selectRestMemberList(member.getId());
		List<ReviewMemberDTO> reviewMemberList = memberDAO.selectReviewMemberList(member.getId());
		
		pageContext.setAttribute("memberMemberList", memberMemberList);
		pageContext.setAttribute("restMemberList", restMemberList);
		pageContext.setAttribute("reviewMemberList", reviewMemberList);

		int followerCnt = memberMemberDAO.selectFollowerCnt(member.getId());
		int followingCnt = memberMemberDAO.selectFollowingCnt(member.getId());
		pageContext.setAttribute("followerCnt", followerCnt);
		pageContext.setAttribute("followingCnt", followingCnt);

		List<FeedDTO> restFeedList = feedDAO.selectUserRestFeed(member.getId(), rest_no);
		pageContext.setAttribute("feedList", restFeedList);
	} else {
		List<FeedDTO> restFeedList = feedDAO.selectRestFeed(rest_no);
		pageContext.setAttribute("feedList", restFeedList);
	}
	%>

	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3">
				<c:if test="${not empty sessionScope.member}">
					<div class="card" style="position: fixed; width:25%;">
						<div class="card-body">
							<div class="row" height="80px">
								<div class="media" style="text-align: center;">
									<a class="thumbnail pull-left"
										href="profile.jsp?id=${sessionScope.member.id}"> <img
										class="rounded-circle" width="80px"
										src="https://picsum.photos/50/50" alt="">
									</a>
								</div>
							</div>
							<div class="row-fluid">
								<div class="h4" style="height: 40px;">
									<a href="profile.jsp?id=${sessionScope.member.id}" style="color: rgb(218, 0, 0); height: 50px; position: absolute; top: 120px;">
										@${sessionScope.member.getNick()}
									</a>
								</div>
								<div class="h7 text-muted" style="height: 40px;">
									<c:if test="${empty sessionScope.member.profile_message}">@회원 코멘트가 없습니다.</c:if>
									<c:if test="${not empty sessionScope.member.profile_message}">@${sessionScope.member.profile_message}</c:if>
								</div>
								<div class="h7">
									<a href="updateMember.jsp" style="color: rgb(218, 0, 0);">프로필 수정</a> <br> 
									<a href="profile.jsp?id=${sessionScope.member.id}" style="color: rgb(218, 0, 0);">My 목록</a> <br>
								</div>
							</div>
						</div>

						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="h6 text-muted">Followers</div>
								<div class="h5">${pageScope.followerCnt }</div>
							</li>
							<li class="list-group-item">
								<div class="h6 text-muted">Following</div>
								<div class="h5">${pageScope.followingCnt }</div>
							</li>
							<li class="list-group-item">
								<button class="btn btn-outline-danger" type="button"
									id="button-addon2" style="color: rgb(218, 0, 0);"
									onclick="location.href='/VeriView/LogoutCon'">로그아웃</button>
							</li>
						</ul>
					</div>
				</c:if>
				<c:if test="${empty sessionScope.member}">
					<div class="card">
						<div class="card-body">
							<div class="h5" style="height: 30px; color: rgb(218, 0, 0);">게스트</div>
							<div class="h7 text-muted" style="height: 40px;">로그인 후 이용해 주세요!</div>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<button class="btn btn-outline-danger" type="button"
									id="button-addon2" style="color: rgb(218, 0, 0);"
									onclick="location.href='./start.jsp'">로그인</button>
							</li>
							<li class="list-group-item">
								<button class="btn btn-outline-danger" type="button"
									id="button-addon2" style="color: rgb(218, 0, 0);"
									onclick="location.href='./start.jsp'">회원가입</button>
							</li>
						</ul>
					</div>
				</c:if>
			</div>

			<div class="col-md-6 gedf-main">
				<div class="row-fluid">
					<c:forEach var="feed" items="${pageScope.feedList}">
						<c:set var="followstate" value="0"/>
						<c:forEach var="memberMember" items="${pageScope.memberMemberList}">
							<c:if test="${memberMember.id eq feed.id}">
								<c:set var="followstate" value="${memberMember.member_follow_yn}"/>
							</c:if>
						</c:forEach>
					
						<c:set var="gbstate" value="0"/>
						<c:forEach var="reviewMember" items="${pageScope.reviewMemberList}">
							<c:if test="${reviewMember.review_no eq feed.review_no}">
								<c:set var="gbstate" value="${reviewMember.review_gb }"/>
							</c:if>
						</c:forEach>
						<!--- \\\\\\\Post1111111111111-->
						<div class="card gedf-card">
							<div class="card-header">
								<div class="d-flex justify-content-between align-items-center">
									<div class="d-flex justify-content-between align-items-center">
										<div class="mr-2">
											<img class="rounded-circle" width="45"
												src="https://picsum.photos/50/50" alt="">
										</div>
										<div class="ml-2">
											<div class="h5 m-0">
											<c:if test="${feed.id ne 'admin' }">
												<a href="./profile.jsp?id=${feed.id}" style="color: rgb(0, 0, 0);">
											</c:if>
												${feed.nick}</a> 
												<a href="javascript:void(0);" onclick="followMember('${feed.id}', this)" style="color: rgb(218, 0, 0);">
												<c:choose>
												<c:when test="${followstate eq 1}">
												<i class="fa fa-heart card-link actionBtn"></i>
												</c:when>
												<c:otherwise>
												<i class="fa fa-regular fa-heart card-link actionBtn"></i>
												</c:otherwise>
												</c:choose>
												
												</a>
											</div>
										</div>
									</div>
									<div>
										<div class="dropdown">
											<button class="btn btn-link dropdown-toggle" type="button"
												id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false" style="color: rgb(218, 0, 0);">
												<i class="fa fa-ellipsis-h" style="color: rgb(218, 0, 0);"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-right"
												aria-labelledby="gedf-drop1">
												<!-- <div class="h6 dropdown-header">Configuration</div> -->
												<a class="dropdown-item actionBtn" href="javascript:void(0);" onclick="scrapReview('${feed.review_no}', this)"
													style="color: rgb(218, 0, 0);">스크랩</a> 
												<a class="dropdown-item actionBtn" href="javascript:void(0);" onclick="reportReview('${feed.review_no}', this)"
													style="color: rgb(218, 0, 0);">신고</a> 
												<a class="dropdown-item actionBtn"  href="javascript:void(0);" onclick="blockReview('${feed.review_no}', this)"
													style="color: rgb(218, 0, 0);">게시물 차단</a>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div class="card-body">
								<div class="text-muted h7 mb-2">
									<i class="fa fa-clock-o"></i> ${feed.review_post_date} |
									${feed.review_update_date }
								</div>
								<a class="card-link" href="./restDetail.jsp?rest_no=${feed.rest_no}" style="color: rgb(218, 0, 0);">
									<h5 class="card-title">${feed.rest_name}</h5>
								</a>

								<p class="card-text">
                              <c:if test="${not empty feed.reviewPicList }">
								<div id="carouselExampleIndicators" class="carousel slide"
									data-ride="carousel">
									
									<ol class="carousel-indicators">
										<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
									</ol>
									
									<div class="carousel-inner" style="height: 600px">
                              <c:forEach var="reviewPic" items="${feed.reviewPicList}" varStatus="status">
                                 <c:choose>
                                       <c:when test="${status.index eq 0}">
                                       <div class="carousel-item active" style="background-color: black;height:100%;width: 100%;">                        
                                             <img id="img1" class="d-block w-100"
                                                src="${reviewPic.review_pic_src }"
                                                alt="First slide" style="max-height:100%; max-width:80%;transform: translate(-50%, -50%); position:absolute; top:50%;left:50%;">
                                       <!--  margin: auto; display: flex; justify-content: center;align-self:center; -->
                                       
                                       </div>
                                       </c:when>
                                       <c:otherwise>
                                       <div class="carousel-item" style="background-color: black; height:100%; width: 100%;">
                                             <img id="img2" class="d-block w-100"
                                                src="${reviewPic.review_pic_src}"
                                                alt="First slide" style="max-height:100%; max-width:80%;transform: translate(-50%, -50%); position:absolute; top:50%;left:50%;">
                                       </div>
                                       </c:otherwise>
                                 </c:choose>
                              </c:forEach>
                           </div>
									<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> 
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> 
									<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> 
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
                              </c:if>
								${feed.review_content}
								</p>
								<div>
									<span class="badge badge-danger">${feed.main_cate}</span> <span
										class="badge badge-danger">${feed.sub_cate}</span>
								</div>
							</div>
							<div class="card-footer">
								<a href="javascript:void(0);" onclick="like(${feed.review_no}, this)" class="card-link actionBtn" style="color: rgb(218, 0, 0);">
									<c:choose>
										<c:when test="${gbstate eq 1}">
											<i class="fa fa-thumbs-up" style="color: rgb(218, 0, 0);">취소</i> 
										</c:when>
										<c:otherwise>
											<i class="fa fa-regular fa-thumbs-up" style="color: rgb(218, 0, 0);">좋아요</i> 
										</c:otherwise>
									</c:choose>
								</a>
								<a href="javascript:void(0);" onclick="hate(${feed.review_no}, this)" class="card-link actionBtn" style="color: rgb(218, 0, 0);">
									<c:choose>
									<c:when test="${gbstate eq -1}">
									<i class="fa fa-thumbs-down" style="color: rgb(218, 0, 0);">취소</i>
									</c:when>
									<c:otherwise>
									<i class="fa fa-regular fa-thumbs-down" style="color: rgb(218, 0, 0);">싫어요</i>
									</c:otherwise>
									</c:choose>
								</a>
								<a href="#" class="card-link actionBtn" style="color: rgb(218, 0, 0);">
									<i class="fa fa-mail-forward" style="color: rgb(218, 0, 0);"></i>공유
								</a>
							</div>

							<div class="card mb-2">
								<div class="card-header bg-light" style="color: rgb(218, 0, 0);">
									<i class="fa fa-comment fa" style="color: rgb(218, 0, 0);"></i>
									댓글
								</div>
								<c:if test="${not empty sessionScope.member}">
									<div class="card-body">
										<form action="WriteReplyCon" method="post">
											<div class="form-group">
												<input type="hidden" name="review_no"
													value="${feed.review_no}"> <input type="hidden"
													name="parent_no" value="0">
												<textarea name="reply_content" class="form-control" rows="3"></textarea>
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
								</c:if>
							</div>

							<c:forEach var="reply" items="${feed.replyList}">
								<!-- Comment with nested comments-->
								<div class="card-body">
									<div class="media mb-4">
										<div class="mr-2">
											<img class="rounded-circle" width="45"
												src="https://picsum.photos/50/50" alt="">
										</div>
										<div class="media-body">
											<h5 class="mt-0">
												<a href="" style="color: rgb(0, 0, 0);"> ${reply.id} </a>
											</h5>
											${reply.reply_content}
											<c:forEach var="reply2" items="${feed.replyList}">
												<c:if test="${reply2.parent_no eq reply.reply_no}">
													<div class="media mt-4">
														<div class="mr-2">
															<img class="rounded-circle" width="45"
																src="https://picsum.photos/50/50" alt="">
														</div>
														<div class="media-body">
															<h5 class="mt-0">
																<a href="" style="color: rgb(0, 0, 0);">
																	${reply2.id} </a>
															</h5>
															${reply2.reply_content}
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- Post /////-->
					</c:forEach>
				</div>
			</div>
			<!-- 광고 배너 -->
			<div class="col-md-3" style="position: fixed; width:25%; left: 100%; transform: translateX( -100% );">
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">
							<a href="#">광고 배너</a>
						</h5>
						<h6 class="card-subtitle mb-2 text-muted">게시자</h6>
						<p class="card-text">광고 내용</p>
					</div>
				</div>
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
			</div>
		</div>
	</div>	

<script>
function like(review_no, elem) {

    if (($(elem).children().text() == '취소')) {
        $(elem).children().attr('class', 'fa fa-regular fa-thumbs-up');
        $(elem).children().text('좋아요');
        updateLikeReview(review_no, 0);
        
    } else if (($(elem).children().text() == '좋아요')) {
        $(elem).children().attr('class', 'fa-solid fa-thumbs-up');
        $(elem).children().text('취소');
        updateLikeReview(review_no, 1);
    }
}
function hate(review_no, elem){
	
    if (($(elem).children().text() == '취소')) {
        $(elem).children().attr('class', 'fa fa-regular fa-thumbs-down');
        $(elem).children().text('싫어요');
        updateLikeReview(review_no, 0);
    } else if (($(elem).children().text() == '싫어요')) {
        $(elem).children().attr('class', 'fa-solid fa-thumbs-down');
        $(elem).children().text('취소');
        updateLikeReview(review_no, -1);
    }
}

function updateLikeReview(review_no, state) {
    $.ajax({
        url: 'GBReviewCon',
        type: 'post',
        data: {
            review_no: review_no,
            state: state,
        },
        success: function () {
        	alert("리뷰 평가 성공");
        },
        error: function () {
			alert("리뷰 평가 실패");
        }
    });

}

function scrapReview(review_no, elem){
	if($(elem).text() == '스크랩'){
		$(elem).text('스크랩 취소');
		updateScrapReview(review_no, 1);
	}else if($(elem).text() == '스크랩 취소'){
		$(elem).text('스크랩');
		updateScrapReview(review_no, 0);
	}
}
function updateScrapReview(review_no, state){
    $.ajax({
        url: 'ScrapReviewCon',
        type: 'post',
        data: {
            review_no: review_no,
            state: state,
        },
        success: function () {
        	alert("리뷰 스크랩 성공");
        },
        error: function () {
			alert("리뷰 스크랩 실패");
        }
    });
}
function reportReview(review_no, elem){
	
	var review_rep_content = prompt('신고 사유를 입력해주세요');
	
	updateReportReview(review_no, review_rep_content);
	
	$(elem).parent().parent().parent().parent().parent().parent().remove();
}
function updateReportReview(review_no, review_rep_content){
	$.ajax({
        url: 'ReportReviewCon',
        type: 'post',
        data: {
            review_no: review_no,
            review_rep_content: review_rep_content,
        },
        success: function () {
        	alert("리뷰 신고 성공");
        },
        error: function () {
			alert("리뷰 신고 실패");
        }
    });
}

function blockReview(review_no, elem){
	$(elem).parent().parent().parent().parent().parent().parent().remove();
	
	updateBlockReview(review_no, 1);		
}
function updateBlockReview(review_no, state){
    $.ajax({
        url: 'BlockReviewCon',
        type: 'post',
        data: {
            review_no: review_no,
            state: state,
        },
        success: function () {
        	alert("리뷰 차단 성공");
        },
        error: function () {
			alert("리뷰 차단 실패");
        }
    });
	
}


function followMember(id, elem){
	
	if(($(elem).children().attr('class') == 'fa fa-regular fa-heart card-link actionBtn')){
		$(elem).children().attr('class', 'fa fa-heart card-link actionBtn');
		updateFollowMember(id, 1);
	}
	else if(($(elem).children().attr('class') == 'fa fa-heart card-link actionBtn')){
		$(elem).children().attr('class', 'fa fa-regular fa-heart card-link actionBtn');
		updateFollowMember(id, 0);
	}
	
}

function updateFollowMember(id, state) {_rest
    $.ajax({
        url: 'FollowMemberCon',
        type: 'post',
        data: {
            id: id,
            state: state,
        },
        success: function () {
        	alert("활동 성공");
        },
        error: function () {
			alert("활동 실패");
        }
    });

}

</script>

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