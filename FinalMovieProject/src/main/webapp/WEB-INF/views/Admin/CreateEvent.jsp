<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<body>
	<div class="container">
		<div class="editmovie">
			<form class="edit" method="post" name=eventForm
				enctype="multipart/form-data">
				<div class="form-group header">
					<div class="Topic">
						<h1>Tạo Sự Kiện</h1>
						<h2 class="alert">${msg}</h2>
					</div>
				</div>
				<input type="hidden" id="eventPoster" name="eventPoster" value=""></input>
				<div class="form-group body">
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Tên Sự Kiện:</label> <input class="edit-row-text"
								type="text" name="eventName" id="eventName" required></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Mốc Giảm Giá:</label> <input class="edit-row-text"
								type="number" name="discount" id="discount" required
								onkeydown="moneyFormat()"></input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Ngày Bắt Đầu:</label> <input class="edit-row-file"
								type="date" name="startDay" id="startDay" onchange="checkDay()"
								required></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Ngày Kết Thúc:</label> <input class="edit-row-file"
								type="date" name="endDay" id="endDay" onchange="checkStartDay()" required></input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Mô Tả Sự Kiện:</label> <input class="edit-row-text"
								type="text" name="eventDescription" id="eventDescription"
								required></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Ảnh Sự Kiện:</label> <input name="anh"
								class="edit-row-file" type="file" id="fileupload"  required></input>
						</div>
					</div>


					<div class="form-group edit-row">
						<div class="form-group edit-row">

						</div>
					</div>
					<div class="form-group footer">
						<button type="submit" onclick=>
							<i class="icon-md-lock">Tạo mới</i>
						</button>

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
	  <script type="text/javascript">
	  function checkStartDay(){
          var start = document.getElementById('startDay')
           var end = document.getElementById('endDay')
            if(start.value == ""){
                alert("Vui lòng chọn ngày bắt đầu trước!!!")
                end.value=""
            }
      }
	  </script>
</body>


<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />