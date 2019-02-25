function deletePost(e) {
	console.log(e);
	var con = confirm("注意！删除此条帖子将会级联删除该帖子下的所有回复，您还要继续删除吗？")
	if(con == true) {
		$.post(window.ctx + "/admin/deletePost", {
			"post_id": e
		}, function(json) {
			alert("删除成功");
			window.location.reload();
		})
	}
}