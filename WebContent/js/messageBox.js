function messageBox(title, message, confirmFun, cancelFun) { //弹出一个消息框
	var mask = $("<div class='mask'><div class='messagebox'><div class='message-title'></div><div class='message-context'></div><div id='buttonPage'><button id='confirm'>确定</button></div></div></div>");
	$(document.body).append(mask);

	mask.find(".message-title").html(title); //设置标题
	mask.find(".message-context").html(message); //设置标题
	var id = new Date().getTime();
	mask.attr("id", id);
	var confirmButton = mask.find("#confirm");
	confirmButton.focus();//获取焦点
	confirmButton.on("click", function() { //确定按钮
		$("#" + id).remove(); //删除消息框
		if(typeof confirmFun == "function") {
			confirmFun();
		}
	});
	
	//如果有对应的取消方法则创建取消按钮并添加对应事件
	if(typeof cancelFun == "function") {
		var cancelButton = $("<button id='cancel'>取消</button>")
		cancelButton.on("click", function() {
			$("#" + id).remove(); //删除消息框
			cancelFun();
		});
		mask.find("#buttonPage").prepend(cancelButton);//插入元素到开头
	}
	
	//检测按下事件
	function keyup(event){
		switch (event.keyCode){
			case 32://空格
			case 13://回车
				$("body").off("keyup", keyup);
//				$("#confirm").trigger("click");//模拟点击确定按钮
				//这里不需要模拟点击了，因为确定按钮是默认焦点按钮
				break;
			case 27://ESC
				$("body").off("keyup", keyup);
				if(typeof cancelFun == "function"){//先判断取消按钮是否存在，存在点击取消按钮，不存在点击确定按钮
					$("#cancel").trigger("click");
				}else{
					$("#confirm").trigger("click");
				}
				
				
				break;
		}
	}
	
	//绑定键盘事件
	$("body").on("keyup", keyup);
	
	
	//调整messageBox位置
	var messageBox = mask.find(".messagebox");
	messageBox.css("margin-top", (0 - messageBox[0].offsetHeight / 2) + "px");
	messageBox.css("top","0");
    messageBox.css("opacity","100%");
    messageBox.animate({"top":'425'},250);
	
}




function Message(message) { //创建一个提示框，并在1.3秒钟后自动关闭
	console.log(message);
	var $div = $(
		'<div class="errormessage">'+
		'<div class="Tips"><span>错误信息</span></div>'+
		'<div class="message">'+
			'<div class="son"><img src="../img/bq.png"/></div>'+
			'<div class="son"><span>'+message+'</span></div>'+
		'</div>'+
		'</div>'
	);
	$("body").append($div);
	console.log($div.length);
	$div.css("top","100%");
	$div.css("left",document.documentElement.clientWidth / 2 - $div.offsetWidth / 2 + "px");
	var div = $div.get(0);
	div.id = new Date().getTime();
	setTimeout("jQuery('#" + div.id + "').fadeOut(1000)",1000);
	setTimeout("jQuery('#" + div.id + "').remove()",2000);
	//把所有的messageBox位置向上移动，防止被新消息遮挡
	 $div.animate({"top":'0'},300);
}

