
<%@page import="my.com.entity.Combo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="my.com.entity.TicketMovie"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Header.jsp" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<body>
	<div class="container-fluid">
		<div class="inside col-11 d-flex">
			<div id="choice-seat" class="col-9 left">
				<%
				List<TicketMovie> lists = (List<TicketMovie>) request.getAttribute("listseat");
				int coluum = (int) request.getAttribute("coluum");
				int row = (int) request.getAttribute("row");
				int a = coluum - 1;
				%>
				<div class="border-view">
					<div class="scroll">
						<div class="width-form">
							<div class="screan col-8 bg-light border"></div>
							<%
							int count = 0;
							for (int i = 0; i < row; i++) {
							%>
							<div class="row d-flex justify-content-center">
								<%
								for (int j = 1; j <= coluum; j++) {
								%>
								<%
								if (j == 3 || j == a) {
								%><div class="space"></div>
								<%
								}
								%>
								<%
								if (lists.get(count).isStatus() == false) {
									if (lists.get(count).isIsVip() == true) {
								%>


								<label class="seat selectedvid"> <input type="checkbox"
									class="check" value="<%=lists.get(count).getNameSeat()%>">
									<div id="<%=lists.get(count).getNameSeat()%>"><%=lists.get(count).getNameSeat()%></div>
								</label>
								<%
								} else {
								%>
								<label class="seat" style="background: white"> <input
									type="checkbox" class="check"
									value="<%=lists.get(count).getNameSeat()%>">
									<div id="<%=lists.get(count).getNameSeat()%>"><%=lists.get(count).getNameSeat()%></div>
								</label>

								<%
								}
								%>

								<%
								} else {
								%>
								<label class="seat choised"> <input type="checkbox"
									checked disabled="disabled"> <img
									src="${pageContext.request.contextPath}/resourses/IMG/disableddd.png"
									width="30px" height="30px">
								</label>

								<%
								}
								count++;
								%>
								<%
								}
								%>
							</div>
							<%
							}
							%>
							<div class="tip">
								<div class="chon col-1"></div>
								<div class="chon chonnt col-3">
									<div class="iconseat1 bg-white"></div>
									<div class="statusseat">Ghế Chưa Chọn</div>
								</div>
								<div class="chon choning col-3">
									<div class="iconseat1 bg-success"></div>
									<div class="statusseat">Ghế Đang Chọn</div>
								</div>
								<div class="chon choned col-3">
									<div class="iconseat1 bg-secondary"></div>
									<div class="statusseat">Ghế Đã Được Chọn</div>
								</div>
								<div class="chon col-1"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-10 bottom">
					<div class="left-bottom">
						<img src="IMG/2.jpg" width="100%">
					</div>
					<hr>
					<div class="right-bottom col-8">
						<div class="ticket-bottom">
							<form action="${pageContext.request.contextPath}/checkbill">
								<div class="form-group row mt-2">
									<label for="staticEmail" class="text-center fs-3">Tên
										Phim</label>
								</div>
								<div class="form-group row">
									<div class="col m-2">
										<label>Phòng : </label>
										<div class="title-title">
											<p style="width: 5em; word-wrap: break-word;">asdasdas</p>
										</div>
									</div>
									<div class="col m-2">
										<label>Số vé : </label>
										<div class="title-title">
											<p style="width: 5em; word-wrap: break-word;">asdasdas</p>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col m-2">
										<label>Ngày : </label>
										<div class="title-title">
											<p style="width: 5em; word-wrap: break-word;">asdasdas</p>
										</div>
									</div>
									<div class="col m-2">
										<label>Giờ : </label>
										<div class="title-title">
											<p style="width: 5em; word-wrap: break-word;">asdasdas</p>
										</div>
									</div>
								</div>
								<div class="form-group row m-2">
									<label for="staticEmail" class="col-3 col-form-label">Vé:</label>
									<div class="col-8">
										<p style="width: 9em; word-wrap: break-word;"
											id="staticEmailghe"></p>
										<input type="hidden" id="listseatinput" name="listseatinput"
											value=""> <input type="hidden" name="status"
											value="1"> <input type="hidden" name="idshow"
											value="${idshow}">
									</div>
								</div>
								<div class="form-group row">
									<div class="col m-3">
										<label>Combo : </label>
										<p style="width: 11em; word-wrap: break-word;"
											id="odered-combo2"></p>
									</div>
								</div>
								<div class="form-group row" style="margin-top: 35%; width: 60%;">

									<div id=""></div>

									<input id="choning2" name="chonghe" type="button"
										value="Chon do an" onclick="changeseat2()">

								</div>
								<div class="form-group row" style="margin: 0 auto; width: 60%;">
									<input type="submit" style="margin: 25px auto;"
										value="Tiep Tuc">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="choice-food" class="leftt col-9 row" hidden="hidden">
				<div style="height: 785px;">
					<div class="combo-left col-12 row">
						<c:set scope="request" var="count" value="0"></c:set>
						<c:forEach items="${listcombo}" var="combo">
							<div class="combo-tag row col-12">
								<div class="col-img col-2" style="padding: 25px 10px">
									<div class="combo-img" ><img src="data:image/jpg;base64,${listimg.get(count).getImgString()}" width="100px" height="100px"></div>
								</div>
								<div class="col-inf col-4">
									<div class="combo-name">${combo.comboName}</div>
									<div class="combo-inf">${combo.comboDescription}</div>
								</div>
								<div class="col-number col-2">
									<div class="input-counter">
										<span class="minus-btn" onclick="minus(this)"><i
											class="fa-solid fa-minus"></i></span> <input class="input-number"
											onchange="comboUpdate(this)" type="text" value="0"> <span
											class="plus-btn" type="button" onclick="plus(this)"><i
											class="fa-solid fa-plus"></i></span>
									</div>
								</div>
								<div class="col-price col-2">${combo.comboPrice}</div>
								<div class="col-total-price col-2">0</div>
							</div>
							<c:set scope="request" var="count" value="${count+1}"></c:set>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-3 right">
				<div class="ticket">
					<form action="${pageContext.request.contextPath}/checkbill">
						<div class="form-group row">
							<div class="col-sm-12 mt-3">
								<img src="data:image/jpg;base64,${anhphim}" width="100%"
									height="150px">
							</div>
						</div>
						<hr>
						<div class="form-group row mt-2">
							<label for="staticEmail" class="text-center fs-3">${movie.name}</label>
						</div>
						<div class="form-group row">
							<div class="col m-3">
								<label>Phòng : </label>
								<p style="width: 8em; word-wrap: break-word;">${room.roomName}</p>
							</div>
						</div>
						<div class="form-group row">
							<div class="col m-3">
								<label>Ngày : </label>
								<p style="width: 8em; word-wrap: break-word;">${show.day}</p>
							</div>
						</div>
						<div class="form-group row">
							<div class="col m-3">
								<label>Giờ : </label>
								<p style="width: 8em; word-wrap: break-word;">${show.time}</p>
							</div>
						</div>
						<div class="form-group row">
							<div class="col m-3">
								<label>Vé : </label>
								<p style="width: 11em; word-wrap: break-word;"
									id="staticEmailghe2"></p>
								<input type="hidden" id="listseatinput2" name="listseatinput"
									value=""> <input type="hidden" name="idshow"
									value="${idshow}"> <input type="hidden" name="status"
									value="1">
							</div>
						</div>
						<div class="form-group row">
							<div class="col m-3">
								<label>Combo : </label>
								<p style="width: 11em; word-wrap: break-word;" id="odered-combo"></p>
								<input value="null" id="odered-combo3" type="hidden"
									name="descripcombo"> <input value="0" id="emdeplam"
									type="hidden" name="pricecombo">
							</div>
						</div>
						<div class="form-group row" style="margin-top: 35%; width: 60%;">

							<div id=""></div>

							<input id="choning" name="chonghe" type="button"
								value="Chon do an" onclick="changeseat()">

						</div>

						<div class="form-group row" style="width: 60%;">
							<input type="submit" value="Tiep Tuc">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
    var loader = document.getElementById("wrapper");
    window.addEventListener("load", setTimeout(function () {
        loader.style.display = "none";
    }, 1500));
