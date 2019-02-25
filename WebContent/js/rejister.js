//用户验证
$("#user_name").on("blur", function() {
	if($("#user_name").val().trim() == "") {
		$("#user_name").css("border", "1px solid red");
		$("#user_name_span").text("用户名不能为空")
			.show(300)
	}else if($("#user_name").val().length > 6){
		$("#user_name").css("border", "1px solid red");
		$("#user_name_span").text("注册的用户名不能超过6个长度")
			.show(300)
	}else {
		$("#user_name").css("border", "1px solid greenyellow")
		$("#user_name_span").hide();
	}
})
//密码验证
$("#user_pwd").on("blur", function() {
	if($("#user_pwd").val().trim() == "") {
		$("#user_pwd").css("border", "1px solid red");
		$("#user_pwd_span").text("密码不能为空")
			.show(300)
	} else {
		$("#user_pwd").css("border", "1px solid greenyellow")
		$("#user_pwd_span").hide();
	}
})
//再次输入密码验证
$("#re_user_pwd").on("blur", function() {
	if($("#re_user_pwd").val().trim() == "") {
		$("#re_user_pwd").css("border", "1px solid red");
		$("#re_pwd_span").text("再次输入密码不能为空")
			.show(300)
	} else if($("#re_user_pwd").val().trim() != $("#user_pwd").val().trim()) {
		$("#re_user_pwd").css("border", "1px solid red");
		$("#re_pwd_span").text("密码与再次输入密码不一致")
			.show(300)

	} else {
		$("#re_user_pwd").css("border", "1px solid greenyellow")
		$("#re_pwd_span").hide();
	}
})
//跳转登录页面
$(".login-btn").on("click", function() {
	window.location.href = window.ctx + "/user/login";
})