$("#headimg").click(function() {
			addhead('headurladd');
		});

		function addhead(obj) {
			$("#" + obj).click();
		}

		function readFile(obj) {
			var file = obj.files[0];
			//判断类型是不是图片  
			/*  if(!/image\/\w+/.test(file.type)){     
			         alert("请确保文件为图像类型");   
			         return false;
			 }    */
		var reader = new FileReader();
		reader.readAsDataURL(file);
		
					//情况一：对读取到的图片编码
					reader.onload = function(e) {
						var imgBase64Data = encodeURIComponent(e.target.result);
						$("#headimg")[0].src = this.result;
						var res = (this.result);
						var pos = imgBase64Data.indexOf("4") + 4;
						imgBase64Data = imgBase64Data.substring(pos);
						$('#logo').val(imgBase64Data);
					}

					//情况二：对读取的图片没编码

					reader.onload = function(e) {
						var imgBase64Data = e.target.result;
						$("#headimg")[0].src = this.result;
						var res = (this.result);
						var pos = imgBase64Data.indexOf("4") + 2;
						imgBase64Data = imgBase64Data.substring(pos);
						$('#logo').val(imgBase64Data);
					}
				}
$("#headimg2").click(function() {
			addhead('headurladd2');
		});

		function addhead(obj) {
			$("#" + obj).click();
		}

		function readFile2(obj) {
			var file = obj.files[0];
			//判断类型是不是图片  
			/*  if(!/image\/\w+/.test(file.type)){     
			         alert("请确保文件为图像类型");   
			         return false;
			 }    */
		var reader = new FileReader();
		reader.readAsDataURL(file);
		
					//情况一：对读取到的图片编码
					reader.onload = function(e) {
						var imgBase64Data = encodeURIComponent(e.target.result);
						$("#headimg2")[0].src = this.result;
						var res = (this.result);
						var pos = imgBase64Data.indexOf("4") + 4;
						imgBase64Data = imgBase64Data.substring(pos);
						$('#logo2').val(imgBase64Data);
					}

					//情况二：对读取的图片没编码

					reader.onload = function(e) {
						var imgBase64Data = e.target.result;
						$("#headimg2")[0].src = this.result;
						var res = (this.result);
						var pos = imgBase64Data.indexOf("4") + 2;
						imgBase64Data = imgBase64Data.substring(pos);
						$('#logo2').val(imgBase64Data);
					}
				}