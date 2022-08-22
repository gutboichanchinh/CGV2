<%@page import="my.com.entity.*"%>
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
		<div class="h3 text-center pt-3 col-6 text-white">Danh sách sự kiện
		</div>
		
		<div class = "col-3"> <a href="${pageContext.request.contextPath}/admin/event/save" ><button type="button" class="btn btn-info float-end  typebtn">Thêm</button></a></div>
		</div>
    <%List<Event> datas = (List<Event>) request.getAttribute("dto"); %>
        <table class="table table-striped table-hover">
            <thead>
                <tr class="text-center">
                    <th scope="col">#</th>
                    <th scope="col">Tên sự kiện</th>
                    <th scope="col">Giảm giá</th>
                     <th scope="col">Ngày bắt đầu</th>
                      <th scope="col">Ngày kết thúc</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <%for (Event event : datas){ %>
                <tr>
                    <td class="text-center"><%=event.getIdEvent() %></td>
                    <td><%=event.getEventName() %></td>
                    <td><%=event.getDiscount() %></td>
                    <td><%=event.getStartDay() %></td>
                    <td><%=event.getEndDay() %></td>
                    <td class="w-25">
                        <div class="d-flex justify-content-center">
                            <div><a style=" padding: 0 !important;  max-width: 100px;" class="btn btn-primary ms-2 me-2 pd-0 typebtn" href="${pageContext.request.contextPath}/admin/event/update/<%= event.getIdEvent() %>">Chỉnh sửa</a></div>
                            <div><a style=" padding: 0 !important;  max-width: 100px;" class="btn btn-danger ms-2 me-2 typebtn" href="${pageContext.request.contextPath}/admin/event/delete/<%= event.getIdEvent() %>">Xóa</a></div>
                        </div>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />
