<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ taglib prefix="itxh" uri="http://itcast.cn/common/"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>

	<head>
		<link rel="stylesheet" href="${ctx}/css/nav/adminLeftNav.css" />
		<link rel="stylesheet" href="${ctx}/css/userAdmin.css" />
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>用户管理</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/adminLeftNav.jsp"%>
		<div class="nav-title">用户管理</div>
		<div class="user-List">用户管理列表</div>
		<table border="1" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th>用户id</th>
					<th>用户名称</th>
					<th>用户密码</th>
					<th>用户头像</th>
					<th>权重</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.rows}" var="row">
					<tr>
						<td>${row.user_id}</td>
						<td>${row.user_name}</td>
						<td>${row.user_pwd}</td>
						<c:set var="string" value="${row.imageurl}" />
						<c:set var="str" value="${fn:substring(string, 10, 46)}" />
						<td>${str}</td>
						<td>${row.weight}</td>
						<td><span style="color: red;cursor: pointer;" onclick="modifyUser(${row.user_id})">修改</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #9B49EA;cursor: pointer;" onclick="deleteUser(${row.user_id})">删除</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="mask">
			<div class="modify-user">
				<div class="modify-user-son">修改用户信息<span id="close_span">×</span></div>
				<div class="modify-user-son">
					<div class="left">
						<div class="left-son">用户id</div>
						<div class="left-son">用户名称</div>
						<div class="left-son">用户密码</div>
						<div class="left-son">权重</div>
					</div>
					<div class="right">
						<div class="right-son"><input type="text" name="user_id" readonly="readonly" placeholder="用户id" /></div>
						<div class="right-son"><input type="text" name="user_name" placeholder="用户名称" /></div>
						<div class="right-son"><input type="password" name="user_pwd" placeholder="用户密码" /></div>
						<div class="right-son"><input type="text" name="user_weight" readonly="readonly" placeholder="权重" /></div>
					</div>
				</div>
				<div class="modify-user-son">
					<button class="close">关闭</button>
					<button class="Submission">保存修改</button>
				</div>
			</div>
		</div>
		<div class="pagin">
				<div class="left">
					<itxh:page url="${ctx}/admin/userAdmin.action"></itxh:page>
				</div>
				<div class="right">
					共有&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${totalNumber}</span>&nbsp;条,每页显示&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${size}</span>&nbsp;条,当前显示第<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${currentPage}</span>&nbsp;页
				</div>
		</div>
		<script type="text/javascript" src="${ctx}/js/userAdmin.js"></script>
	</body>

</html>