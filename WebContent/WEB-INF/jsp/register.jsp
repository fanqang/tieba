<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>注册</title>
		<link rel="stylesheet" href="${ctx}/css/register.css" />
		<link rel="stylesheet" href="${ctx}/css/verification.css" />
		<script type="text/javascript" src="${ctx}/js/jQuery-2.1.4.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/verification.js"></script>
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
	</head>

	<body>
		<div class="register-main">
			<div class="register-title">注册</div>
			<div class="register-son">
				<input type="text" id="user_name" placeholder="用户名" />
			</div>
			<div class="register-span-son">
				<span id="user_name_span"></span>
			</div>
			<div class="register-son">
				<input type="password" id="user_pwd" placeholder="密码" />
			</div>
			<div class="register-span-son">
				<span id="user_pwd_span"></span>
			</div>
			<div class="register-son">
				<input type="password" id="re_user_pwd" placeholder="再次输入密码" />
			</div>
			<div class="register-span-son">
				<span id="re_pwd_span"></span>
			</div>
			<div class="register-son">
				<div class="code" style="margin: 0;">
					<input type="text" value="" placeholder="请输入验证码" class="input-register" />
					<canvas id="canvas" width="100" height="38"></canvas>
				</div>
			</div>
			<div class="register-span-son">
				<span id="register_verification_span"></span>
			</div>
			<div class="register-son">
				<button class="register-btn">注册</button>
			</div>
			<div class="register-son">
				<button class="login-btn">登录</button>
			</div>
		</div>
		<script type="text/javascript" src="${ctx}/js/rejister.js"></script>
	</body>

</html>