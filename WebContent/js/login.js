function get_name() {
	$("#name").css("border-bottom", "2px solid #000000");

}

function get_pwd() {
	$("#pwd").css("border-bottom", "2px solid #000000");
}
//用户名验证
function text_name() {
	$("#name").css("border-bottom", "");
	window.user_name = $("#user_name").val();
	if(window.user_name.trim() == "") {
		$("#name_span").html("用户名不能为空");
		$("#name_span").css("color", "red");
		$("#name").css("border-bottom", "2px solid red");
	} else {
		$("#name_span").html("√");
		$("#name_span").css("color", "greenyellow");
		$("#name").css("border-bottom", "2px solid greenyellow");
	}

}
//密码验证
function text_pwd() {
	$("#pwd").css("border-bottom", "");
	window.user_pwd = $("#user_pwd").val();
	if(window.user_pwd.trim() == "") {
		$("#pwd_span").html("密码不能为空");
		$("#pwd_span").css("color", "red");
		$("#pwd").css("border-bottom", "2px solid red");
	} else {
		$("#pwd_span").html("√");
		$("#pwd_span").css("color", "greenyellow");
		$("#pwd").css("border-bottom", "2px solid greenyellow");
	}
}
//注册按钮跳转注册页面
function Register() {
	window.location.href = window.ctx + "/user/register";
}