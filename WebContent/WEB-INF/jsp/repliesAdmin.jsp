<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="itxh" uri="http://itcast.cn/common/"%>
<!DOCTYPE>
<html>

	<head>
		<link rel="stylesheet" href="${ctx}/css/repliesAdmin.css" />
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>回贴管理</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/adminLeftNav.jsp"%>
		<div class="nav-title">回帖管理</div>
		<div class="replies-List">回帖管理列表</div>
		<table border="1" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th>回帖id</th>
					<th>回复帖子</th>
					<th>回复贴吧</th>
					<th>回复用户</th>
					<th>回复内容</th>
					<th>回复图片</th>
					<th>回复时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.rows}" var="row">
					<tr>
						<td>${row.comment_id}</td>
						<td>${row.text_title}</td>
						<td>${row.bar_name}</td>
						<td>${row.user_name}</td>
						<td>${row.text_content}</td>
						<c:set var="string" value="${row.image_url}" />
						<c:set var="str" value="${fn:substring(string, 25, 47)}" />
						<td>${str}</td>
						<td>
							<fmt:formatDate value="${row.time}" type="date" pattern="yyyy-MM-dd HH:mm" />
						</td>
						<td><span style="color: red;cursor: pointer;" onclick="deleteReplies(${row.comment_id})">删除</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagin">
			<div class="left">
				<itxh:page url="${ctx}/admin/repliesAdmin.action"></itxh:page>
			</div>
			<div class="right">
				共有&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${totalNumber}</span>&nbsp;条,每页显示&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${size}</span>&nbsp;条,当前显示第<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${currentPage}</span>&nbsp;页
			</div>
		</div>
		<script type="text/javascript" src="${ctx}/js/repliesAdmin.js" ></script>
	</body>

</html>