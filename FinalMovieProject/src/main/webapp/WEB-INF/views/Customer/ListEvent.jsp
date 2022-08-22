<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="my.com.entity.*" %>
<!DOCTYPE html>
<html>
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
        <link href ="${pageContext.request.contextPath}/resourses/CSS/eventCSS.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resourses/CSS/login.css" rel="stylesheet">
        <link href ="${pageContext.request.contextPath}/resourses/Font/font.css" rel="stylesheet" >
        <link href="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/css/bootstrap-multiselect.css" rel="stylesheet"/>
    </head>
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<body>
<style>
    .fblock {
    background-color: rgb(0, 0, 0, 0.6);
    opacity: 0;
    transition: opacity 0.3s;
    padding: 0;
}
.fblock:hover {
    opacity: 1;
}
.title-wrap {
    width: 100%;
}
  </style>

	
	
<% List<Event> datas = (List<Event>) request.getAttribute("dto"); %>
           

  <div class="container">
    <div class="card-deck">
      <div class="row">
      <% for(Event data : datas) { %>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
          <div class="card mb-3 mt-2">
            <img class="card-img" src="${pageContext.request.contextPath}/resourses/IMG/<%= data.getImage()%>"
              alt="Card image">
            <div class="card-img-overlay fblock d-flex text-white">
              <!-- <p class="card-text">Last updated 3 mins ago</p> -->
              <div class="w-100 mt-auto mb-auto d-flex flex-wrap">
                <h5 class="card-title w-75 text-center mt-2 mb-2 me-auto ms-auto"><%= data.getEventName() %></h5>
                
                <div class="text-truncate-container w-75 ms-auto me-auto my-2">
                <p class="card-text text-truncate text-wrap text-white"><%= data.getEventDescription() %>
                
                </p>
                </div>
               <a class="btn btn-primary w-50 ms-auto me-auto my-5" href="${pageContext.request.contextPath}/event/showEvent/<%=data.getIdEvent() %>" style="">Thông tin</a>
              </div>
            </div>
          </div>
        </div>
        <%} %>
        
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
    crossorigin="anonymous"></script>
  <script src="js/script.js"></script>
</body>


<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->
<!-- <script src="JS/Home.js"></script> -->
<script>
    var loader = document.getElementById("wrapper");
    window.addEventListener("load", setTimeout(function () {
        loader.style.display = "none";
    }, 1500));
</script>
<!-- <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script> -->
<!-- <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-7549a40147ccd0ba0a6b5373d87e770e49bb4689f1c2dc30cccc7463f207f997.js"></script> -->
<!-- <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script> -->
<!-- <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
</html>