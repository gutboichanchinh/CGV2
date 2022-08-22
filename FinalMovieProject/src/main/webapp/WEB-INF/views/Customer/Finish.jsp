<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>CGV2.0 Cinema</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resourses/IMG/logo.png" rel="icon">
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Bangers&display=swap"
	rel="stylesheet">
<!--CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link href="${pageContext.request.contextPath}/resourses/CSS/CSS.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resourses/CSS/login.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resourses/Font/font.css"
	rel="stylesheet">
<link
	href="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/css/bootstrap-multiselect.css"
	rel="stylesheet" />
</head>

<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/HeaderBT4.jsp" />
<body>
	<div class="container cast">
		<div class="cast-head">Thanh Toán Thành Công</div>
		<div class="cast-body row">
			<div class="cast-body-left">
				<div class="thanh-noi-dung">
					<form>
						<fieldset class="border">
							<legend class="w-auto">Nội dung thanh toán</legend>
							<div>
								<c:forEach items="${listmovie}" var="movie">
									<c:if test="${movie.id == idshow.idMovie }">
										<div class="name-movie">${movie.name}</div>
									</c:if>
								</c:forEach>
							</div>
							<div class="form-group row">
								<div class="col m-2">
									<h4 style="font-family:">Tên Phòng :</h4>
									<div class="title-title">
										<c:forEach items="${roomlist}" var="room">
											<c:if test="${room.id == idshow.roomId}">
												<p style="width: 8em; word-wrap: break-word;">${room.roomName}</p>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<div class="col m-2">
									<h4>Số vé :</h4>
									<div class="title-title">
										<p style="width: 8em; word-wrap: break-word;">${seatlist}</p>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col m-2">
									<h4>Ngày :</h4>
									<div class="title-title">
										<p style="width: 8em; word-wrap: break-word;">${day}</p>
									</div>
								</div>
								<div class="col m-2">
									<h4>Giờ :</h4>
									<div class="title-title">
										<p style="width: 8em; word-wrap: break-word;">${idshow.time}</p>
									</div>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<div class="cast-body-right">
				<div class="cast-logo"
					style="font-family: Arial, Helvetica, sans-serif; color: white; width: 100%;">
					<form action="${pageContext.request.contextPath}/home">
						<fieldset class="border ">
							<legend class="w-auto">QR Code</legend>
							<div class="cast-logo-pay row mb-3 d-flex justify-content-center">
								<label class="logo-cast col-6"><img
									src="data:image/jpg;base64,${imagebase}" alt="" width="100%">
								</label>
							</div>
							<div class="d-flex justify-content-center mb-3">
								<div>Đưa mã này cho nhân viên soát vé tại rạp phim</div>
							</div>
						</fieldset>
						<div class="button-pay">
							<input type="hidden" value="${count}" name="subtotal"> <input
								type="hidden" value="${pricecombo}" name="fee"> <input
								type="hidden" value="${typeseat}" name="description"><input type="submit" value="Về Trang Chủ"
								class="col-4">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<footer>
	<div class="container">
		<div class="row content1">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12  ">

				<img id="logo-footer" class="img-responsive"
					src="resourses/IMG/logo.png" width="70%" height="50%" alt="">
				<h2>Tầng 2, Tòa nhà F-Complex, Đường Nam Kì Khởi Nghĩa, Ngũ
					Hành Sơn, Đà Nẵng</h2>

			</div>

			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 marg-left100 ">
				<h1>CGV2.0 CINEMA</h1>
				<ul class="list">
					<li><a href="#">Giới thiệu</a></li>
					<li><a href="#">Liên Hệ</a></li>
					<li><a href="#">Điều khoản</a></li>
				</ul>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6  ">
				<h1>Chăm sóc khách hàng</h1>
				<ul>
					<li class="inf"><span>HOTLINE: 1900 9999</span></li>
					<li class="inf"><span>Giờ Hoạt Động: 8AM- 12PM</span></li>
					<li class="inf"><span>Gmail: CGV2.0@gmail.com.vn</span></li>
				</ul>
			</div>
		</div>
		<div class="icon">
			<div class="row">
				<div class="map col-md-6">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.674141297034!2d108.25988381480666!3d15.97838458893712!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314210f2d038af0f%3A0x51c64b1130497f99!2zRlBUIENvbXBsZXggxJDDoCBO4bq1bmc!5e0!3m2!1svi!2s!4v1653635425564!5m2!1svi!2s"
						style="border: 0;" allowfullscreen="" loading="lazy"
						referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
				<div class="icon-logo col-md-6">
					<div class="iconn">
						<a id="fb_show" href="#"> <img id="fb" class="show"
							src="resourses/IMG/icon_facebook.png" alt=""> <img
							id="fb_hover" class="hide"
							src="resourses/IMG/icon_facebook_hover.png" alt="">

						</a> <a id="fb_show" href="#"> <img id="fb" class="show"
							src="resourses/IMG/icon_instagram.png" alt=""> <img
							id="fb_hover" class="hide"
							src="resourses/IMG/icon_instagram_hover.png" alt="">

						</a> <a id="fb_show" href="#"> <img id="fb" class="show"
							src="resourses/IMG/icon_youtube.png" alt=""> <img
							id="fb_hover" class="hide"
							src="resourses/IMG/icon_youtube_hover.png" alt="">

						</a>
					</div>
					<div class="version">
						<span class="left col-sm-6"> Phát triển bởi sinh viên FPT.
						</span> <span class="right col-sm-6"> Bản quyền CGV2.0 Đà Nẵng. </span>
					</div>
				</div>
			</div>
		</div>

	</div>


</footer>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
	integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
	crossorigin="anonymous"></script>
<!--    <script>
$(window).on('wrapper',function(event){
$('body').removeClass('preloading');
$('.wrapper').delay(1000).fadeOut('fast');
});
</script>-->

<script>
	var loader = document.getElementById("wrapper");
	window.addEventListener("load", setTimeout(function() {
		loader.style.display = "none";

	}, 1500));
</script>
<script>
	var a = parseInt(document.getElementById("price_food").value);
	var b = parseInt(document.getElementById("price_seat").value);
	var c = 0;
	c = a + b
	document.getElementById("total_price").innerHTML = c + ".000 Đ"
</script>

<script
	src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
<script
	src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-7549a40147ccd0ba0a6b5373d87e770e49bb4689f1c2dc30cccc7463f207f997.js"></script>
<script
	src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>
<script
	src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</html>