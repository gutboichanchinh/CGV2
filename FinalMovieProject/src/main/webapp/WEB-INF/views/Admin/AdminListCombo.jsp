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
		<div class="h3 text-center pt-3 col-6 text-white">Danh sách Combo
		</div>
		<div class = "col-3"> <a href="${pageContext.request.contextPath}/admin/combo/save" ><button type="button" class="btn btn-info float-end  typebtn">Thêm</button></a></div>
		</div>
    <%List<Combo> datas = (List<Combo>) request.getAttribute("dto"); %>
     <%List<ConvertImg> list = (List<ConvertImg>) request.getAttribute("listimg"); 
     int count=0;%>
        <table class="table table-striped table-hover">
            <thead>
                <tr class="text-center">
                    <th scope="col">#</th>
                    <th scope="col">Tên Combo</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Mô tả</th>
                     <th scope="col">Số lượng combo</th>
                      <th scope="col">Ảnh đã chọn</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <%for (Combo combo : datas){ %>
                <tr>
                    <td class="text-center"><%=combo.getIdCombo()%></td>
                    <td><%=combo.getComboName()%></td>
                    <td><%=combo.getComboPrice()%></td>
                    <td><%=combo.getComboDescription()%></td>
                    <td><%=combo.getNumber()%></td>
                    <td class="anhcombo"><img alt="" src="data:image/jpg;base64,<%=list.get(count).getImgString()%>" width="100px" height="100px"></td>
                    <td class="w-25">
                        <div class="d-flex justify-content-center">
                            <div><a style=" padding: 0 !important;  max-width: 100px;" class="btn btn-primary ms-2 me-2 pd-0 typebtn" href="${pageContext.request.contextPath}/admin/combo/update/<%= combo.getIdCombo() %>">Chỉnh sửa</a></div>
                            <div><a style=" padding: 0 !important;  max-width: 100px;" class="btn btn-danger ms-2 me-2 typebtn" href="${pageContext.request.contextPath}/admin/combo/delete/<%= combo.getIdCombo() %>">Xóa</a></div>
                        </div>
                    </td>
                </tr>
                <%count++;%>
                <%} %>
            </tbody>
        </table>
    </div>
</body>
<script type="text/javascript">
var a = doc
</script>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />