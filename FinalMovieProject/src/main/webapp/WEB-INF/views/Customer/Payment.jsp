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
		<div class="cast-head">Thanh Toán</div>
		<div class="cast-body row">
			<div class="cast-body-left">
				<div class="thanh-noi-dung">
					<form>
						<fieldset class="border">
							<legend class="w-auto" style="font-size: 30px">Nội dung thanh toán</legend>
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
							<hr style="margin: 0 4%; background-color: white;">
							<div class="form-group row m-2">
								<h4 style="font-size: 120%; padding-top: 0px" for="staticEmail"
									class="col-3 col-form-label">Vé:</h4>
								<div class="col-8 row" style="margin: 0px; padding: 0px;">
									<p class="col-8" style="width: 12em; word-wrap: break-word;"
										id="staticEmailghe">${typeseat}</p>
									<div class="col-4">${count}.000Đ</div>
									<input type="hidden" value="${count}" id="price_seat">
								</div>
							</div>
							<div class="form-group row m-2">
								<h4 style="font-size: 120%; padding-top: 0px" for="staticEmail"
									class="col-3 col-form-label">Combo:</h4>
								<div class="col-8 row" style="margin: 0px; padding: 0px;">
									<p class="col-8" style="width: 12em; word-wrap: break-word;"
										id="staticEmailghe">${descrip}</p>
									<div class="col-4">${pricecombo}.000 Đ</div>
									<input type="hidden" value="${pricecombo}" id="price_food">
								</div>
							</div>
							<div class="form-group row m-2">
								<h4 style="font-size: 120%; padding-top: 0px" for="staticEmail"
									class="col-3 col-form-label">Tông giá:</h4>
								<div class=" col-8 row" style="margin: 0px; padding: 0px;">
									<p class="col-8" style="width: 9em; word-wrap: break-word;"></p>
									<div class="col-4" id="total_price"></div>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<div class="cast-body-right">
				<div class="cast-logo"
					style="font-family: Arial, Helvetica, sans-serif; color: white; width: 100%;">

					<c:if test="${status == 1}">
						<form action="${pageContext.request.contextPath}/sendpayment">
							<fieldset class="border ">
								<legend class="w-auto" style="font-size: 30px">Chọn phương thức thanh toán</legend>
								<div
									class="cast-logo-pay row mb-3 d-flex justify-content-center">
									<label class="logo-cast col-5"> <input type="radio"
										name="payment" id="" class="radio-pay" value="1"> <img
										src="resourses/IMG/logomomo.png" alt="" width="100%">
									</label> <label class="logo-cast col-5"> <input type="radio"
										name="payment" id="" class="radio-pay" value="2"> <img
										src="resourses/IMG/logovisa.png" alt="" width="100%">
									</label>
								</div>
							</fieldset>
							<div class="button-pay">
								<input type="hidden" value="${count}" name="subtotal"> <input
									type="hidden" value="${pricecombo}" name="fee"> <input
									type="hidden" value="${typeseat}" name="description"> <a
									class="col-4" style="text-decoration: none; background: white; color: black; text-align: center; border-radius: 50px; padding: 10px 0px;" href="${pageContext.request.contextPath}/viewseatchoice?idshow=${idshow.id}">Quay Lại Chọn Ghế Ngồi</a> <input type="submit"
									value="Tiếp Tục" class="col-4">
							</div>
						</form>
					</c:if>
					<c:if test="${status == 2}">
						<form action="${pageContext.request.contextPath}/excusepayment">
							<fieldset class="border">
								<legend class="w-auto" style="font-size: 30px">Check Thông Tin Tài Khoảng</legend>
								<table style="margin: 0 20px; border: none;">
									<tr style="margin: 30px">
										<td style="border: none">Description:</td>
										<td style="border: none">${transaction.description}</td>
									</tr>
									<tr>
										<td style="border: none">Total:</td>
										<td style="border: none">${transaction.amount.total}USD</td>
									</tr>
									<tr>
										<td colspan="2" style="border: none">
											<h3>Payer Information:</h3>
										</td>
									</tr>
									<tr>
										<td style="border: none">First Name:</td>
										<td style="border: none">${payer.firstName}</td>
									</tr>
									<tr>
										<td style="border: none">Last Name:</td>
										<td style="border: none">${payer.lastName}</td>
									</tr>
									<tr>
										<td style="border: none">Email:</td>
										<td style="border: none">${payer.email}</td>
									</tr>
								</table>
							</fieldset>
							<div class="button-pay">
								<input type="hidden" value="${count}" name="subtotal"> <input
									type="hidden" name="paymentId" value="${paymentId}" /> <input
									type="hidden" name="PayerID" value="${PayerID}" /><input
									type="hidden" value="${pricecombo}" name="fee"> <input
									type="hidden" value="${seatlist} ${typeseat}" name="seatdes">
								<input type="hidden" value="${descrip}" name="combodes"> <input
									type="hidden" value="${seatlist}" name="ticket"> <input
									type="hidden" value="${idshow.id}" name="idshow"> 
									<input
									type="hidden" value="${idshow.idMovie}" name="idmovie"> <a
									class="col-4" style="text-decoration: none; background: white; color: black; text-align: center; border-radius: 50px; padding: 10px 0px;" href="${pageContext.request.contextPath}/viewseatchoice?idshow=${idshow.id}">Quay Lại Chọn Ghế Ngồi</a> <input type="submit"
									value="Xác nhận" class="col-4">
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../Page/Footer.jsp" />

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