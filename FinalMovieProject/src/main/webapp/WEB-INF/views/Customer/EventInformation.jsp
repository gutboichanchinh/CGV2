<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.util.Locale" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.DateFormat" %>
<%@ page import="my.com.entity.*" %>
    <% Event data = (Event) request.getAttribute("event"); %>
    <% DateFormat dFormat = DateFormat.getDateInstance(DateFormat.SHORT); %>
<!DOCTYPE html>
<html lang="en">
<head>
        <title>CGV2.0 Cinema</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/resourses/IMG/logo.png" rel="icon">
        <!-- Google font-->
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <!--CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link href ="${pageContext.request.contextPath}/resourses/CSS/CSS2.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resourses/CSS/login.css" rel="stylesheet">
        <link href ="${pageContext.request.contextPath}/resourses/Font/font.css" rel="stylesheet" >
        <link href="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/css/bootstrap-multiselect.css" rel="stylesheet"/>
    </head>
   <jsp:include page="../Page/Background.jsp"/>
   <jsp:include page="../Page/Header.jsp"/>
<body>
    <!-- Body Content -->
    <!-- 
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v14.0"
        nonce="9Qf8fAPX"></script> -->
    <div class="container mt-3">
        <div class="row mb-3 flex-nowrap">
        <div class="title col-1 h4 text-white">
            
            </div>
            <div class="title col-8 h4 text-white">
                <%= data.getEventName() %>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="image col-md-4">
                <div class="w-50 mx-auto mb-3"><img class="img-fluid"
                        src="${pageContext.request.contextPath}/resourses/IMG/<%= data.getImage() %>" alt=""></div>
            </div>
            <div class="content col-md-8 mt-3">
                <!-- <div class="h5"> Some content here</div> -->
                <div class="row my-2">
                    <div class="col-4 col-lg-2 text-nowrap text-white"><label>Tên Sự Kiện:</label></div>
                    <div class="col-8 col-lg-10 text-white"><%= data.getEventName() %></div>
                </div>
                <div class="row my-2">
                    <div class="col-4 col-lg-2 text-nowrap text-white"><label>Giảm giá</label></div>
                    <div class="col-8 col-lg-10 text-white"><%= data.getDiscount() %></div>
                </div>
                <div class="row my-2">
                    <div class="col-4 col-lg-2 text-nowrap text-white"><label>Ngày Bắt Đầu</label></div>
                    <div class="col-8 col-lg-10 text-white"> <%= data.getStartDay() %></div>
                </div>
                <div class="row my-2">
                    <div class="col-4 col-lg-2 text-nowrap text-white"><label>Ngày Kết Thúc</label></div>
                    <div class="col-8 col-lg-10 text-white"><%=data.getEndDay() %></div>
                </div>
                <div class="row my-2">
                    <div class="col-4 col-lg-2 text-nowrap text-white"><label>Thông tin</label></div>
                    <div class="col-6 col-lg-5 text-white"><%= data.getEventDescription() %></div>
                </div>
                
            </div>
    </div>
    <!-- </div> -->
    </div>
    <i class="fa fa-arrow-circle-up fa-3x back-to-top d-none" aria-hidden="true"></i>
</body>
 <jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp"/>