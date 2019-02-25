<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<!DOCTYPE>
<html>

	<head>
		<script type="text/javascript" src="${ctx}/js/jQuery-2.1.4.min.js"></script>
		<link rel="stylesheet" href="${ctx}/css/nav/adminLeftNav.css" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>管理员左侧导航</title>
	</head>

	<body>
		<div class="nav-main">
			<div class="nav-box">
				<div class="nav">
					<ul class="nav-ul">
						<li>
							<a href="${ctx}/user/administrators"><span>首页</span></a>
						</li>
						<li>
							<a href="${ctx}/admin/userAdmin"><span>用户管理</span></a>
						</li>
						<li>
							<a href="${ctx}/admin/postBarAdmin"><span>贴吧管理</span></a>
						</li>
						<li>
							<a href="${ctx}/admin/postAdmin"><span>帖子管理</span></a>
						</li>
						<li>
							<a href="${ctx}/admin/repliesAdmin"><span>回贴管理</span></a>
						</li>
						<li>
							<a id="logout"><span>退出系统</span></a>
						</li>
					</ul>
					<div style="width: 100%;height: 100px;line-height: 100px; text-align: center;color: white;">[${log_name}]</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				var thisTime;
				$('.nav-ul li').mouseleave(function(even) {
					thisTime = setTimeout(thisMouseOut, 1000);
				})

				$('.nav-ul li').mouseenter(function() {
					clearTimeout(thisTime);
					var thisUB = $('.nav-ul li').index($(this));
					if($.trim($('.nav-slide-o').eq(thisUB).html()) != "") {
						$('.nav-slide').addClass('hover');
						$('.nav-slide-o').hide();
						$('.nav-slide-o').eq(thisUB).show();
					} else {
						$('.nav-slide').removeClass('hover');
					}

				})

				function thisMouseOut() {
					$('.nav-slide').removeClass('hover');
				}

				$('.nav-slide').mouseenter(function() {
					clearTimeout(thisTime);
					$('.nav-slide').addClass('hover');
				})
				$('.nav-slide').mouseleave(function() {
					$('.nav-slide').removeClass('hover');
				})

				$("#logout").on("click",function(){
					$.post("${ctx}/admin/logout",{},function(json){
						alert("管理员退出系统成功")
						window.location.href = "${ctx}/user/login";
					})
				})
			})
		</script>
	</body>

</html>