<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script
	src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<!-- <body class="preloading"> -->
<!-- 	<!------------ Loading --------------->
-->
<!-- 	<div id="wrapper"> -->
<!-- 		<!--        <div class="row">-->
-->
<!-- 		<div class="spinner-box "> -->
<!-- 			<div class="leo-border-1"> -->
<!-- 				<div class="leo-core-1"></div> -->
<!-- 			</div> -->
<!-- 			<div class="leo-border-2"> -->
<!-- 				<div class="leo-core-2"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<!--        </div>-->
-->
<!-- 	</div> -->
<!-- 	<div id='stars'></div> -->
<!-- 	<div id='stars2'></div> -->
<!-- 	<div id='stars3'></div> -->
<body>
	<div class="container">
		<div class="editmovie">
			<form:form modelAttribute="roomform" method="post" class="edit"
				action="${pageContext.request.contextPath}/editshow">
				<div class="form-group header">
					<div class="Topic">
						<h1>Add Lịch Chiếu</h1>
					</div>
				</div>
				<div class="form-group body">
					<div class="form-group edit-row">
						<div class="form-group edit-row-right" style="width: 100%">
							<label style="width: 100px">Chọn Phòng :</label> <select
								name="roomshow">
								<c:forEach items="${rooms}" var="room">
									<option value="${room.id}">${room.roomName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right" style="width: 100%">
							<label style="width: 100px">Chọn Phim:</label> <select
								name="idmovie">
								<c:forEach items="${movie}" var="movies">
									<option value="${movies.id}">${movies.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right" style="width: 100%">
							<label style="width: 100px">Chọn Giờ</label>
							<form:input path="time" class="edit-row-text" type="time"
								name="timeshow"></form:input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right" style="width: 100%">
							<label style="width: 100px">Chọn Ngày</label>
							<form:input path="day" class="edit-row-text" type="date"
								name="daytime"></form:input>
						</div>
					</div>
					<div class="form-group footer">
						<form:button class="update" type="submit">
							<i class="icon-md-lock">Xác Nhận</i>
						</form:button>
						<form:hidden path="id" />
						<button class="delete" type="button">
							<i class="icon-md-lock">Quay lại</i>
						</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<script>
		$('#typemovie').multiselect({
			includeSelectAllOption : true
		});
		$('#phude').multiselect({
			includeSelectAllOption : true
		});
		$('#language').multiselect({
			includeSelectAllOption : true
		});
	</script>
</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />
