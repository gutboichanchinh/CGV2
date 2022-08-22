<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
        <div class="movie">
            <div class="container">
                <div class="row">
                    <div class="product-movie">
						<a class="btn btn-solid effect-scale" onclick="movie()">Tất cả phim</a>
                        <a class="btn btn-solid effect-scale" onclick="showing()">Phim đang chiếu</a>
                        <a class="btn btn-solid effect-scale" onclick="coming()">Phim sắp chiếu</a>
                    </div>
<!--                     <main class="page-content"> -->

                      <div class="page-content all" id="all">
                      <c:set scope="request" var="count" value="0"></c:set>
                            <c:forEach var="p" items="${movie1}">
                                <div class="card">
                                    <div class="content">
                                        <a href="${pageContext.request.contextPath}/detail/${p.id}" style="text-decoration: none;"> <img src="data:image/jpg;base64,${listimage.get(count).getImgString()}">
                                            <h2 class="title">${p.name}</h2>
                                        </a>
                                    </div>
                                </div>
                                <c:set scope="request" var="count" value="${count+1}"></c:set>
                            </c:forEach>
                       </div>

                        <div class="page-content showing" id="show">
                        <c:set scope="request" var="count" value="0"></c:set>
                            <c:forEach var="p" items="${movie2}">
                                <div class="card">
                                    <div class="content">
                                        <a href="${pageContext.request.contextPath}/detail/${p.id}" style="text-decoration: none;"> <img src="data:image/jpg;base64,${listimage2.get(count).getImgString()}">
                                            <h2 class="title">${p.name}</h2>
                                        </a>
                                    </div>
                                </div>
                                <c:set scope="request" var="count" value="${count+1}"></c:set>
                            </c:forEach>
                        </div>

                        <div class="page-content coming" id="come">
                        <c:set scope="request" var="count" value="0"></c:set>
                            <c:forEach var="p" items="${movie4}">
                                <div class="card">
                                    <div class="content">
                                        <a href="${pageContext.request.contextPath}/detail/${p.id}" style="text-decoration: none;"> <img src="data:image/jpg;base64,${listimage4.get(count).getImgString()}">
                                            <h2 class="title">${p.name}</h2>
                                        </a>
                                    </div>
                                </div>
                                <c:set scope="request" var="count" value="${count+1}"></c:set>
                            </c:forEach>
                        </div>
<!--                     </main> -->
                    <script src="https://code.jquery.com/jquery-3.5.1.js"
                        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
                        crossorigin="anonymous"></script>
                    <script type="text/javascript">
                       		
                    	document.getElementById("come").setAttribute("hidden", "hidden");
                    	document.getElementById("show").setAttribute("hidden", "hidden");
                    		
                            function showing() {
                            	document.getElementById("all").setAttribute("hidden", "hidden");
                                document.getElementById("come").setAttribute("hidden", "hidden");
                                document.getElementById("show").removeAttribute("hidden", "hidden");
                            }
                            function coming() {
                            	document.getElementById("all").setAttribute("hidden", "hidden");
                                document.getElementById("show").setAttribute("hidden", "hidden");
                                document.getElementById("come").removeAttribute("hidden", "hidden");
                            }
                            function movie() {
                    			console.log("hello1");
                        		document.getElementById("show").setAttribute("hidden", "hidden");
                            	document.getElementById("come").setAttribute("hidden", "hidden");
                            	document.getElementById("all").removeAttribute("hidden", "hidden");
                        	}
                    </script>
