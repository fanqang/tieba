window.onload = function() {
	var demo = document.getElementById("demo");
	var count = 7; //倒计时7秒；
	setTimeout(fn, 1000);

	function fn() {
		count--;
		demo.innerHTML = +count + "秒后跳转操作页面";
		// 如果等于0秒，页面自动跳转到新页面
		if(count <= 0) {
			window.location.href = window.ctx+"/admin/userAdmin";
		} else {
			setTimeout(fn, 1000);
		}
	}
}