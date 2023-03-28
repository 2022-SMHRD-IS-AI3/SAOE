<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="./style.css">
<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

* {
	box-sizing: border-box;
}

body {
	padding: 100px;
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

@media ( min-width : 992px) {
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
</style>
</head>

<body>
<!-- html 시작 -->
	<div style="background-color: rgb(218, 0, 0); height: 70px;">
		<nav class="tab" style="padding: 10px;">
			<div class="header"
				style="float: left; margin-right: 50px; margin-left: 20px;">
				<a href="./feed.jsp" class="navbar-brand"
					style="color: white; font-size: 25px;">VeriView🍒</a>
			</div>

			<!-- navigator -->
			<div class="nav"
				style="height: 50px; float: left; display: flex; justify-content: center; align-items: center;">
				<a href="#"
					style="color: white; font-size: 20px; float: left; margin-right: 50px;">음식점</a>
				<a href="#"
					style="color: white; font-size: 20px; float: left; margin-right: 50px;">랭킹</a>
				<a href="messageMain.jsp"
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



	<div class="inner_body">
		<section class="create_projectnw">
			<div class="container">
				<div class="row justify-content-center">

					<div class="col-lg-12 col-sm-12">
						<div class="left_menubx">
							<div class="frame">
								<div id="sidepanel" class="sidepanel">
									<div id="profile">
										<div class="wrap">
											<img id="profile-img"
												src="http://emilcarlsson.se/assets/mikeross.png"
												class="online" alt="" />
											<p>Waris</p>
											<i class="fa fa-chevron-down expand-button"
												aria-hidden="true"></i>
											<div id="status-options">
												<ul>
													<li id="status-online" class="active"><span
														class="status-circle"></span>
														<p>Online</p></li>
													<li id="status-away"><span class="status-circle"></span>
														<p>Away</p></li>
													<li id="status-busy"><span class="status-circle"></span>
														<p>Busy</p></li>
													<li id="status-offline"><span class="status-circle"></span>
														<p>Offline</p></li>
												</ul>
											</div>
											<div id="expanded">
												<label for="twitter"><i class="fa fa-facebook fa-fw"
													aria-hidden="true"></i></label> <input name="twitter" type="text"
													value="mikeross" /> <label for="twitter"><i
													class="fa fa-twitter fa-fw" aria-hidden="true"></i></label> <input
													name="twitter" type="text" value="ross81" /> <label
													for="twitter"><i class="fa fa-instagram fa-fw"
													aria-hidden="true"></i></label> <input name="twitter" type="text"
													value="mike.ross" />
											</div>
										</div>
									</div>
									<div id="search">
										<label for=""><i class="fa fa-search"
											aria-hidden="true"></i></label> <input type="text"
											placeholder="Search contacts...">
									</div>
									<div id="contacts" class="chat_list contacts">
										<ul>
											<li class="contact">
												<div class="wrap">
													<span class="contact-status online"></span> <img
														src="http://emilcarlsson.se/assets/louislitt.png" alt="">
													<div class="meta">
														<p class="name">
															Imtiyaz <span class="date">Apr 20</span>
														</p>
														<p class="preview">You just got LITT up, Mike.</p>
													</div>
												</div>
											</li>
											<li class="contact active">
												<div class="wrap">
													<span class="contact-status busy"></span> <img
														src="http://emilcarlsson.se/assets/harveyspecter.png"
														alt="">
													<div class="meta">
														<p class="name">
															Rishal Raza<span class="date">Apr 20</span>
														</p>
														<p class="preview">Wrong. You take the gun, or you
															pull out a bigger one. Or, you call their bluff. Or, you
															do any one of a hundred and forty six other things.</p>
													</div>
												</div>
											</li>
											<li class="contact">
												<div class="wrap">
													<span class="contact-status away"></span> <img
														src="http://emilcarlsson.se/assets/rachelzane.png" alt="">
													<div class="meta">
														<p class="name">
															Shoaib <span class="date">Apr 20</span>
														</p>
														<p class="preview">I was thinking that we could have
															chicken tonight, sounds good?</p>
													</div>
												</div>
											</li>
											<li class="contact">
												<div class="wrap">
													<span class="contact-status online"></span> <img
														src="http://emilcarlsson.se/assets/donnapaulsen.png"
														alt="">
													<div class="meta">
														<p class="name">
															Dilshad <span class="date">Apr 20</span>
														</p>
														<p class="preview">Mike, I know everything! I'm
															Donna..</p>
													</div>
												</div>
											</li>
											<li class="contact">
												<div class="wrap">
													<span class="contact-status busy"></span> <img
														src="http://emilcarlsson.se/assets/jessicapearson.png"
														alt="">
													<div class="meta">
														<p class="name">
															Dilnawaz <span class="date">Apr 20</span>
														</p>
														<p class="preview">Have you finished the draft on the
															Hinsenburg deal?</p>
													</div>
												</div>
											</li>
											<li class="contact">
												<div class="wrap">
													<span class="contact-status"></span> <img
														src="http://emilcarlsson.se/assets/haroldgunderson.png"
														alt="">
													<div class="meta">
														<p class="name">
															Asif Ali <span class="date">Apr 20</span>
														</p>
														<p class="preview">Thanks Mike! :)</p>
													</div>
												</div>
											</li>
											<li class="contact">
												<div class="wrap">
													<span class="contact-status"></span> <img
														src="http://emilcarlsson.se/assets/danielhardman.png"
														alt="">
													<div class="meta">
														<p class="name">
															Shahbabu <span class="date">Apr 20</span>
														</p>
														<p class="preview">We'll meet again, Mike. Tell
															Jessica I said 'Hi'.</p>
													</div>
												</div>
											</li>
											<li class="contact">
												<div class="wrap">
													<span class="contact-status busy"></span> <img
														src="http://emilcarlsson.se/assets/katrinabennett.png"
														alt="">
													<div class="meta">
														<p class="name">
															Bushra Naaz <span class="date">Apr 20</span>
														</p>
														<p class="preview">I've sent you the files for the
															Garrett trial.</p>
													</div>
												</div>
											</li>
											<li class="contact">
												<div class="wrap">
													<span class="contact-status"></span> <img
														src="http://emilcarlsson.se/assets/charlesforstman.png"
														alt="">
													<div class="meta">
														<p class="name">
															Charles Forstman <span class="date">Apr 20</span>
														</p>
														<p class="preview">Mike, this isn't over.</p>
													</div>
												</div>
											</li>
											<li class="contact">
												<div class="wrap">
													<span class="contact-status"></span> <img
														src="http://emilcarlsson.se/assets/jonathansidwell.png"
														alt="">
													<div class="meta">
														<p class="name">
															Jonathan Sidwell <span class="date">Apr 20</span>
														</p>
														<p class="preview">
															<span>You:</span> That's bullshit. This deal is solid.
														</p>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<!--                                    <div id="bottom-bar">
                                                                            <button id="addcontact"><i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>Add contact</span></button>
                                                                            <button id="settings"><i class="fa fa-cog fa-fw" aria-hidden="true"></i> <span>Settings</span></button>
                                                                        </div>-->
								</div>
								<div class="content">
									<div class="contact-profile">
										<img src="http://emilcarlsson.se/assets/harveyspecter.png"
											alt="">
										<p>Harvey Specter</p>
										<div class="social-media camera">
											<a href="#" class="video_call"> <i
												class="fa fa-video-camera m-0" aria-hidden="true"></i>
											</a> <a href="#" class="common-btn"> View Profile </a>
										</div>
									</div>
									<div class="messages">
										<ul>
											<li class="sent"><img
												src="http://emilcarlsson.se/assets/mikeross.png" alt="">
												<p>How the hell am I supposed to get a jury to believe
													you when I am not even sure that I do?!</p> <span
												class="msg_time">8:40 AM, Today</span></li>
											<li class="replies"><img
												src="http://emilcarlsson.se/assets/harveyspecter.png" alt="">
												<p>When you're backed against the wall, break the god
													damn thing down.</p> <span class="msg_time">8:40 AM,
													Today</span></li>
											<li class="replies"><img
												src="http://emilcarlsson.se/assets/harveyspecter.png" alt="">
												<p>Excuses don't win championships.</p> <span
												class="msg_time">8:40 AM, Today</span></li>
											<li class="sent"><img
												src="http://emilcarlsson.se/assets/mikeross.png" alt="">
												<p>Oh yeah, did Michael Jordan tell you that?</p> <span
												class="msg_time">8:40 AM, Today</span></li>
											<li class="replies"><img
												src="http://emilcarlsson.se/assets/harveyspecter.png" alt="">
												<p>No, I told him that.</p> <span class="msg_time">8:40
													AM, Today</span></li>
											<li class="replies"><img
												src="http://emilcarlsson.se/assets/harveyspecter.png" alt="">
												<p>What are your choices when someone puts a gun to your
													head?</p> <span class="msg_time">8:40 AM, Today</span></li>
											<li class="sent"><img
												src="http://emilcarlsson.se/assets/mikeross.png" alt="">
												<p>What are you talking about? You do what they say or
													they shoot you.</p> <span class="msg_time">8:40 AM,
													Today</span></li>
											<li class="replies"><img
												src="http://emilcarlsson.se/assets/harveyspecter.png" alt="">
												<p>Wrong. You take the gun, or you pull out a bigger
													one. Or, you call their bluff. Or, you do any one of a
													hundred and forty six other things.</p> <span class="msg_time">8:40
													AM, Today</span></li>
										</ul>
									</div>
									<div class="message-input">
										<div class="wrap">
											<input type="text" placeholder="Write your message...">
											<i class="fa fa-paperclip attachment" aria-hidden="true"></i>
											<button class="submit">
												<i class="fa fa-paper-plane" aria-hidden="true"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>



</body>

</html>