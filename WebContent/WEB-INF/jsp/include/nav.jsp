<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>导航栏</title>
		<link rel="stylesheet" href="${ctx}/css/nav/nav.css" />
		<script type="text/javascript" src="${ctx}/js/jQuery-2.1.4.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery-migrate-1.2.1.min.js"></script>
	</head>

	<body>
		<!--头部开始 -->
		<div class="head ">
			<div class="cont">
				<div class="head-left">
					<a href="#"><img src="${ctx}/images/nav/logo.png" /></a>
				</div>
				<div class="nav">
					<!--导航条-->
					<ul class="nav-main">
						<li onclick="sub()">贴吧首页</li>
						<li id="li-1">我的贴吧<span></span></li>
						<li id="li-2">消息<span></span></li>
						<li id="li-3">其他<span></span></li>
					</ul>
					<!--隐藏盒子-->
					<div id="box-1" class="hidden-box hidden-loc-index">
						<ul>
							<li>
								<a href="${ctx}/post/myPost?user_id=${us.user_id}">我的帖子</a>
							</li>
							<li>
								<a href="${ctx}/post/myReplay?user_id=${us.user_id}">我的回复</a>
							</li>
						</ul>
					</div>
					<div id="box-2" class="hidden-box hidden-loc-us">
						<ul>
							<li>
								<a href="#">我的通知</a>
							</li>
						</ul>
					</div>
					<div id="box-3" class="hidden-box hidden-loc-info">
						<ul>
							<li>
								<a onclick="logout()">退出登录</a>
							</li>
							<li>
								<a href="${ctx}/user/register">注册用户</a>
							</li>
							<li>
								<a href="${ctx}/post/modifyUserImg">上传头像</a>
							</li>
						</ul>
					</div>
					<c:if test="${!(log_name eq null)}">
						<div class="user_img">
							<img src="${us.imageurl}" />
							<span>${us.user_name}</span>
						</div>
					</c:if>
				</div>
			</div>
			<div class="yanse"></div>
		</div>
		<!--头部结束 -->
		<script type="text/javascript" src="${ctx}/js/main.js"></script>
	</body>
	<script>
		function sub() {
			window.location.href = "${ctx}/user/homePage";
		}

		function logout() {
			$.post("${ctx}/user/loginOut", {}, function(json) {
				alert("用户退出登录成功!")
				window.location.href = "${ctx}/user/login";
			})
		}
	</script>

</html>