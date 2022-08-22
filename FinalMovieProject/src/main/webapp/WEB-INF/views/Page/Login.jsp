<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>CGV2.0 Cinema</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resourses/IMG/logo.png" rel="icon">
        <!-- Google font-->      
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <!--CSS -->       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<%--         <link href ="${pageContext.request.contextPath}/resourses/CSS/CSS.css" rel="stylesheet"> --%>
        <link href="${pageContext.request.contextPath}/resourses/CSS/login.css" rel="stylesheet">
        <link href="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/css/bootstrap-multiselect.css" rel="stylesheet"/>
</head>
<body>

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form class="login"  method="POST" action="j_spring_security_check"  >
						<div class="Topic">
							<h1>CGV Xin chào!</h1>
						</div>
						<div class="Topic">
							<h2>Đăng nhập</h2>
							<h2 class="alert">${message}</h2>
							<h2 style="color: red;">${message}</h2>
						</div>
						<label> <input name="UserName" type="text"
								placeholder="Tên tài khoản"  value="${param.UserName}" />
						</label>
						<label> <input name="Password" type="password"
								placeholder="Mật khẩu"  value="" />
						</label>
<!-- 						<input class="btn-sub" type="submit" value="Đăng nhập" /> -->
<!-- 						<a href="openForgot" class="forgot">Quên mật khẩu</a> -->
						<button class="Login" name="submit" type="submit" value="submit" > 
							<i class="icon-md-lock">Đăng nhập</i>
							</button>
					
						<a href="${pageContext.request.contextPath}/forgotpage" class="forgot">Quên mật khẩu</a>
					</form>
				</div>
			</div>
		</div>
		
</body>
</html>