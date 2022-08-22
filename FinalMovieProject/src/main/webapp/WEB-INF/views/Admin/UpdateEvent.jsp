<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="my.com.entity.*"%>
<%@page import="java.util.List"%>
<%@page import ="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <% Event event = (Event) request.getAttribute("dto"); %>
<!DOCTYPE html>
<jsp:include page="../Page/Head.jsp"/>
<jsp:include page="../Page/Background.jsp"/>
<jsp:include page="../Page/Header.jsp" />
<body>
		<div class="editmovie">
			<form class="edit" method="post" name=eventForm enctype="multipart/form-data">
				<div class="form-group header">
					<div class="Topic">
						<h1>Thông tin Sự Kiện</h1>
						<h2 class="alert">${msg}</h2>
					</div>
				</div>
				<input type="hidden" id = "eventPoster" name="eventPoster" value="<%=event.getImage() %>" ></input>
				<input type="hidden" id = "idEvent" name="idEvent" value="<%=event.getIdEvent() %>" ></input>
				
				<div class="form-group body">
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Tên Sự Kiện:</label>
							<input  class="edit-row-text" type="text" name="eventName"  id="eventName"  value="<%=event.getEventName() %>" required></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Mốc Giảm Giá:</label>
							<input class="edit-row-text" type="number" name="discount" id="discount" value="<%=event.getDiscount() %>" required onkeydown="moneyFormat()"></input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Ngày Bắt Đầu:</label>
							<input class="edit-row-file" type="date" name="startDay" id="startDay" onchange="checkDay()" value="<%= event.getStartDay() %>" required ></input>
							</div>
						<div class="form-group edit-row-left">
							<label>Ngày Kết Thúc:</label>
							<input class="edit-row-file" type="date" name="endDay" id="endDay" value="<%=event.getEndDay() %>" required></input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Mô Tả Sự Kiện:</label>
							<input class="edit-row-text" type="text" name="eventDescription" value="<%=event.getDiscount() %>" id="eventDescription" required></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Ảnh Sự Kiện:</label>
							<input name="anh" class="edit-row-file" type="file" id = "fileupload" ><img  class="border border-secondary" alt="" src="data:image/jpg;base64,${imageevent}" width="100px" height="100px">
							
						</div>
					</div>
					<br>
					
					<div class="form-group footer">
						<button type="submit" onclick=><i class="icon-md-lock">Tạo mới</i></button>
						
					</div>
				</div>
				</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		   $(function()
				    {
						$("#fileupload").change(function(event){
							var x = event.target.files[0].name;
							 var imgName = document.getElementById("eventPoster");
							imgName.value = x;
							imgName.innerHTML(x);
						});
					})
		  document.getElementById('startDay').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
	   
	</script>
	<script type="text/javascript">
    function checkDay(){
	   var start = new Date(document.getElementById('startDay').value).toISOString().split("T")[0];
	   start = new Date(start)
	   var day = start.getDate() + 1;
	   start.setDate(day);
	   
	   document.getElementById('endDay').min = new Date(start).toISOString().split("T")[0];
   } 
	   </script>
	  <script type="text/javascript">
	  function moneyFormat(){
		  var discount = document.getElementById('discount').value
		  var m = discount.split('').reverse().reduce((prev, next, index) => {
		 		return ((index % 3) ? next : (next + '.')) + prev
		 	})
		  console.log(m)
		  
	  }
	  
	  </script> 
</body>
	

<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp"/>