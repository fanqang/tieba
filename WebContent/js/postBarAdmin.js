//点击修改按钮显示修改贴吧窗口并将数据显示出来
function updatePostBar(e) {
	$.post(window.ctx + "/admin/updatePostBar", {
		"bar_id": e
	}, function(json) {
		console.log(json);
		$("input[name='bar_id']").val(json.bar.bar_id);
		$("input[name='bar_name']").val(json.bar.bar_name);
		$("#headimg").attr("src", json.bar.img_url);
	})
	$("#mask").addClass("mask");
	$(".modify-postBar").css("display", "block");
	$(".modify-postBar").animate({
		"top": '80px',
		"opacity": 1
	}, 150);
}
//点击添加贴吧按钮显示添加贴吧窗口并将数据显示出来
function addBar() {
	$("#mask2").addClass("mask");
	$(".add-postBar").css("display", "block");
	$(".add-postBar").animate({
		"top": '80px',
		"opacity": 1
	}, 150);
}
//删除贴吧条目
function deletePostBar(e) {
	var con = confirm("您确定要删除吗？")
	if(con == true) {
		$.post(window.ctx + "/admin/deletePostBar", {
			"bar_id": e
		}, function(json) {
			alert("删除成功");
			window.location.reload();
		})
	}
}
//绑定页面鼠标单击隐藏修改贴吧信息的div
$("#mask").on("click", function(e) {　　　　　　
	var target = $(e.target);　　　　　　
	if(target.closest("#mask").length == 1 && target.closest(".modify-postBar").length == 0) {　　　　　　
		$("#mask").removeClass("mask");
		setTimeout("$('.modify-postBar').css('display','none')", 150);
		$(".modify-postBar").animate({
			"top": '0px',
			"opacity": 0
		}, 150);　　　　　　
	}　　　　
});
//点击关闭右上角x字符关闭修改贴吧窗口
$("#close_span").on("click", function() {
	$("#mask").removeClass("mask");
	setTimeout("$('.modify-postBar').css('display','none')", 150);
	$(".modify-postBar").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})
//点击关闭按钮关闭修改贴吧窗口
$("#close").on("click", function() {
	$("#mask").removeClass("mask");
	setTimeout("$('.modify-postBar').css('display','none')", 150);
	$(".modify-postBar").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})
//点击发表按钮提交数据到后台控制器
$("#Submission").on("click", function() {
	var form = new FormData(document.getElementById("form"));
	$.ajax({
		url: window.ctx + "/fileUpload/updatePostBar",
		type: "post",
		data: form,
		processData: false,
		contentType: false,
		success: function(data) {
			alert("更新贴吧信息成功!");
			window.location.reload();
		},
	});
})
//绑定页面鼠标单击隐藏修改贴吧信息的div
$("#mask2").on("click", function(e) {　　　　　　
	var target = $(e.target);　　　　　　
	if(target.closest("#mask2").length == 1 && target.closest(".add-postBar").length == 0) {　　　　　　
		$("#mask2").removeClass("mask");
		setTimeout("$('.add-postBar').css('display','none')", 150);
		$(".add-postBar").animate({
			"top": '0px',
			"opacity": 0
		}, 150);　　　　　　
	}　　　　
});
//点击关闭右上角x字符关闭修改贴吧窗口
$("#close_span2").on("click", function() {
	$("#mask2").removeClass("mask");
	setTimeout("$('.add-postBar').css('display','none')", 150);
	$(".add-postBar").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})
//点击关闭按钮关闭修改贴吧窗口
$("#close2").on("click", function() {
	$("#mask2").removeClass("mask");
	setTimeout("$('.add-postBar').css('display','none')", 150);
	$(".add-postBar").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})
//点击发表按钮提交数据到后台控制器
$("#Submission2").on("click", function() {
	var form = new FormData(document.getElementById("form2"));
	$.ajax({
		url: window.ctx + "/fileUpload/addPostBar",
		type: "post",
		data: form,
		processData: false,
		contentType: false,
		success: function(data) {
			alert("添加贴吧信息成功!");
			window.location.reload();
		},
	});
})
/*阻止表单提交默认地址*/
function func() {
	return false;
}