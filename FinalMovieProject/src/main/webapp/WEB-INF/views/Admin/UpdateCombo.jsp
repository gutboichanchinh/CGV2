<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="my.com.entity.*"%>
<% Combo combo = (Combo) request.getAttribute("dto"); %>
<!DOCTYPE html>
<jsp:include page="../Page/Head.jsp"/>
<jsp:include page="../Page/Background.jsp"/>
<jsp:include page="../Page/Header.jsp" />
<body>
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
				 <input type="hidden" id = "comboPoster" name="comboImage" value="<%= combo.getComboImage() %>" ></input>
				<input type="hidden" id = "idCombo" name="idCombo" value="<%=combo.getIdCombo() %>" ></input>
				
				 <div class="form-group body">
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Tên Combo:</label>
							<input  class="edit-row-text" type="text" name="comboName" required id="comboName"  value="<%= combo.getComboName() %>"></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Mô tả Combo:</label>
							<input class="edit-row-text" type="text" name="comboDescription" id="comboDescription" value="<%= combo.getComboDescription() %>" required></input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Giá Combo:</label>
							<input class="edit-row-text" type="number" name="comboPrice" id="discount" required onkeydown="moneyFormat()" value="<%= combo.getComboPrice() %>"></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Số lượng:</label>
							<input class="edit-row-text" type="number" name="Number" id="startDay" value="<%= combo.getNumber() %>" required ></input>
						</div>
					
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-left">
							<label>Ảnh Combo:</label>
							<input name="anh" class="edit-row-file" type="file" id="fileupload" ><img class="border border-secondary" alt="" src="data:image/jpg;base64,${image}" width="100px" height="100px">
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