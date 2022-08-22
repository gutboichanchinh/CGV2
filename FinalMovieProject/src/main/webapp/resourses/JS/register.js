


var today = new Date();
console.log(today);
document.getElementById('Birthday').max = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
function Register(){
	var name = document.getElementById("Name").value;
	// alert(name.length)
	var user = document.getElementById("Username").value;
	var pass = document.getElementById("Password").value;
	var repass = document.getElementById("Repass").value;
	var birth = document.getElementById("Birthday").value;
	var address = document.getElementById("Address").value;
	var gmail = document.getElementById("Gmail").value;
	var phone = document.getElementById("Phone").value;

	if(user.length >= 12){
		alert("Tài khoản không quá 12 kí tự");
	}else if(pass.length >= 10){
		alert("Mật khẩu không quá 10 kí tự");

	}else if(pass != repass){
		alert("Mật khẩu không khớp");

	}else if(phone.length > 10){
		alert("Số điện thoại không đúng");	
}
}