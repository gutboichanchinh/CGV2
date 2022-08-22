<%@page import="my.com.entity.TicketType"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>

<script
	src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<jsp:include page="../Page/Head.jsp"/>
<jsp:include page="../Page/Background.jsp"/>
<jsp:include page="../Page/Header.jsp" />
<body>

	<div class="container bg-light fs-5 p-0 thongke">
	<div class="row bg-dark">
	<div class="col-3"></div>
		<div class="h3 text-center pt-3 col-6 text-white">Danh sách loại vé
		</div>
		
		
		<div class = "col-3"> <a href="${pageContext.request.contextPath}/admin/typeticket/add" ><button type="button" class="btn btn-info float-end  typebtn">Thêm</button></a></div>
		</div>
	<%List<TicketType> datas=(List<TicketType>) request.getAttribute("dto"); %>
		<table class="table table-striped table-hover">
			<thead>
				<tr class="text-center">
					<th scope="col">#</th>
					<th scope="col">Tên loại vé</th>
					<th scope="col">Giá tiền</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<%for (TicketType type :datas){ %>
				<tr>
					<td class="text-center"><%=type.getId() %></td>
					<td><%=type.getName() %></td>
					<td><%=type.getPrice() %></td>
					<td class="w-25">
						<div class="d-flex justify-content-center">
							<div><a class="btn btn-primary ms-2 me-2 typebtn" href="${pageContext.request.contextPath}/admin/typeticket/update/<%=type.getId()%>">Chỉnh sửa</a></div>
							<div><a class="btn btn-danger ms-2 me-2 typebtn" href="${pageContext.request.contextPath}/admin/typeticket/delete/<%=type.getId()%>">Xóa</a></div>
						</div>
					</td>
				</tr>
				<%} %>
			</tbody>

		</table>
	</div>

</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp"/>