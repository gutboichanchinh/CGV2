<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script
	src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />

<body>
	<div class="container">
		<div class="editmovie">
			<form:form modelAttribute="thisroom" method="post" class="edit"
				action="${pageContext.request.contextPath}/admin/addroom">
				<div class="form-group header">
					<div class="Topic">
						<h1>Thông tin phòng</h1>
					</div>
				</div>
				<div style="text-align: center;color: red;">${mess}</div>
				<div class="form-group body ">
					<div class="form-group edit-row">
						<div class="form-group edit-row-right d-flex justify-content-center" style="width: 100%">
							<label style="width: 100px ; margin-top: 5px;">Tên Phòng :</label>
							<form:input path="roomName"  class="edit-row-text" type="text"
								name="roomName" ></form:input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right d-flex justify-content-center" style="width: 100%">
							<label style="width: 100px;margin-top: 5px;">Cột :</label>
							<form:input path="coluum" class="edit-row-text" type="text"
								name="coluum"></form:input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right d-flex justify-content-center" style="width: 100%">
							<label style="width: 100px;margin-top: 5px;">Hàng :</label>
							<form:input path="row" class="edit-row-text" type="text"
								name="row"></form:input>
						</div>
					</div>
					<div class="form-group footer">
						<form:hidden path="id" />
						<form:button class="update" type="submit">
							<i class="icon-md-lock">Xác Nhận</i>
						</form:button>

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
