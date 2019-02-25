//点击发帖按钮显示发表窗口
$("#posting").on("click", function() {
	$("#mask").addClass("mask");
	$(".edit").css("display", "block");
	$(".edit").animate({
		"top": '80px',
		"opacity": 1
	}, 150);
})
//绑定页面鼠标单击隐藏收货地址的div
$("#mask").on("click", function(e) {　　　　　　
	var target = $(e.target);　　　　　　
	if(target.closest("#mask").length == 1 && target.closest(".edit").length == 0) {　　　　　　
		$("#mask").removeClass("mask");
		setTimeout("$('.edit').css('display','none')", 150);
		$(".edit").animate({
			"top": '0px',
			"opacity": 0
		}, 150);　　　　　　
	}　　　　
})
//点击关闭右上角x字符发表窗口
$("#close_span").on("click", function() {
	$("#mask").removeClass("mask");
	setTimeout("$('.edit').css('display','none')", 150);
	$(".edit").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})
//点击关闭按钮关闭发表窗口
$(".close").on("click", function() {
	$("#mask").removeClass("mask");
	setTimeout("$('.edit').css('display','none')", 150);
	$(".edit").animate({
		"top": '0px',
		"opacity": 0
	}, 150);
})

/*阻止表单提交默认地址*/
function func() {
	return false;
}