</script>
<script class="chua te scrip">
    const map = new Map();
    var muaxuanhoano = 0;
    var emdeplam = document.getElementById("emdeplam");
    function plus(button) {
    	
    	
        var bu = document.getElementsByClassName('plus-btn');
        for (var i = 0; i < bu.length; i++) {
            if (bu[i] == button) {
                /*add1*/
                var input = document.getElementsByClassName("input-number");
                var oldValue = parseInt(input[i].value) + 1;
                input[i].value = oldValue;
                /*change total price*/
                var price = document.getElementsByClassName("col-price");
                var totalPrice = document.getElementsByClassName("col-total-price");
                totalPrice[i].innerHTML = parseInt(totalPrice[i].innerHTML) + parseInt(price[i].innerHTML);
                muaxuanhoano = muaxuanhoano + parseInt(price[i].innerHTML)
                
                /*add to combo list*/
                var oderedList = document.getElementById("odered-combo");
                var oderedList3 = document.getElementById("odered-combo3");
                var comboName = document.getElementsByClassName("combo-name");
                if (!map.has(comboName[i].innerHTML)) {
                    map.set(comboName[i].innerHTML, 1);
                } else {

                    map.set(comboName[i].innerHTML, parseInt(map.get(comboName[i].innerHTML)) + 1);
                }
                /*in*/
                let text = "";
                map.forEach(function (value, key) {
                    text += key + '(' + value + '), ';
                })
                oderedList.innerHTML = text;
                oderedList3.value = text;
                emdeplam.value=muaxuanhoano;
				
            }


        }
    }

    function minus(button) {
        var bu = document.getElementsByClassName('minus-btn');
        for (var i = 0; i < bu.length; i++) {
            if (bu[i] == button) {
                /*minus1*/
                var input = document.getElementsByClassName("input-number");
                if (parseInt(input[i].value) > 0) {
                    var oldValue = parseInt(input[i].value) - 1;
                    input[i].value = oldValue;
                    /*change total price*/
                    var price = document.getElementsByClassName("col-price");
                    var totalPrice = document.getElementsByClassName("col-total-price");
                    totalPrice[i].innerHTML = parseInt(totalPrice[i].innerHTML) - parseInt(price[i].innerHTML);
                    muaxuanhoano = muaxuanhoano - parseInt(price[i].innerHTML)
                    /*remove from combo list*/
                    var oderedList = document.getElementById("odered-combo");
                    var oderedList2 = document.getElementById("odered-combo2");
                    var comboName = document.getElementsByClassName("combo-name");
                    if (parseInt(map.get(comboName[i].innerHTML)) == 1) {
                        map.delete(comboName[i].innerHTML, 1);
                    } else {

                        map.set(comboName[i].innerHTML, map.get(comboName[i].innerHTML) - 1);
                    }
                    let text = "";
                    map.forEach(function (value, key) {
                        text += key + '(' + value + '), ';
                    })
                    oderedList.innerHTML = text;
                    oderedList2.innerHTML = text;
                    emdeplam.value=muaxuanhoano;
                } else {
                    input[i].value = 0;
                    
                }
            }

        }
    }
    /*INPUT*/
    function comboUpdate(element){
        var input = document.getElementsByClassName("input-number");
        var price = document.getElementsByClassName("col-price");
        var totalPrice = document.getElementsByClassName("col-total-price");
        for (var i = 0; i < input.length; i++) {
        if(input[i]==element){
            /* var price = document.getElementsByClassName("col-price");
            var totalPrice = document.getElementsByClassName("col-total-price"); */
            if(parseInt(input[i].value) >= 0){
            totalPrice[i].innerHTML = parseInt(input[i].value) * parseInt(price[i].innerHTML);  
            /*add in to combo*/
            var oderedList = document.getElementById("odered-combo");
            var comboName = document.getElementsByClassName("combo-name");
              
                    map.set(comboName[i].innerHTML, input[i].value);
                
            } else{
                totalPrice[i].innerHTML = 0;
                input[i].value=0;
            }
            /*in*/
            let text = "";
                map.forEach(function (value, key) {
                    text += key + '(' + value + '), ';
                })
                oderedList.innerHTML = text;
        }    
    }
        muaxuanhoano=0;
        for (var i = 0; i < input.length; i++) {
        	muaxuanhoano = muaxuanhoano + parseInt(totalPrice[i].innerHTML);
        }    
        emdeplam.value=muaxuanhoano;
}

</script>
<!-- phan khac -->
<script>
    function changeseat() {
        var click = document.getElementById("choning").value
        if (click == "Chon ghe") {
            document.getElementById("choning").value = "Chon do an";
            document.getElementById("choice-seat").removeAttribute("hidden");
            document.getElementById("choice-food").setAttribute("hidden", "hidden");
        } else {
            document.getElementById("choning").value = "Chon ghe";
            document.getElementById("choice-food").removeAttribute("hidden");
            document.getElementById("choice-seat").setAttribute("hidden", "hidden");
        }
    }
    function changeseat2() {
        var click = document.getElementById("choning2").value
        if (click == "Chon ghe") {
            document.getElementById("choning2").value = "Chon do an";
            document.getElementById("choice-seat").removeAttribute("hidden");
            document.getElementById("choice-food").setAttribute("hidden", "hidden");
        } else {
            document.getElementById("choning2").value = "Chon ghe";
            document.getElementById("choice-food").removeAttribute("hidden");
            document.getElementById("choice-seat").setAttribute("hidden", "hidden");
        }
    }
    const left = document.querySelector('.left');
    var arr = [];
    function updateselect() {
        const select = document.querySelectorAll('.selected');
        document.getElementById('staticEmailghe').innerHTML = arr.sort();
        document.getElementById('listseatinput').value = arr.sort();
        document.getElementById('listseatinput2').value = arr.sort();
        document.getElementById('staticEmailghe2').innerHTML = arr.sort();
    }
    left.addEventListener('change', (e) => {
        var ele = document.getElementById(e.target.value)
        if (!e.target.classList.contains('selected')) {
            if (e.target.value != 'on') {
                e.target.classList.add('selected')
                arr.push(e.target.value);
                ele.style.background = "#2ee38f";
            }
        } else {
            e.target.classList.remove('selected')
            var index = arr.indexOf(e.target.value);
            if (index > -1) {
                arr.splice(index, 1);
            }
            ele.style.background = "none";
        }
        updateselect();
    });
</script>
<jsp:include page="../Page/Footer.jsp" />
</html>