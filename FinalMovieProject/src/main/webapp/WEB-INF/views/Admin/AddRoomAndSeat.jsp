<%@page import="my.com.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<body class="preloading">

	<%
	List<Room> datas = (List<Room>) request.getAttribute("rooms");
	%>
	<div class="container bg-light fs-5 p-0 pt-3">
		<div class="h3 text-center">Danh sách phòng</div>
		<table class="table table-striped table-hover">
			<thead>
				<tr class="text-center">
					<th scope="col">#</th>
					<th scope="col">Tên Phòng</th>
					<th scope="col">Hàng</th>
					<th scope="col">Cột</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Room room : datas) {
				%>
				<tr>
					<td class="text-center"><%=room.getId()%></td>
					<td><%=room.getRoomName()%></td>
					<td><%=room.getColuum()%></td>
					<td><%=room.getRow()%></td>
					<td class="w-25">
						<div class="d-flex justify-content-center">
							<div>
								<a style="padding: 0 !important; max-width: 100px;"
									class="btn btn-primary ms-2 me-2 pd-0 typebtn"
									href="${pageContext.request.contextPath}/admin/viewroom/<%=room.getId() %>">Xem
									phong</a>
							</div>
							<div>
								<a style="padding: 0 !important; max-width: 100px;"
									class="btn btn-primary ms-2 me-2 pd-0 typebtn"
									href="${pageContext.request.contextPath}/admin/update/<%=room.getId() %>">Chỉnh
									sửa</a>
							</div>
							<div>
								<a style="padding: 0 !important; max-width: 100px;"
									class="btn btn-danger ms-2 me-2 typebtn"
									href="${pageContext.request.contextPath}/admin/delete?id=<%=room.getId() %>">Xóa</a>
							</div>
						</div>
					</td>
				</tr>
				<%
				}
				%>
				<a style="float: right; ! important; max-width: 100px;"
					class="btn btn-danger ms-2 me-2 typebtn"
					href="${pageContext.request.contextPath}/admin/addroompage">Thêm
					Phòng</a>
				</div>

			</tbody>
		</table>
	</div>
</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />