<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="${ctx}/css/modifyUserImg.css" />
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改用户头像</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
		<form id="form" onsubmit="return func()">
			<div class="main_div">
				<div class="title">修改用户头像</div>
				<div class="left">
					<div class="left_son"></div>
					<div class="left_son"></div>
					<div class="left_son"></div>
					<div class="left_son">上传用户头像:</div>
					<div class="left_son"></div>
					<div class="left_son"></div>
					<div class="left_son"></div>
				</div>
				<div class="right">
						<img id="headimg" src="${ctx}/images/zanwu.jpg" style="cursor:pointer; width: 300px; height: 300px; margin-left: 10px;">
						<input id="headurladd" type="file" name="pictureFile" onchange="readFile(this)" style="display: none;" />
						<input type="hidden" name="headUrl" id="logo" value="" />
						<input type="hidden" name="user_id" id="logo" value="${us.user_id}" />
					<div class="right_son"><button id="Preservation">保存</button></div>
				</div>
			</div>
		</form>
	</body>
	<script type="text/javascript" src="${ctx}/js/ImgUpload.js" ></script>
	<script type="text/javascript" src="${ctx}/js/modifyUserImg.js" ></script>

</html>