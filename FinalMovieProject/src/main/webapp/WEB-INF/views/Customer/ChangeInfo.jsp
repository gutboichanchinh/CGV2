<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Header.jsp" />
<body>
	<div class="container changeinfor-container">
		<div class="changeinfor-top">Chỉnh sửa thông tin cá nhân</div>
		<form:form action="${pageContext.request.contextPath}/save"
			method="post" modelAttribute="peoples">
			<fieldset class="row">
				<div class="col-1"></div>
				<div class="col-11">
					<div class="form-group row">
						<label class="col-2 col-form-label">Email</label> <label
							class="col-1 col-form-label">:</label>
						<div class="col-9">
							<form:input path="gmail" type="text" class="changeinfor-input2"
								style="pointer-events: none;" />
							<form:input path="password" type="hidden" />
							<form:input path="userName" type="hidden" />
							<form:input path="sex" type="hidden" />
							<form:input path="member" type="hidden" />
							<form:input path="iDRole" type="hidden" />
							<form:input path="iDUser" type="hidden" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-2 col-form-label">Họ và Tên</label> <label
							class="col-1 col-form-label">:</label>
						<div class="col-9">
							<form:input path="name" type="text" class="changeinfor-input"
								id="name" />
						</div>
						<div id="messName" style="color: red;"></div>
						<div style="color: red;">${messErrorName}</div>
					</div>
					<div class="form-group row">
						<div class="col row option">
							<label class="col-4 col-form-label">Năm Sinh:</label>
							<form:input path="birthDay" class="col-8 change-day-option"
								type="date" id="birthday" name="birthday" />
						</div>
						<div style="color: red;">${messErrorDay}</div>
					</div>
					<div class="form-group row">
						<label class="col-2 col-form-label">Địa Chỉ</label> <label
							class="col-1 col-form-label">:</label>
						<div class="col-9">
							<form:input type="text" class="changeinfor-input" path="address"
								id="address" />
						</div>
						<div id="messAddress" style="color: red;"></div>
						<div style="color: red;">${messErrorAddress}</div>
					</div>
					<div class="form-group row">
						<label class="col-2 col-form-label">SĐT</label> <label
							class="col-1 col-form-label">:</label>
						<div class="col-9">
							<form:input type="text" class="changeinfor-input" path="phone"
								id="phone" />
						</div>
						<div id="messPhone" style="color: red;"></div>
						<div style="color: red;">${messErrorPhone}</div>
						<div class="d-flex justify-content-center">
							<div style="color: red; width: 30%; padding-top: 20px">${mess}</div>
						</div>
					</div>

				</div>
				<div class="d-flex justify-content-center mb-3">
					<form:button value="Add" id="btn-check"
						style="width: 20%;padding: 10px;border-radius: 50px; "
						disabled="true">Change</form:button>
				</div>
			</fieldset>
		</form:form>
		
		<div class="d-flex justify-content-center mb-3">
			<a
				href="${pageContext.request.contextPath}/changepassword?emailchange=${peoples.gmail}"
				style="width: 20%; text-decoration: none; background: white; padding: 20px; text-align: center; color: black; border-radius: 50px;">Đổi
				mật khẩu</a>
		</div>
	</div>
</body>
<script>
	let count1 = 1;
	let count2 = 2;
	let count3 = 3;
	let regexEmail = /^[0-9]{10}$/;
	var today = new Date();
	var checkbtn = document.getElementById("btn-check")
	var values = document.getElementById("messName");
	var values2 = document.getElementById("messAddress");
	var values3 = document.getElementById("messPhone");
	document.getElementById("name").addEventListener("input", validName);
	function validName(e) {
		var lengthname = document.getElementById("name").value.length
		if (lengthname == 0) {
			values.innerHTML = "Đừng để trống tên"
			count1 = 0
		} else {
			values.innerHTML = ""
			count1 = 1
		}

		if (count1 == 1 && count2 == 2 && count3 == 3) {
			checkbtn.removeAttribute('disabled');
		} else {
			checkbtn.setAttribute("disabled", "true")
		}
	}
	document.getElementById('birthday').max = new Date(new Date().getTime()
			- new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
	document.getElementById("birthday").addEventListener("input", validDay);
	function validDay(e) {
		if (count1 == 1 && count2 == 2 && count3 == 3) {
			checkbtn.removeAttribute('disabled');
		} else {
			checkbtn.setAttribute("disabled", "true")
		}
	}

	document.getElementById("address").addEventListener("input", validaddress);
	function validaddress(e) {
		var lengthname = document.getElementById("address").value.length;
		if (lengthname == 0) {
			values2.innerHTML = "Đừng để trống địa chỉ"
			count2 = 0;
		} else {
			values2.innerHTML = ""
			count2 = 2;
		}

		if (count1 == 1 && count2 == 2 && count3 == 3) {
			checkbtn.removeAttribute('disabled');
		} else {
			checkbtn.setAttribute("disabled", "true")
		}
	}

	document.getElementById("phone").addEventListener("input", validphone);
	function validphone(e) {
		const lengthname = document.getElementById("phone");
		var check = regexEmail.test(lengthname.value);
		if (lengthname.length < 10 || check == false) {
			values3.innerHTML = "Số điện thoại ko đủ 10 số"
			count3 = 0;
		} else {
			values3.innerHTML = ""
			count3 = 3;
		}

		if (count1 == 1 && count2 == 2 && count3 == 3) {
			checkbtn.removeAttribute('disabled');
		} else {
			checkbtn.setAttribute("disabled", "true")
		}
	}
</script>
<jsp:include page="../Page/Footer.jsp" />
</html>