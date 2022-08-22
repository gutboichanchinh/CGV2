<%@page import="my.com.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<body class="preloading">
	<div class="container bg-light fs-5 p-0 pt-3">
		<div class="h3 text-center">Danh sách các Lịch Chiếu</div>
		<div>${mess}</div>
		<table class="table table-striped table-hover">
			<thead>
				<tr class="text-center">
					<th scope="col">#</th>
					<th scope="col">Tên Phim</th>
					<th scope="col">Tên Phòng</th>
					<th scope="col">Ngày</th>
					<th scope="col">Giờ</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listshowtime}" var="list">
					<tr>
						<td class="text-center">${list.id}</td>
						<c:forEach items="${listmovie}" var="movie">
							<c:if test="${list.idMovie==movie.id}">
								<td>${movie.name}</td>
							</c:if>
						</c:forEach>
						<td>${list.roomId}</td>
						<td>${list.day}</td>
						<td>${list.time}</td>
						<td class="w-25">
							<div class="d-flex justify-content-center">
								<div>
									<a style="padding: 0 !important; max-width: 100px;"
										class="btn btn-primary ms-2 me-2 pd-0 typebtn"
										href="${pageContext.request.contextPath}/admin/edit/showtime?id=${list.id}">Chỉnh
										sửa</a>
								</div>
								<div>
									<a style="padding: 0 !important; max-width: 100px;"
										class="btn btn-danger ms-2 me-2 typebtn"
										href="${pageContext.request.contextPath}/deleteshowtime?id=${list.id}">Xóa</a>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
				<a style="float: right; ! important; max-width: 100px;"
					class="btn btn-danger ms-2 me-2 typebtn"
					href="${pageContext.request.contextPath}/admin/addshowtimepage">Thêm
					Lịch Chiếu</a>
			</tbody>
		</table>
	</div>
</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />