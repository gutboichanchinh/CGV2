<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="my.com.entity.TypeMovie"%>
<%@page import="my.com.entity.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>

<script
	src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<jsp:include page="../Page/Head.jsp"/>
<jsp:include page="../Page/Background.jsp"/>
<jsp:include page="../Page/Header.jsp" />
	<div class="container">
	<% Movie data = (Movie) request.getAttribute("list"); %>
	<% List<TypeMovie> list= (List<TypeMovie>) request.getAttribute("type"); %>
		<div class="editmovie">
			<form class="edit"  method="post" enctype="multipart/form-data">
				<div class="form-group header">
					<div class="Topic">
						<h1>Thông tin phim</h1>
						<h2 class="alert">${msg}</h2>
					</div>
				</div>
				<div class="form-group body">
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Tên phim:</label> <input class="edit-row-text" name="name" value="<%=data.getName() %>" type="text"></input>
							
						</div>
						<div class="form-group edit-row-left">
							<label>Thể loại: </label> <select class="edit-row-check"
								id="typemovie" multiple="multiple"  name="movieTypes1" >
<%-- 								<c:forEach var="p" items="${type}"> --%>
<%-- 								<option value="${p.id}">${p.name}</option> --%>
<%-- 								</c:forEach> --%>


						<%

								for(TypeMovie type: data.getMovieTypes()){
										for(int i=0;i<list.size();i++){
											if(type.getId()==list.get(i).getId()){
												list.remove(list.get(i));
												i=0;
// 												System.out.print("True");
												break;
											}else{
// 												System.out.print("False");
											}
										}
										
									out.print("<option value="+type.getId()+" selected>"+type.getName()+"</option>");

								}	
								for(TypeMovie all:list){
									
									out.print("<option value="+all.getId()+">"+all.getName()+"</option>");
								}

						%>
							</select>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Thời lượng:</label> <input class="edit-row-text"
								type="text" name="time" value="<%=data.getTime() %>"></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Quốc gia: </label> <select class="edit-row-checkcountry" name="country" id="country">
								<option>select country</option>
								<option value="AF">Afghanistan</option>
								<option value="AX">Aland Islands</option>
								<option value="AL">Albania</option>
								<option value="DZ">Algeria</option>
								<option value="AS">American Samoa</option>
								<option value="AD">Andorra</option>
								<option value="AO">Angola</option>
								<option value="AI">Anguilla</option>
								<option value="AQ">Antarctica</option>
								<option value="AG">Antigua and Barbuda</option>
								<option value="AR">Argentina</option>
								<option value="AM">Armenia</option>
								<option value="AW">Aruba</option>
								<option value="AU">Australia</option>
								<option value="AT">Austria</option>
								<option value="AZ">Azerbaijan</option>
								<option value="BS">Bahamas</option>
								<option value="BH">Bahrain</option>
								<option value="BD">Bangladesh</option>
								<option value="BB">Barbados</option>
								<option value="BY">Belarus</option>
								<option value="BE">Belgium</option>
								<option value="BZ">Belize</option>
								<option value="BJ">Benin</option>
								<option value="BM">Bermuda</option>
								<option value="BT">Bhutan</option>
								<option value="BO">Bolivia</option>
								<option value="BQ">Bonaire, Sint Eustatius and Saba</option>
								<option value="BA">Bosnia and Herzegovina</option>
								<option value="BW">Botswana</option>
								<option value="BV">Bouvet Island</option>
								<option value="BR">Brazil</option>
								<option value="IO">British Indian Ocean Territory</option>
								<option value="BN">Brunei Darussalam</option>
								<option value="BG">Bulgaria</option>
								<option value="BF">Burkina Faso</option>
								<option value="BI">Burundi</option>
								<option value="KH">Cambodia</option>
								<option value="CM">Cameroon</option>
								<option value="CA">Canada</option>
								<option value="CV">Cape Verde</option>
								<option value="KY">Cayman Islands</option>
								<option value="CF">Central African Republic</option>
								<option value="TD">Chad</option>
								<option value="CL">Chile</option>
								<option value="CN">China</option>
								<option value="CX">Christmas Island</option>
								<option value="CC">Cocos (Keeling) Islands</option>
								<option value="CO">Colombia</option>
								<option value="KM">Comoros</option>
								<option value="CG">Congo</option>
								<option value="CD">Congo, Democratic Republic of the
									Congo</option>
								<option value="CK">Cook Islands</option>
								<option value="CR">Costa Rica</option>
								<option value="CI">Cote D'Ivoire</option>
								<option value="HR">Croatia</option>
								<option value="CU">Cuba</option>
								<option value="CW">Curacao</option>
								<option value="CY">Cyprus</option>
								<option value="CZ">Czech Republic</option>
								<option value="DK">Denmark</option>
								<option value="DJ">Djibouti</option>
								<option value="DM">Dominica</option>
								<option value="DO">Dominican Republic</option>
								<option value="EC">Ecuador</option>
								<option value="EG">Egypt</option>
								<option value="SV">El Salvador</option>
								<option value="GQ">Equatorial Guinea</option>
								<option value="ER">Eritrea</option>
								<option value="EE">Estonia</option>
								<option value="ET">Ethiopia</option>
								<option value="FK">Falkland Islands (Malvinas)</option>
								<option value="FO">Faroe Islands</option>
								<option value="FJ">Fiji</option>
								<option value="FI">Finland</option>
								<option value="FR">France</option>
								<option value="GF">French Guiana</option>
								<option value="PF">French Polynesia</option>
								<option value="TF">French Southern Territories</option>
								<option value="GA">Gabon</option>
								<option value="GM">Gambia</option>
								<option value="GE">Georgia</option>
								<option value="DE">Germany</option>
								<option value="GH">Ghana</option>
								<option value="GI">Gibraltar</option>
								<option value="GR">Greece</option>
								<option value="GL">Greenland</option>
								<option value="GD">Grenada</option>
								<option value="GP">Guadeloupe</option>
								<option value="GU">Guam</option>
								<option value="GT">Guatemala</option>
								<option value="GG">Guernsey</option>
								<option value="GN">Guinea</option>
								<option value="GW">Guinea-Bissau</option>
								<option value="GY">Guyana</option>
								<option value="HT">Haiti</option>
								<option value="HM">Heard Island and Mcdonald Islands</option>
								<option value="VA">Holy See (Vatican City State)</option>
								<option value="HN">Honduras</option>
								<option value="HK">Hong Kong</option>
								<option value="HU">Hungary</option>
								<option value="IS">Iceland</option>
								<option value="IN">India</option>
								<option value="ID">Indonesia</option>
								<option value="IR">Iran, Islamic Republic of</option>
								<option value="IQ">Iraq</option>
								<option value="IE">Ireland</option>
								<option value="IM">Isle of Man</option>
								<option value="IL">Israel</option>
								<option value="IT">Italy</option>
								<option value="JM">Jamaica</option>
								<option value="JP">Japan</option>
								<option value="JE">Jersey</option>
								<option value="JO">Jordan</option>
								<option value="KZ">Kazakhstan</option>
								<option value="KE">Kenya</option>
								<option value="KI">Kiribati</option>
								<option value="KP">Korea, Democratic People's Republic
									of</option>
								<option value="KR">Korea, Republic of</option>
								<option value="XK">Kosovo</option>
								<option value="KW">Kuwait</option>
								<option value="KG">Kyrgyzstan</option>
								<option value="LA">Lao People's Democratic Republic</option>
								<option value="LV">Latvia</option>
								<option value="LB">Lebanon</option>
								<option value="LS">Lesotho</option>
								<option value="LR">Liberia</option>
								<option value="LY">Libyan Arab Jamahiriya</option>
								<option value="LI">Liechtenstein</option>
								<option value="LT">Lithuania</option>
								<option value="LU">Luxembourg</option>
								<option value="MO">Macao</option>
								<option value="MK">Macedonia, the Former Yugoslav
									Republic of</option>
								<option value="MG">Madagascar</option>
								<option value="MW">Malawi</option>
								<option value="MY">Malaysia</option>
								<option value="MV">Maldives</option>
								<option value="ML">Mali</option>
								<option value="MT">Malta</option>
								<option value="MH">Marshall Islands</option>
								<option value="MQ">Martinique</option>
								<option value="MR">Mauritania</option>
								<option value="MU">Mauritius</option>
								<option value="YT">Mayotte</option>
								<option value="MX">Mexico</option>
								<option value="FM">Micronesia, Federated States of</option>
								<option value="MD">Moldova, Republic of</option>
								<option value="MC">Monaco</option>
								<option value="MN">Mongolia</option>
								<option value="ME">Montenegro</option>
								<option value="MS">Montserrat</option>
								<option value="MA">Morocco</option>
								<option value="MZ">Mozambique</option>
								<option value="MM">Myanmar</option>
								<option value="NA">Namibia</option>
								<option value="NR">Nauru</option>
								<option value="NP">Nepal</option>
								<option value="NL">Netherlands</option>
								<option value="AN">Netherlands Antilles</option>
								<option value="NC">New Caledonia</option>
								<option value="NZ">New Zealand</option>
								<option value="NI">Nicaragua</option>
								<option value="NE">Niger</option>
								<option value="NG">Nigeria</option>
								<option value="NU">Niue</option>
								<option value="NF">Norfolk Island</option>
								<option value="MP">Northern Mariana Islands</option>
								<option value="NO">Norway</option>
								<option value="OM">Oman</option>
								<option value="PK">Pakistan</option>
								<option value="PW">Palau</option>
								<option value="PS">Palestinian Territory, Occupied</option>
								<option value="PA">Panama</option>
								<option value="PG">Papua New Guinea</option>
								<option value="PY">Paraguay</option>
								<option value="PE">Peru</option>
								<option value="PH">Philippines</option>
								<option value="PN">Pitcairn</option>
								<option value="PL">Poland</option>
								<option value="PT">Portugal</option>
								<option value="PR">Puerto Rico</option>
								<option value="QA">Qatar</option>
								<option value="RE">Reunion</option>
								<option value="RO">Romania</option>
								<option value="RU">Russian Federation</option>
								<option value="RW">Rwanda</option>
								<option value="BL">Saint Barthelemy</option>
								<option value="SH">Saint Helena</option>
								<option value="KN">Saint Kitts and Nevis</option>
								<option value="LC">Saint Lucia</option>
								<option value="MF">Saint Martin</option>
								<option value="PM">Saint Pierre and Miquelon</option>
								<option value="VC">Saint Vincent and the Grenadines</option>
								<option value="WS">Samoa</option>
								<option value="SM">San Marino</option>
								<option value="ST">Sao Tome and Principe</option>
								<option value="SA">Saudi Arabia</option>
								<option value="SN">Senegal</option>
								<option value="RS">Serbia</option>
								<option value="CS">Serbia and Montenegro</option>
								<option value="SC">Seychelles</option>
								<option value="SL">Sierra Leone</option>
								<option value="SG">Singapore</option>
								<option value="SX">Sint Maarten</option>
								<option value="SK">Slovakia</option>
								<option value="SI">Slovenia</option>
								<option value="SB">Solomon Islands</option>
								<option value="SO">Somalia</option>
								<option value="ZA">South Africa</option>
								<option value="GS">South Georgia and the South Sandwich
									Islands</option>
								<option value="SS">South Sudan</option>
								<option value="ES">Spain</option>
								<option value="LK">Sri Lanka</option>
								<option value="SD">Sudan</option>
								<option value="SR">Suriname</option>
								<option value="SJ">Svalbard and Jan Mayen</option>
								<option value="SZ">Swaziland</option>
								<option value="SE">Sweden</option>
								<option value="CH">Switzerland</option>
								<option value="SY">Syrian Arab Republic</option>
								<option value="TW">Taiwan, Province of China</option>
								<option value="TJ">Tajikistan</option>
								<option value="TZ">Tanzania, United Republic of</option>
								<option value="TH">Thailand</option>
								<option value="TL">Timor-Leste</option>
								<option value="TG">Togo</option>
								<option value="TK">Tokelau</option>
								<option value="TO">Tonga</option>
								<option value="TT">Trinidad and Tobago</option>
								<option value="TN">Tunisia</option>
								<option value="TR">Turkey</option>
								<option value="TM">Turkmenistan</option>
								<option value="TC">Turks and Caicos Islands</option>
								<option value="TV">Tuvalu</option>
								<option value="UG">Uganda</option>
								<option value="UA">Ukraine</option>
								<option value="AE">United Arab Emirates</option>
								<option value="GB">United Kingdom</option>
								<option value="US">United States</option>
								<option value="UM">United States Minor Outlying Islands</option>
								<option value="UY">Uruguay</option>
								<option value="UZ">Uzbekistan</option>
								<option value="VU">Vanuatu</option>
								<option value="VE">Venezuela</option>
								<option value="VN">Viet Nam</option>
								<option value="VG">Virgin Islands, British</option>
								<option value="VI">Virgin Islands, U.s.</option>
								<option value="WF">Wallis and Futuna</option>
								<option value="EH">Western Sahara</option>
								<option value="YE">Yemen</option>
								<option value="ZM">Zambia</option>
								<option value="ZW">Zimbabwe</option>
							</select>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Khởi chiếu:</label> <input class="edit-row-text"
								type="date" name="dateOpen" value="<%=data.getDateOpen() %>" ></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Ngôn ngữ: </label> <select id="phude" name="language" >
								<option value="1" >Thuyết minh</option>
								<option value="2" selected>Phụ đề</option>
								<option value="3">Lồng tiếng</option>
						
							</select>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Mô tả:</label> <input class="edit-row-text" name="description" value="<%=data.getDescription() %>" type="text"></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Đạo diễn: </label> <input class="edit-row-text"
								type="text" name="director" value="<%=data.getDirector() %>" ></input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Diễn viên:</label> <input class="edit-row-text"
								type="text" name="actor"  value="<%=data.getActor() %>"></input>
						</div>
						<div class="form-group edit-row-left">
							<label>Năm:</label> <input class="edit-row-text"
								type="text" name="year"  value="<%=data.getYear() %>"></input>
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-right">
							<label>Ảnh Poster:</label> <input name="anhdoc" class="edit-row-file"
								type="file" id="uploadPoster" ></input>
								<input  name="poster" id="poster" value="" type="hidden"/>
								<img class="border border-secondary" alt="" src="data:image/jpg;base64,${poster}" width="100px" height="100px">
						</div>
						<div class="form-group edit-row-left">
							<label>Ảnh Banner: </label> <input name="anhngang" class="edit-row-file"
								type="file" id="uploadBanner"></input>
								<input  name="banner" id="banner" value="" type="hidden"  />
								<img class="border border-secondary" alt="" src="data:image/jpg;base64,${banner}" width="100px" height="100px">
						</div>
					</div>
					<div class="form-group edit-row">
						<div class="form-group edit-row-left">
							<label>Phim: </label> <select id="phim" name="category">
								<option value="1">Đang chiếu</option>
								<option value="2">Sắp chiếu</option>
								<option value="3">Hết chiếu</option>
							</select>
						</div>
						
					</div>
					<div class="form-group footer">
						<button class="update" type="submit">
							<i class="icon-md-lock">Cap nhap</i>
						</button>
						<a href="${pageContext.request.contextPath}/admin/movie/delete/<%=data.getId() %>"><button class="delete" type="button">
							<i class="icon-md-lock">Xoa</i>
						</button></a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
		$('#typemovie').multiselect({
			includeSelectAllOption : true
		});
		$('#phude').multiselect({
			includeSelectAllOption : true
		});
		$('#phim').multiselect({
			includeSelectAllOption : true
		});
		$(function()
                {
                    $("#uploadPoster").change(function(event){
                        var x = event.target.files[0].name;
                         var imgName = document.getElementById("poster");
                        imgName.value = x;
                        imgName.innerHTML(x);
                    });
                })
        $(function()
                {
                    $("#uploadBanner").change(function(event){
                        var x = event.target.files[0].name;
                         var imgName = document.getElementById("banner");
                        imgName.value = x;
                        imgName.innerHTML(x);
                    });
                })
	</script>
</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp"/>
