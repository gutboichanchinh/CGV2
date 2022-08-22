<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="request" var="count" value="0"></c:set>
<c:if test="${listmovies == null}">
	<h1>Không có lịch chiếu</h1>
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
						<form action="${pageContext.request.contextPath}/viewseatchoice">
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