<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ taglib prefix="itxh" uri="http://itcast.cn/common/"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>

	<head>
		<link rel="stylesheet" href="${ctx}/css/nav/adminLeftNav.css" />
		<link rel="stylesheet" href="${ctx}/css/postBarAdmin.css" />
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>贴吧管理</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/adminLeftNav.jsp"%>
		<div class="nav-title">贴吧管理</div>
		<div class="postBar-List">贴吧管理列表<button onclick="addBar()">添加贴吧</button></div>
		<table border="1" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th>贴吧id</th>
					<th>贴吧名称</th>
					<th>贴吧图片</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.rows}" var="row">
					<tr>
						<td>${row.bar_id}</td>
						<td>${row.bar_name}</td>
						<c:set var="string" value="${row.img_url}" />
						<c:set var="str" value="${fn:substring(string, 10, 46)}" />
						<td>${str}</td>
						<td><span style="color: red;cursor: pointer;" onclick="updatePostBar(${row.bar_id})">修改</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #9B49EA;cursor: pointer;" onclick="deletePostBar(${row.bar_id})">删除</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="mask">
			<form id="form" onsubmit="return func()">
				<div class="modify-postBar">
					<div class="modify-postBar-son">修改贴吧信息<span id="close_span">×</span></div>
					<div class="modify-postBar-son">
						<div class="left">
							<div class="left-son">贴吧id</div>
							<div class="left-son">贴吧名称</div>
							<div class="left-son"></div>
							<div class="left-son">上传贴吧图片</div>
						</div>
						<div class="right">
							<div class="right-son"><input type="text" name="bar_id" placeholder="贴吧id" readonly="readonly" /></div>
							<div class="right-son"><input type="text" name="bar_name" placeholder="吧名" /></div>
							<img id="headimg" src="${ctx}/images/zanwu.jpg" style="cursor:pointer;" height="150px;" width="150px;">
							<input id="headurladd" type="file" name="pictureFile" onchange="readFile(this)" style="display: none;" />
							<input type="hidden" name="headUrl" id="logo" value="" />
						</div>
					</div>
					<div class="modify-postBar-son">
						<button class="close" id="close">关闭</button>
						<button class="Submission" id="Submission">保存修改</button>
					</div>
				</div>
			</form>
		</div>
		<div id="mask2">
			<form id="form2" onsubmit="return func()">
				<div class="add-postBar">
					<div class="add-postBar-son">添加贴吧<span id="close_span2">×</span></div>
					<div class="add-postBar-son">
						<div class="left">
							<div class="left-son">贴吧名称</div>
							<div class="left-son"></div>
							<div class="left-son">上传贴吧图片</div>
						</div>
						<div class="right">
							<div class="right-son"><input type="text" name="bar_name" placeholder="吧名" /></div>
							<img id="headimg2" src="${ctx}/images/zanwu.jpg" style="cursor:pointer;" height="150px;" width="150px;">
							<input id="headurladd2" type="file" name="pictureFile" onchange="readFile2(this)" style="display: none;" />
							<input type="hidden" name="headUrl2" id="logo2" value="" />
						</div>
					</div>
					<div class="add-postBar-son">
						<button class="close" id="close2">关闭</button>
						<button class="Submission" id="Submission2">添加</button>
					</div>
				</div>
			</form>
		</div>
		<div class="pagin">
			<div class="left">
				<itxh:page url="${ctx}/admin/postBarAdmin.action"></itxh:page>
			</div>
			<div class="right">
				共有&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${totalNumber}</span>&nbsp;条,每页显示&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${size}</span>&nbsp;条,当前显示第<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${currentPage}</span>&nbsp;页
			</div>
		</div>
		<script type="text/javascript" src="${ctx}/js/ImgUpload.js"></script>
		<script type="text/javascript" src="${ctx}/js/postBarAdmin.js"></script>
	</body>

</html>