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
	<%int a = (int) request.getAttribute("codeform");%>
	<%if(a==1){ %>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form class="login"  method="post" action="${pageContext.request.contextPath}/forgotpassword"  >
                        <div class="Topic">
                            <h1>CGV Xin chào!</h1>
                        </div>
                        <div class="Topic">
                            <h2>Forget Password</h2>
                            <h2 class="alert" style="color: red">${message}</h2>
                        </div>
                        
                        <label> <input name="emailforgot" type="text"
                                placeholder="Vui lòng nhập Email"  value="${gmail}" />
                        </label>
                       <button class="Login" name="submit" type="submit" >
                           <i class="icon-md-lock">Đăng nhập</i>
                       </button>
                    </form>
                </div>
            </div>
        </div>
        <%} %>
        <%if(a==2){ %>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form class="login"  method="post" action="${pageContext.request.contextPath}/checkverify"  >
                        <div class="Topic">
                            <h1>CGV Xin chào!</h1>
                        </div>
                        <div class="Topic">
                            <h2>Enter Verify</h2>
                            <h2 class="alert" style="color: red">${message}</h2>
                        </div>
                        
                        <label> <input name="verifycode" type="text"
                                placeholder="Vui lòng nhập verify code"  value="" />
                        </label>
                       <button class="Login" name="submit" type="submit" >
                           <i class="icon-md-lock">Đăng nhập</i>
                       </button>
                    </form>
                </div>
            </div>
        </div>
        <%} %>
        <%if(a==3){ %>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form class="login"  method="post" action="${pageContext.request.contextPath}/checkpassword"  >
                        <div class="Topic">
                            <h1>CGV Xin chào!</h1>
                        </div>
                        <div class="Topic">
                            <h2>Enter Password</h2>
                            <h2 style="color: red">${mess}</h2>
                        </div>
                        
                        <label> <input name="password" type="password"
                                placeholder="Vui lòng nhập Password"  value=""/>
                        </label>
                         <label> <input name="repassword" type="password"
                                placeholder="Vui lòng nhập lại Password"  value=""/>
                        </label>
                       <button class="Login" name="submit" type="submit" onclick="checkpass()">
                           <i class="icon-md-lock">Đăng nhập</i>
                       </button>
                    </form>
                </div>
            </div>
        </div>
        <%} %>
</body>
</html>