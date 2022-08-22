<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<jsp:include page="../Page/Head.jsp"/>
<jsp:include page="../Page/Background.jsp"/>
<jsp:include page="../Page/Header.jsp" />
<body>
	<div class="container">
		<div class="editmovie">
			<form class="edit" method="post" name=comboForm enctype="multipart/form-data">
				<div class="form-group header">
					<div class="Topic">
						<h1>Tạo Combo</h1>
						<h2 class="alert">${msg}</h2>
					</div>
				</div>
				<!-- <input type="hidden" id = "eventPoster" name="eventPoster" value="" ></input>
				 -->
				 <input type="hidden" id = "comboPoster" name="comboImage" value="" ></input>
				
				 <div class="form-group body">
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Tên Combo:</label>
							<input  class="edit-row-text" type="text" name="comboName"  id="eventName" required  ></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Mô tả Combo:</label>
							<input class="edit-row-text" type="text" name="comboDescription" id="comboDescription" required></input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Giá Combo:</label>
							<input class="edit-row-text" type="number" name="comboPrice" min="0" id="discount" required onkeydown="moneyFormat()"></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Số lượng:</label>
							<input class="edit-row-text" type="number" name="Number" id="startDay" min="0"  required ></input>
						</div>
					
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-left">
							<label>Ảnh Combo:</label>
							<input name="anh" class="edit-row-file" type="file" id="fileupload" ></input>
						</div>
					</div>
					<div class="form-group edit-row">
					<div class="form-group edit-row">
					
					</div>		
					</div>			
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
							 var imgName = document.getElementById("comboPoster");
							imgName.value = x;
							imgName.innerHTML(x);
						});
					})
	</script>
	<script type="text/javascript">
    
	   </script>
	  <script type="text/javascript">
	  function moneyFormat(){
		  var discount = document.getElementById('discount').value
		  var m = discount.split('').reverse().reduce((prev, next, index) => {
		 		return ((index % 3) ? next : (next + '.')) + prev
		 	})
		  
		  
	  }
	  
	  </script> 
</body>
	

<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />