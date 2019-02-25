<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="itxh" uri="http://itcast.cn/common/"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" href="${ctx}/css/myBar.css" />
		<link rel="stylesheet" href="${ctx}/css/IMGUP.css" />
		<link rel="stylesheet" href="${ctx}/css/footer.css" />
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>我的贴吧</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
		<div class="main_div">
			<div class="bar_top"></div>
			<div class="bar_title">
				<div class="bar_title_son"><img src="${bar.img_url}" /></div>
				<div class="bar_title_son">
					<p>${bar.bar_name}</p>
					<h3>你造么？这里有你一万个小伙伴！</h3>
				</div>
			</div>
			<div class="bar_nav">
				<div class="bar_nav_son">回复数量</div>
				<div class="bar_nav_son">帖子</div>
			</div>
			<div class="bar_text">
				<c:forEach items="${page.rows}" var="row">
					<div class="postrow">
						<div class="bar_text_row">
							<div class="bar_text_row_son"><span>${row.reply_count}</span></div>
							<div class="bar_text_row_son">
								<a class="a" href="${ctx}/post/showPost?bar_id=${bar.bar_id}&post_id=${row.post_id}" target="_blank">${row.text_title}</a>
								<h3 style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${row.text_content}</h3></div>
							<div class="bar_text_row_son">来自：${row.user_name}</div>
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today" />
							<!--获取当前系统时间-->
							<fmt:formatDate value="${row.time}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="date" />
							<!--获取数据库发帖日期时间-->
							<c:if test="${today == date }">
								<!--如果两个日期相同那么页面显示当天日期的发布时分-->
								<div class="bar_text_row_son">
									<fmt:formatDate value="${row.time}" type="date" pattern="HH:mm" />
								</div>
							</c:if>
							<c:if test="${today != date }">
								<!--如果两个日期不相同那么页面显示数据发布日期的月日-->
								<div class="bar_text_row_son">
									<fmt:formatDate value="${row.time}" type="date" pattern="MM-dd" />
								</div>
							</c:if>
						</div>
						<c:if test="${fn:length(row.img_url)!=0}">
							<div class="post_img">
								<c:set value="${ fn:split(row.img_url, ',') }" var="names" />
								<c:forEach items="${names}" var="imgurl">
									<img src="${imgurl}" />
								</c:forEach>
							</div>
						</c:if>
					</div>
				</c:forEach>
				<div class="paging">
					<div class="paging_son">
						<div class="left">
							<itxh:page url="${ctx}/post/show.action"></itxh:page>
						</div>
						<div class="right">
							共有&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${totalNumber}</span>&nbsp;条,当前显示第&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${currentPage}</span>&nbsp;页
						</div>
					</div>
				</div>
			</div>
			<div id="goToTop"></div>
			<button id="posting">发帖</button>
		</div>
		<div id="mask">
			<form id="form" onsubmit="return func()">
				<div class="edit">
					<div class="edit_son">发帖<span id="close_span">×</span></div>
					<div class="edit_son">
						<input type="text" name="text_title" placeholder="请输入帖子的标题"></input>
						</br>
						<div class="text_nav">
							<div class="upload_btn">
								<!--图片选择对话框-->
								<div id="div_imgfile">选择图片</div>
								<input type="file" class="imgfile" name="pictureFile" accept=".png,.jpg,.jpeg" num="0">
							</div>
						</div>
						<textarea rows="10" cols="20" name="text_content" placeholder="请输入帖子的内容"></textarea>
					</div>
					<div class="edit_son">
						<button class="close">关闭</button>
						<button class="Submission">发表</button>
					</div>
					<!--图片预览容器-->
					<div id="div_imglook">
						<div style="clear: both;"></div>
					</div>
				</div>
			</form>
		</div>
		<div class="boottom"></div>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
		<script type="text/javascript" src="${ctx}/js/IMGUP.js"></script>
		<script type="text/javascript" src="${ctx}/js/myBar.js"></script>
		<script type="text/javascript" src="${ctx}/js/public.js" ></script>
	</body>
	<script>
		//点击发表按钮提交数据到后台控制器
		$(".Submission").on("click", function() {
			var form = new FormData(document.getElementById("form"));
			form.append("bar_id", "${bar.bar_id}");
			form.append("user_id", "${us.user_id}");
			$.ajax({
				url: "${ctx}/fileUpload/postUpload",
				type: "post",
				data: form,
				processData: false,
				contentType: false,
				success: function(data) {
					alert("发表成功!");
					window.location.reload();
				},
			});
		})
	</script>

</html>