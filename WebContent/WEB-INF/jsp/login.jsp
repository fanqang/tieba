<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" href="${ctx}/css/login.css" />
		<link rel="stylesheet" href="${ctx}/css/verification.css" />
		<script type="text/javascript" src="${ctx}/js/jQuery-2.1.4.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/verification.js"></script>
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<title>登录</title>
	</head>

	<body>
		<div class="container-login100" style="background-image: url('${ctx}/images/loginandregister/bg-01.jpg');">
			<div class="login_frame">
				<div class="login_frame_son">
					<h2>登录</h2></div>
				<div class="login">
					<div class="login_son">
						<div class="login_son_child">用户名</div>
						<div class="login_son_child"><span id="name_span"></span></div>
					</div>
					<div class="login_son" id="name">
						<div class="div_img"><img src="${ctx}/images/loginandregister/name.png" /></div>
						<div class="div_input"><input type="text" id="user_name" onfocus="get_name()" onblur="text_name()" placeholder="请输入用户名" /></div>
					</div>
					<div class="login_son">
						<div class="pwd_son_child">密码</div>
						<div class="pwd_son_child"><span id="pwd_span"></span></div>
					</div>
					<div class="login_son" id="pwd">
						<div class="div_img"><img src="${ctx}/images/loginandregister/pwd.png" /></div>
						<div class="div_input"><input type="password" id="user_pwd" onfocus="get_pwd()" onblur="text_pwd()" placeholder="请输入密码" /></div>
					</div>
					<div class="login_son">
						<div class="verification_son_child">验证码</div>
						<div class="verification_son_child"><span id="verification_span"></span></div>
					</div>
					<div class="login_son">
						<div class="code">
							<input type="text" value="" placeholder="请输入验证码" class="input-val">
							<canvas id="canvas" width="100" height="43"></canvas>
						</div>
					</div>
					<div class="login_son"><button id="Login-btn">登录</button></div>
					<div class="login_son"><button onclick="Register()">注册</button></div>
				</div>

			</div>
		</div>
		<script type="text/javascript" src="${ctx}/js/login.js" ></script>
	</body>
</html>