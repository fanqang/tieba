//点击修改按钮显示修改窗口并将数据显示出来
function modifyUser(e) {
	$.post(window.crx + "/admin/updateUser", {
		"user_id": e
	}, function(json) {
		$("input[name='user_id']").val(json.user.user_id);
		$("input[name='user_name']").val(json.user.user_name);
		$("input[name='user_pwd']").val(json.user.user_pwd);
		$("input[name='user_weight']").val(json.user.weight);
	})
	$("#mask").addClass("mask");
	$(".modify-user").css("display", "block");
	$(".modify-user").animate({
		"top": '80px',
		"opacity": 1
	}, 150);
}
//删除用户条目
function deleteUser(e) {
	var con = confirm("注意！删除此条用户将会级联删除该用户发布的所有帖子和回复，您还要继续删除吗？")
	if(con == true) {
		$.post(window.ctx + "/admin/deleteUser", {
			"user_id": e
		}, function(json) {
			alert("删除成功");
			window.location.reload();
		})
	}
}
//绑定页面鼠标单击隐藏修改用户信息的div
$("#mask").on("click", function(e) {　　　　　　
	var target = $(e.target);　　　　　　
	if(target.closest("#mask").length == 1 && target.closest(".modify-user").length == 0) {　　　　　　
		$("#mask").removeClass("mask");
		setTimeout("$('.modify-user').css('display','none')", 150);
		$(".modify-user").animate({
			"top": '0px',
			"opacity": 0
		}, 150);　　　　　　
	}　　　　
});
//点击关闭右上角x字符关闭修改用户窗口
$("#close_span").on("click", function() {
	$("#mask").removeClass("mask");
	setTimeout("$('.modify-user').css('display','none')", 150);
	$(".modify-user").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})
//点击关闭按钮关闭修改用户窗口
$(".close").on("click", function() {
	$("#mask").removeClass("mask");
	setTimeout("$('.modify-user').css('display','none')", 150);
	$(".modify-user").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})
//点击发表按钮提交数据到后台控制器
$(".Submission").on("click", function() {
	var user_id = $("input[name='user_id']").val();
	var user_name = $("input[name='user_name']").val();
	var user_pwd = $("input[name='user_pwd']").val();
	$.post(window.ctx + "/admin/updateUser.action", {
		"user_name": user_name,
		"user_pwd": user_pwd,
		"user_id": user_id
	}, function(json) {
		alert("用户信息更新成功！");
		window.location.reload();
	})
})