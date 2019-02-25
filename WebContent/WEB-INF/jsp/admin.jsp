<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<!DOCTYPE>
<html>

	<head>
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>系统管理员</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/adminLeftNav.jsp"%>
		<div style="width: 100%;height:700px;line-height:700px;text-shadow: 0 0 0.2em #F87, 0 0 0.2em #F87;color: white;font-family: '微软雅黑';font-size: 40px;text-align: center;"> 欢 迎 进 入 My 贴 吧 后 台 管 理 系 统 </div>
		<div id="demo" style="width: 100%;height: 200px;line-height: 200px;text-align: center;text-shadow: 0 0 0.2em #F87, 0 0 0.2em #F87;color: white;font-family: '微软雅黑';margin-top: -380px;"></div>
		<script type="text/javascript" src="${ctx}/js/admin.js" ></script>
	</body>

</html>