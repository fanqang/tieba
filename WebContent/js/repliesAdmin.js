//删除单条回复
function deleteReplies(e) {
	console.log(e);
	var con = confirm("注意,删除此条回复信息将会级联删除旗下所有子回复,您确定要删除吗？")
	if(con == true) {
		$.post(window.ctx + "/admin/deleteReplies", {
			"comment_id": e
		}, function(json) {
			alert("删除回复成功!");
			window.location.reload();
		})
	}
}