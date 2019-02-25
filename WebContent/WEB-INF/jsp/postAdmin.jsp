<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="itxh" uri="http://itcast.cn/common/"%>
<!DOCTYPE>
<html>

	<head>
		<link rel="stylesheet" href="${ctx}/css/postAdmin.css" />
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>帖子管理</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/adminLeftNav.jsp"%>
		<div class="nav-title">帖子管理</div>
		<div class="post-List">帖子管理列表</div>
		<table border="1" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th>贴子编号</th>
					<th>所在贴吧</th>
					<th>发布人</th>
					<th>帖子标题</th>
					<th>帖子内容</th>
					<th>发布时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.rows}" var="row">
					<tr>
						<td>${row.post_id}</td>
						<td>${row.bar_name}</td>
						<td>${row.user_name}</td>
						<td>${row.text_title}</td>
						<td>${row.text_content}</td>
						<td>
							<fmt:formatDate value="${row.time}" type="date" pattern="yyyy-MM-dd HH:mm" />
						</td>
						<td><span style="color: red;cursor: pointer;" onclick="deletePost(${row.post_id})">删除</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagin">
			<div class="left">
				<itxh:page url="${ctx}/admin/postAdmin.action"></itxh:page>
			</div>
			<div class="right">
				共有&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${totalNumber}</span>&nbsp;条,每页显示&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${size}</span>&nbsp;条,当前显示第<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${currentPage}</span>&nbsp;页
			</div>
		</div>
		<script type="text/javascript" src="${ctx}/js/postAdmin.js" ></script>
	</body>
</html>