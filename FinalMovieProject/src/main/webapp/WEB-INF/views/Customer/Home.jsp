<%@page import="my.com.entity.ConvertImg"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<div class="container-fluid">
	<div class="row carousel">
		<div class="col-xl-1"></div>
		<div id="carouselExampleIndicators"
			class="carousel slide carousel-fade col-xl-10 " data-ride="carousel">
			<ol class="carousel-indicators">
				<c:set scope="request" var="count2" value="0"></c:set>
				<c:forEach items="${movie1}" var="list">
					<c:if test="${count2==0}">
					<li data-target="#carouselExampleIndicators"
						data-slide-to="${count2}" class="active"></li>
					</c:if>
					<c:if test="${count2!=0}">
					<li data-target="#carouselExampleIndicators"
						data-slide-to="${count2}"></li>
					</c:if>
					<c:set scope="request" var="count" value="${count2+1}"></c:set>
				</c:forEach>
			</ol>
			<div class="carousel-inner">
				<c:set scope="request" var="count" value="0"></c:set>
				<c:forEach items="${movie1}" var="list">
					<c:if test="${count==0}">
						<div class="carousel-item active">
							<a href="${pageContext.request.contextPath}/detail/${list.id}"><img class="d-block w-100"
								src="data:image/jpg;base64,${listBanner.get(count).getImgString()}" alt="First slide"></a>
						</div>
					</c:if>
					<c:if test="${count!=0}">
						<div class="carousel-item">
							<a href="${pageContext.request.contextPath}/detail/${list.id}"><img class="d-block w-100"
								src="data:image/jpg;base64,${listBanner.get(count).getImgString()}" alt="First slide"></a>
						</div>
					</c:if>
					<c:set scope="request" var="count" value="${count+1}"></c:set>
				</c:forEach>
			</div>

			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only"></span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only"></span>
			</a>
			<div class="col-xl-1"></div>
		</div>
	</div>
</div>
<!-------------- Movie ----------------->
<jsp:include page="CategoryMovie.jsp" />
</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />