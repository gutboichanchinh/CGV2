<%@page import="my.com.entity.TicketType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<jsp:include page="../Page/Head.jsp"/>
<jsp:include page="../Page/Background.jsp"/>
<jsp:include page="../Page/Header.jsp" />
    <div class="container">
        <div class="editmovie">
            <%
            TicketType data = (TicketType) request.getAttribute("dto");
            %>
            <form class="edit" method="post">
                <div class="form-group header">
                    <div class="Topic">
                        <h1>Chỉnh sửa loại vé</h1>
                    </div>
                </div>
                <div class="form-group body">
                    <div class="form-group edit-row justify-content-center mb-2 mt-2">
                        <div>
                            <input type="hidden" name="id" value="<%=data.getId()%>">
                        </div>
                        <div class="form-group edit-row-right">
                            <label>Tên vé:</label> <input class="edit-row-text" type="text"
                                name="name" value="<%=data.getName()%>" required="required"></input>
                        </div>
                    </div>
                    <div class="form-group edit-row justify-content-center mb-2 mt-2">
                        <div class="form-group edit-row-right">
                            <label>Giá vé:</label> <input class="edit-row-text" type="number"
                                name="price" value="<%=data.getPrice()%>" required="required"></input>
                        </div>
                    </div>
                    <div class="form-group footer mt-3">
                        <button class="update" type="submit">
                            <i class="icon-md-lock">Chỉnh sửa</i>
                        </button>
                    </div>
                </div>
            </form>
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
<jsp:include page="../Page/Script.jsp"/>