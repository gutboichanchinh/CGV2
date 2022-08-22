<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<body>

	<div class="container bg-light fs-5 p-0 thongke">
	<div class="row bg-dark">
	<div class="col-3"></div>
		<div class="h3 text-center pt-3 col-6 text-white">Danh sách phim
		</div>
		
		
		<div class = "col-3"> <a href="${pageContext.request.contextPath}/admin/movie/add" ><button type="button" class="btn btn-info float-end  typebtn">Thêm</button></a></div>
		</div>
		<table class="table table-striped table-hover table-bordered">
		
				<thead>
					<tr class="text-center">
						<th>Tên phim</th>
						<th>Thể loại</th>
						<th>Thời lượng</th>
						<th>Khởi chiếu</th>
						<th>Trạng thái phim</th>
						<th>Chỉnh sửa</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="p" items="${list}">
						<tr>
							<td>${p.name}</td>
							<td><c:forEach var="o" items="${p.movieTypes}">
                            	+ ${o.name}<br>
									<br>
								</c:forEach></td>
							<td>${p.time}</td>
							<td>${p.dateOpen}</td>
							<c:if test="${p.category  == 1}">
								<td>Phim đang chiếu</td>
							</c:if>
							<c:if test="${p.category  == 2}">
								<td>Phim sắp chiếu</td>
							</c:if>
							<c:if test="${p.category  == 3}">
								<td>Phim hết chiếu</td>
							</c:if>
							<td class="w-25">
								<div class="d-flex justify-content-center">
									<div>
										<a class="btn btn-primary ms-2 me-2 typebtn"
											href="${pageContext.request.contextPath}/admin/movie/edit/${p.id}">Chỉnh
											sửa</a>
									</div>
									<div>
										<a class="btn btn-danger ms-2 me-2 typebtn"
											href="${pageContext.request.contextPath}/admin/movie/delete/${p.id}">Xóa</a>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>



</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />
