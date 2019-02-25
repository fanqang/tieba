$(function() {
	var show_num = [];
	draw(show_num);

	$("#canvas").on('click', function() {
			draw(show_num);
		})
		//登录验证码验证
	$(".input-val").on("blur", function() {
			var login_val = $(".input-val").val().toLowerCase();
			var login_num = show_num.join("");
			if(login_val.trim() == "") {
				$("#verification_span").html("验证码不能为空");
				$("#verification_span").css("color", "red");
				$(".input-val").css("border", "1px solid red");
			} else if(login_val == login_num) {
				$("#verification_span").html("√");
				$("#verification_span").css("color", "greenyellow");
				$(".input-val").css("border", "1px solid greenyellow");
			} else {
				$("#verification_span").html("验证码错误,请重新输入");
				$("#verification_span").css("color", "red");
				$(".input-val").css("border", "1px solid red");
				draw(show_num);
			}
		})
		//绑定登录方法
	$("#Login-btn").on("click", function() {
			var user_name = $("#user_name");
			var user_pwd = $("#user_pwd");
			if(user_name.val().trim() == "") {
				$("#name_span").html("用户名不能为空");
				$("#name_span").css("color", "red");
				$("#name").css("border-bottom", "2px solid red");
			}
			if(user_pwd.val().trim() == "") {
				$("#pwd_span").html("密码不能为空");
				$("#pwd_span").css("color", "red");
				$("#pwd").css("border-bottom", "2px solid red");
			}
			if($(".input-val").val().trim() == "") {
				$("#verification_span").html("验证码不能为空");
				$("#verification_span").css("color", "red");
				$(".input-val").css("border", "1px solid red");
				return false;
			}
			$.post(window.ctx + "/user/login.action", {
				"user_name": window.user_name,
				"user_pwd": window.user_pwd
			}, function(json) {
				console.log(json.message);
				if(json.message == "repeat") {
					alert("该用户已经登录，请退出重新登录!");
				} else if(json.message == "error") {
					alert("用户名或者密码错误,请重新输入!");
					window.location.reload();
				} else if(json.weight == 2) {
					window.location.href = window.ctx + "/user/homePage";
				} else if(json.weight == 1) {
					window.location.href = window.ctx + "/user/administrators";
				}

			})
		})
		//注册验证码验证
	$(".input-register").on("blur", function() {
			window.register_val = $(".input-register").val().toLowerCase();
			window.register_num = show_num.join("");
			if(window.register_val.trim() == "") {
				$(".input-register").css("border", "1px solid red");
				$("#register_verification_span").text("验证码不能为空")
					.show(300)
			} else if(window.register_val != window.register_num) {
				$(".input-register").css("border", "1px solid red")
				$("#register_verification_span").text("验证码不正确")
					.show(300)
			} else {
				$(".input-register").css("border", "1px solid greenyellow")
				$("#register_verification_span").hide()
			}
		})
		//绑定注册方法
	$(".register-btn").on("click", function() {
		if($("#user_name").val().trim() == "") {
			$("#user_name").css("border", "1px solid red");
			$("#user_name_span").text("用户名不能为空")
				.show(300)
		}
		if($("#user_pwd").val().trim() == "") {
			$("#user_pwd").css("border", "1px solid red");
			$("#user_pwd_span").text("密码不能为空")
				.show(300)
		}
		if($("#re_user_pwd").val().trim() == "") {
			$("#re_user_pwd").css("border", "1px solid red");
			$("#re_pwd_span").text("再次输入密码不能为空")
				.show(300)
		}
		if($(".input-register").val().trim() == "") {
			$(".input-register").css("border", "1px solid red");
			$("#register_verification_span").text("验证码不能为空")
				.show(300)
				return false;
		}
		$.post(window.ctx + "/user/register.action", {
			"user_name": $("#user_name").val(),
			"user_pwd": $("#user_pwd").val(),
			"imageurl": "/user_img/default-user.jpg"
		}, function(json) {
			console.log(json.message);
			if(json.message == "ok") {
				alert("注册成功");
				window.location.href = window.ctx + "/user/login";
			} else if(json.message == "error") {
				alert("注册失败");
			} else {
				alert("该用户已被注册,请更换用户名重新注册!");
			}
		})

	})
})

function draw(show_num) {
	var canvas_width = $('#canvas').width();
	var canvas_height = $('#canvas').height();
	var canvas = document.getElementById("canvas"); //获取到canvas的对象，演员
	var context = canvas.getContext("2d"); //获取到canvas画图的环境，演员表演的舞台
	canvas.width = canvas_width;
	canvas.height = canvas_height;
	var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
	var aCode = sCode.split(",");
	var aLength = aCode.length; //获取到数组的长度

	for(var i = 0; i <= 3; i++) {
		var j = Math.floor(Math.random() * aLength); //获取到随机的索引值
		var deg = Math.random() * 30 * Math.PI / 180; //产生0~30之间的随机弧度
		var txt = aCode[j]; //得到随机的一个内容
		show_num[i] = txt.toLowerCase();
		var x = 10 + i * 20; //文字在canvas上的x坐标
		var y = 20 + Math.random() * 8; //文字在canvas上的y坐标
		context.font = "bold 23px 微软雅黑";

		context.translate(x, y);
		context.rotate(deg);

		context.fillStyle = randomColor();
		context.fillText(txt, 0, 0);

		context.rotate(-deg);
		context.translate(-x, -y);
	}
	for(var i = 0; i <= 5; i++) { //验证码上显示线条
		context.strokeStyle = randomColor();
		context.beginPath();
		context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
		context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
		context.stroke();
	}
	for(var i = 0; i <= 30; i++) { //验证码上显示小点
		context.strokeStyle = randomColor();
		context.beginPath();
		var x = Math.random() * canvas_width;
		var y = Math.random() * canvas_height;
		context.moveTo(x, y);
		context.lineTo(x + 1, y + 1);
		context.stroke();
	}
}

function randomColor() { //得到随机的颜色值
	var r = Math.floor(Math.random() * 256);
	var g = Math.floor(Math.random() * 256);
	var b = Math.floor(Math.random() * 256);
	return "rgb(" + r + "," + g + "," + b + ")";
}