//点击回复按钮显示回复窗口
$("#aa").on("click", function() {
	console.log("${us.user_id}");
	$("#mask").addClass("mask");
	$(".Reply").css("display", "block");
	$(".Reply").animate({
		"top": '80px',
		"opacity": 1
	}, 150);
});
//绑定页面鼠标单击隐藏回复窗口的div
$("#mask").on("click", function(e) {　　　　　　
	var target = $(e.target);　　　　　　
	if(target.closest("#mask").length == 1 && target.closest(".Reply").length == 0) {　　　　　　
		$("#mask").removeClass("mask");
		setTimeout("$('.Reply').css('display','none')", 150);
		$(".Reply").animate({
			"top": '0px',
			"opacity": 0
		}, 150);　　　　　　
	}　　　　
});
//点击关闭右上角x字符发表窗口
$("#close_span").on("click", function() {
	$("#mask").removeClass("mask");
	setTimeout("$('.Reply').css('display','none')", 150);
	$(".Reply").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})
//点击关闭按钮关闭发表窗口
$(".close").on("click", function() {
	$("#mask").removeClass("mask");
	setTimeout("$('.Reply').css('display','none')", 150);
	$(".Reply").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})
//点击发表按钮提交数据到后台控制器实现回复操作
$(".Submission").on("click", function() {
	var form = new FormData(document.getElementById("form"));
	$.ajax({
		url: window.ctx + "/fileUpload/replyUpload",
		type: "post",
		data: form,
		processData: false,
		contentType: false,
		success: function(data) {
			alert("发表成功!");
			window.location.reload();
		},
	});
})
//点击回复图片放大图片
$(".Reply_main img").on("click", function() {
	var dom = $(window.event.srcElement);
	if(dom.css("position") != "fixed") {
		dom.css("position", "fixed")
			.css("top", "0")
			.css("left", "auto")
			.css("width", "auto")
			.css("margin-left", "-5%")
			.css("height", "100vh")
			.css("z-index", "9999");
	} else {
		dom.css("position", "")
			.css("top", "")
			.css("left", "")
			.css("width", "")
			.css("margin-left", "")
			.css("height", "")
			.css("z-index", "");
	}
})
//绑定我也说一句按钮的点击显示隐藏事件
$("button[name='my_said']").on("click", function() {
	$(window.event.srcElement.parentElement.parentElement.parentElement).find(".son_replies").toggle();
})
//子回复内容点击显示或隐藏
function son_replies() {
	var replies_btn = $(window.event.srcElement);
	var son_replies = $(window.event.srcElement.parentElement.parentElement.parentElement).find(".son_replies");
	var son_replies_main = $(window.event.srcElement.parentElement.parentElement.parentElement).find(".son_replies_main");
	if(son_replies.is(':hidden')) {
		son_replies.show(100);
		son_replies_main.show(100);
		replies_btn.removeClass("replies");
		replies_btn.addClass("new_son_replies");
		replies_btn.text("收起回复");
	} else {
		son_replies.hide(100);
		son_replies_main.hide(100);
		replies_btn.removeClass("new_son_replies");
		replies_btn.addClass("replies");
		replies_btn.text("回复");
	}
}

//删除子回复
function delet_son_replies(e) {
	var con = confirm("确定删除该条子回复吗？")
	if(con == true) {
		$.post(window.ctx + "/post/deleteSonReplay", {
			"son_comment_id": e
		}, function(json) {
			if(json.message = "删除成功") {
				alert("子回复删除成功！")
				window.location.reload();
			} else {
				alert("子回复删除失败！")
				window.location.reload();
			}

		})
	}
}
//加载页面初始化数据，有子品论则显示没有则隐藏
window.onload = function() {
	var Post_Reply_right = $(".Post_Reply_right");
	console.log(Post_Reply_right);
	for(var i = 0; i < Post_Reply_right.length; i++) {
		if($(Post_Reply_right[i]).children().children().is(".son_replies_main")) {
			$(Post_Reply_right[i]).children(".Reply_time").children(".replies").addClass("new_son_replies");
			$(Post_Reply_right[i]).children().children(".son_replies_main").show();
		} else {
			$(Post_Reply_right[i]).children().children(".son_replies_main").hide();
			$(Post_Reply_right[i]).children().children(".son_replies").hide();
		}
	}
}
/*阻止表单提交默认地址*/
function func() {
	return false;
}
