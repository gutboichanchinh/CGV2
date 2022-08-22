<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>


<header>
	<!-- Nav Bar Start --->
	<div class="container-fluid">
		<div class="row header">
			<nav class="navbar navbar-expand-lg bg-light navbar-light">
				<div class="container-fluid">
					<div class="col-md-2">
						<a class="navbar-brand "
							href="${pageContext.request.contextPath}/home"> <img
							src="${pageContext.request.contextPath}/resourses/IMG/logo.png"
							alt="" width="100%" height="30%">
						</a>
					</div>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div
						class="collapse navbar-collapse justify-content-between col-md-8"
						id="navbarCollapse">
						<ul class="navbar-nav ml-auto">
							<li><a
								href="${pageContext.request.contextPath}/viewshowtime?place=0"
								class="nav-item nav-link ">Lịch chiếu</a></li>

							<li><a
								href="${pageContext.request.contextPath}/home/event/list"
								class="nav-item nav-link ">Sự kiện</a></li>
							<li><a
								href="${pageContext.request.contextPath}/home/contact"
								class="nav-item nav-link ">Liên Hệ</a></li>
							<li><a
								href="${pageContext.request.contextPath}/home/introdution"
								class="nav-item nav-link ">Giới thiệu</a></li>
							<div class="acc">

								<sec:authorize access="!isAuthenticated()">
									<li><a href="${pageContext.request.contextPath}/openLogin"
										class="nav-item-acc nav-link "> Đăng nhập</a></li>
									<li><a
										href="${pageContext.request.contextPath}/openRegister"
										class="nav-item-acc nav-link ">Đăng kí</a></li>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<li><a href="${pageContext.request.contextPath}/logout"
										class="nav-item-acc nav-link "> Đăng xuất</a></li>

									<sec:authorize access="hasAuthority('ADMIN')">
										<li><a class="nav-item-acc nav-link "
											data-bs-toggle="offcanvas" href="#offcanvasExample"
											role="button" aria-controls="offcanvasExample"> Admin </a></li>
									</sec:authorize>

									<sec:authorize access="hasAuthority('USER')">
										<li><a href="${pageContext.request.contextPath}/changeinfo" class="nav-item-acc nav-link "> <sec:authentication
													property="principal.username" />

										</a></li>
									</sec:authorize>

								</sec:authorize>

							</div>


						</ul>
					</div>
					<div class="col-md-2">
						<a class="navbar-img" href="#"> <img
							src="${pageContext.request.contextPath}/resourses/IMG/cgv@22x.png"
							alt="" width="40%" height="40%">
						</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
</header>