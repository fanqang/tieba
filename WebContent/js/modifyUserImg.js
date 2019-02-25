$(function() {
	$("#Preservation").on("click", function() {
		var form = new FormData(document.getElementById("form"));
		$.ajax({
			url: window.ctx + "/fileUpload/upload",
			type: "post",
			data: form,
			processData: false,
			contentType: false,
			success: function(data) {
				alert("保存成功!");
				window.location.reload();
			},
		});
	})
})
/*阻止表单提交默认地址*/
function func() {
	return false;
}