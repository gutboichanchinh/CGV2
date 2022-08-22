<%@page import="java.util.Iterator"%>
<%@page import="my.com.entity.TypeMovie"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="my.com.entity.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CGV2.0 Cinema</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/resourses/IMG/logo.png"
	rel="icon">
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
<link href="${pageContext.request.contextPath}/resourses/CSS/CSS2.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resourses/CSS/login.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resourses/Font/font.css"
	rel="stylesheet">
<link
	href="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/css/bootstrap-multiselect.css"
	rel="stylesheet" />
</head>
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<body>
	<!-- Body Content -->
	<!-- 
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v14.0"
        nonce="9Qf8fAPX"></script> -->

	<%
	Movie datas = (Movie) request.getAttribute("dto");
	Set<TypeMovie> dataTM = datas.getMovieTypes();
	%>
	<div class="container mt-3">
		<div class="row mb-3 flex-nowrap">
			<div class="title col-8 h4 text-white">
				<%=datas.getName()%>
			</div>
			<div class="button col-4 row justify-content-center">
				<a href="${pageContext.request.contextPath}/viewshowtime3?place=0&idmovie=<%=datas.getId()%>" class="btn btn-success mt-2 w-25 rounded-pill text-capitalize text-nowrap align-self-center">Đặt
					vé</a>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="image col-md-4">
				<div class="w-50 mx-auto mb-3">
					<img class="img-fluid"
						src="data:image/jpg;base64,${anh}" alt=""></div>
			</div>
			<div class="content col-md-7 mt-3">
				<!-- <div class="h5"> Some content here</div> -->
				<div class="row my-2">
					<div class="col-4 col-lg-2 text-nowrap text-white">
						<label>Đạo diễn:</label>
					</div>
					<div class="col-8 col-lg-10 text-white">
						<%=datas.getDirector()%></div>
				</div>
				<div class="row my-2">
					<div class="col-4 col-lg-2 text-nowrap text-white">
						<label>Diễn viên:</label>
					</div>
					<div class="col-8 col-lg-10 text-white">
						<%=datas.getActor()%></div>
				</div>
				<div class="row my-2">
					<div class="col-4 col-lg-2 text-nowrap text-white">
						<label>Thể loại:</label>
					</div>
					<div class="col-8 col-lg-10 text-white">
						<%
					Iterator<TypeMovie> it = dataTM.iterator();
					if (it.hasNext()) {
						out.print(it.next().getName());
					}
					while (it.hasNext()) {
						out.print(", " + it.next().getName());
					}
					%>
					</div>
					
				</div>
				<div class="row my-2">
					<div class="col-4 col-lg-2 text-nowrap text-white">
						<label>Khởi chiếu:</label>
					</div>
					<div class="col-8 col-lg-10 text-white"><%=datas.getDateOpen()%></div>
				</div>
				<div class="row my-2">
					<div class="col-4 col-lg-2 text-nowrap text-white">
						<label>Thời lượng:</label>
					</div>
					<div class="col-8 col-lg-10 text-white"><%=datas.getTime()%> phút</div>
				</div>
				<div class="row my-2">
					<div class="col-4 col-lg-2 text-nowrap text-white">
						<label>Ngôn ngữ:</label>
					</div>
					<div class="col-8 col-lg-10 text-white">
					<%
					if(datas.getLanguage().equals("1")){
						out.print("Thuyết minh");
					}else if(datas.getLanguage().equals("2")){
						out.print("Lồng tiếng");
					}else if (datas.getLanguage().equals("3")){
						out.print("Phụ đề");
					}
					
					%></div>
				</div>
			</div>
		</div>
		<!-- <div class="nav navbar-nav"> -->
		<div class="row">
			<ul
				class="nav nav-fill nav-justified justify-content-center flex-nowrap mt-3 mx-auto">
				<li class="mx-3 rounded-pill text-center"><a
					class="btn btn-success text-nowrap rounded-pill"
					href="#film-detail-tab-1" data-toggle="tab">Chi tiet</a></li>
				<li class="mx-3 rounded-pill text-center"><a
					class="btn btn-success rounded-pill" href="#film-detail-tab-2"
					data-toggle="tab">Trailer</a></li>
				<li class="mx-3 rounded-pill text-center"><a
					class="btn btn-success text-nowrap rounded-pill"
					href="#film-detail-tab-3" data-toggle="tab">Danh gia</a></li>
			</ul>
		</div>
		<div class="row mt-5 mb-5">
			<div class="tab-content mx-auto" id="tabs">
				<div id="film-detail-tab-1" class="tab-pane fade active show">
					<p class="mx-auto text-white w-75">
						<%=datas.getDescription()%></br>
					</p>
				</div>
				<div id="film-detail-tab-2" class="tab-pane fade">
					<div class="product_view_trailer text-center mx-auto"
						id="trailer-film-detail">
						<iframe width="560" height="315"
							src="<%=datas.getTralier()%>"
							title="Thor Tình Yêu Và Sấm Sét Trailer - DKKC: tháng 7, 2022"
							frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
				</div>
				<div id="film-detail-tab-3" class="tab-pane fade">
					<div class="row">
						<img class="img-fluid mx-auto w-50"
							src="img/under-development.png" alt="">
					</div>
					<!-- <div class="fb-comments"
                        data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width=""
                        data-numposts="7"></div> -->
				</div>
			</div>
			<!-- <div class=""> -->
			<!-- </div> -->
		</div>
	</div>
	<!-- </div> -->
	</div>
	<i class="fa fa-arrow-circle-up fa-3x back-to-top d-none"
		aria-hidden="true"></i>

</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />