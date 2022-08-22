<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>

<body class="container-fluid p-0">
	<div class="header container-fluid ">
		<div class="header-top row">
			<div class="header-top-left col-sm-5 ">Chọn Ngày Chiếu</div>
		</div>
		<div class="header-top row">
			<div class="header-top col-sm-2 "></div>
			<div class="header-top-month col-sm-8 ">Tháng 8</div>
		</div>
		<div class="header-bottom row p-0">
			<div class="null-col col-sm-1"></div>
			<div class="time-container col-sm-10 ">
				<div class="day-time">
					<label style="cursor: pointer;"> <input type="button"
						hidden="hidden" id="place1" name="aaaaa" value="0"
						onclick="showview(this)">
						<div class="day" id="date1"></div>
						<div class="time" id="day1"></div>
					</label>
				</div>
				<div class="day-time">
					<label style="cursor: pointer;"> <input type="button"
						hidden="hidden" id="place2" name="aaaaa" value="1"
						onclick="showview(this)">
						<div class="day" id="date2"></div>
						<div class="time" id="day2"></div>
					</label>
				</div>
				<div class="day-time">
					<label style="cursor: pointer;"> <input type="button"
						hidden="hidden" id="place3" value="2" onclick="showview(this)">
						<div class="day" id="date3"></div>
						<div class="time" id="day3"></div>
					</label>
				</div>
				<div class="day-time">
					<label style="cursor: pointer;"> <input type="button"
						hidden="hidden" id="place4" value="3" onclick="showview(this)">
						<div class="day" id="date4"></div>
						<div class="time" id="day4"></div>
					</label>
				</div>
				<div class="day-time">
					<label style="cursor: pointer;"> <input type="button"
						hidden="hidden" id="place5" value="4" onclick="showview(this)">
						<div class="day" id="date5"></div>
						<div class="time" id="day5"></div>
					</label>
				</div>
				<div class="day-time">
					<label style="cursor: pointer;"> <input type="button"
						hidden="hidden" id="place6" value="5" onclick="showview(this)">
						<div class="day" id="date6"></div>
						<div class="time" id="day6"></div>
					</label>
				</div>
				<div class="day-time">
					<label style="cursor: pointer;"> <input type="button"
						hidden="hidden" id="place7" value="6" onclick="showview(this)">
						<div class="day" id="date7"></div>
						<div class="time" id="day7"></div>
					</label>
				</div>
			</div>
		</div>
	</div>
	<div class="body container-fluid ">
		<div class="body-top row">
			<div class="body-top-left col-sm-5">Chọn Lịch Chiếu</div>
		</div>
		<div class="body-content" id="bodycontent">
			<c:set scope="request" var="count" value="0"></c:set>
			<c:if test="${listmovies == null}">
				<div>Không có lịch chiếu</div>
			</c:if>
			<c:if test="${listmovies != null}">
				<c:forEach items="${listmovies}" var="list">
				
				
					<div class="calendar-tag">
						<div class="movie-title">${list.name}</div>
						<div class="movie-img">
							<img class="img"
								src="data:image/jpg;base64,${linkanh.get(count).getImgString()}"
								alt="">
						</div>
						<div class="movie-calendar">
							<c:forEach items="${listshowtimes}" var="listshow">
								<c:if test="${list.id == listshow.idMovie}">
									<form
										action="${pageContext.request.contextPath}/viewseatchoice">
										<input name="idshow" value="${listshow.id}" type="hidden">
										<label style="cursor: pointer;">
											<button type="submit" hidden="hidden"></button>
											<div class="time-table">
												<div class="t-time">${listshow.time}</div>
												<c:forEach items="${rooms}" var="room">
													<c:if test="${listshow.roomId==room.id}">
														<div class="room">${room.roomName}</div>
													</c:if>
												</c:forEach>
											</div>
										</label>
									</form>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<c:set scope="request" var="count" value="${count+1}"></c:set>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<script>
		function sel(id) {
			var divs = document.getElementsByClassName('time'); //get all divs from div called container
			var divss = document.getElementsByClassName('selitem');
			for (var i = 0; i < divs.length; i++) {
				if (divs[i] != id) { //if not selected div set .items css
					divs[i].className = 'time';
				}
				id.className = 'selitem';
			}
			for (var i = 0; i < divss.length; i++) {
				if (divss[i] != id) { //if not selected div set .items css
					divss[i].className = 'time';
				}
			}
			//set different css for selected one
		}
	</script>
</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />
<script type="text/javascript" src="webjars/jquery/2.2.4/jquery.min.js"></script>
<script>
	var ngay = [ "Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6",
			"Thứ 7" ];
	var day = new Date();
	var nextDay = new Date(day);
	for (let index = 0; index < 7; index++) {
		nextDay.setDate(day.getDate() + index)
		console.log(ngay[nextDay.getDay()])
		document.getElementById("date" + (index + 1)).innerHTML = ngay[nextDay
				.getDay()];
		document.getElementById("day" + (index + 1)).innerHTML = nextDay
				.getDate();
		document.getElementById("day" + (index + 1)).value = index;
	}
</script>
<script>
	var a = '';
	function showview(e) {
		console.log(e)
		$.ajax({
			url : "/FinalMovieProject/viewshowtime2",
			type : "POST",
			data : {
				place : e.value
			},
			success : function(data) {
				document.getElementById("bodycontent").innerHTML = data

			}
		});
	}
</script>
</html>