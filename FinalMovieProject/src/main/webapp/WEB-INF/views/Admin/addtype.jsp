<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script
    src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<jsp:include page="../Page/Head.jsp"/>
<jsp:include page="../Page/Background.jsp"/>
<jsp:include page="../Page/Header.jsp" />
<body>
    <div class="container">
        <div class="editmovie">
            <form class="edit" method="post">
                <div class="form-group header">
                    <div class="Topic">
                        <h1>Thêm loại vé mới</h1>
                    </div>
                </div>
                <div class="form-group body">
                    <div class="form-group edit-row justify-content-center mb-3 mt-3">
                        <div class="form-group edit-row-right">
                            <label>Tên vé:</label> <input class="edit-row-text" type="text" name="name" value="${param.name}" required="required"></input>
                        </div>
                    </div>
                    <div class="form-group edit-row justify-content-center mb-3 mt-3">
                        <div class="form-group edit-row-right">
                            <label>Giá vé:</label> <input class="edit-row-text" type="number" name="price" value="${param.price}" required="required"></input>
                        </div>
                    </div>
                    <div class="form-group footer mt-3">
                        <button class="update" type="submit">
                            <i class="icon-md-lock">Thêm</i>
                        </button>
<!--                        <button class="delete" type="reset">
                            <i class="icon-md-lock">Xóa</i>
                        </button> -->
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />