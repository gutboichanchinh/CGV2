<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>CGV2.0 Cinema</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resourses/IMG/logo.png" rel="icon">
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Bangers&display=swap"
	rel="stylesheet">
<!--CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<link href="${pageContext.request.contextPath}/resourses/CSS/login.css"
	rel="stylesheet">
<link
	href="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/css/bootstrap-multiselect.css"
	rel="stylesheet" />

</head>
<body>

	<div class="modal-dialog">
		<div class="modal-content">
			<form class="login"  method="post" action="${pageContext.request.contextPath}/register">
				<div class="Topic" >
							<h1>CGV Xin chào!</h1>
				</div>
				<div class="Topic">
					<h2>Đăng kí</h2>
					<h2 class="alert">${message}</h2>
				</div>
				<label> <input type="text" placeholder="Họ và tên" name="Name" id="Name"  value="${param.Name}" required/>
				</label> <label> <input type="text" placeholder="Tên tài khoản" id="Username" value="${param.UserName}" name="UserName" required />
				</label> <label> <input type="password" placeholder="Mật khẩu" id="Password" name="Password" required/>
				</label> <label> <input type="password"
					placeholder="Nhập lại mật khẩu" id="Repass" name="rePassword" required/>
				</label> <label> <input type="date" value="${param.birthDay}" id="Birthday" name="birthDay" min='1900-01-01' required />
				</label> <label> <input type="text" placeholder="Địa chỉ" value="${param.Address}" id="Address" name="Address" required />
				</label> <label> <input type="email" placeholder="Email" value="${param.Gmail}" id="Gmail" name="Gmail"required />
				</label> <label> <input type="text" placeholder="Số điện thoại" value="${param.Phone}" id="Phone" name="Phone" pattern ="^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$" required/>
				</label>
				<div class="sex">
					<label for="sex" name="Sex"> Giới tính: <select>
							<option value="1">Nam</option>
							<option value="0">Nữ</option>
					</select>
					</label>
				</div>
				<div class="member" name="Member">
					<label for="sex"> Thành viên: <select>
							<option value="1">Không</option>
							<option value="0">Có</option>
					</select>
					</label>
				</div>
				
				<button class="Login" name="submit" type="submit" onclick="Register()" >
							<i class="icon-md-lock">Đăng kí</i>
						</button>
			</form>
		</div>
	</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script  src="${pageContext.request.contextPath}/resourses/JS/register.js" type="text/javascript" ></script>
</html>