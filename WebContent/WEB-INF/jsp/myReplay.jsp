<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="itxh" uri="http://itcast.cn/common/"%>
<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" href="${ctx}/css/myReplay.css" />
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>我的回复</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
		<div class="myReplay_nav">我的回复</div>
		<div class="myReplay_body">
			<c:forEach items="${page.rows}" var="row">
				<div class="myReplay_body_son">
					<div class="myReplay_body_son_child">
						<div class="left"><img src="http://static.tieba.baidu.com/tb/static-itieba3/img/icon/reply.gif" style="position: relative;left: -15px;" />
							<a href="#">${log_name}</a>&nbsp;回复</div>
						<div class="right">
							<fmt:formatDate value="${row.time}" type="date" pattern="MM-dd" />
						</div>
					</div>
					<div class="myReplay_body_son_child">
						<img src="http://static.tieba.baidu.com/tb/static-itieba3/img/yh_0.png" style="margin-left: 30px;" />
						<a href="${ctx}/post/showPost?bar_id=${row.bar_id}&post_id=${row.post_id}#${row.time}" style="font-family: '微软雅黑';font-size: 10px;color: #000000;" target="_blank">${row.text_content}</a>
						<img src="http://static.tieba.baidu.com/tb/static-itieba3/img/yh_1.png" />
						<a href="${ctx}/post/showPost?bar_id=${row.bar_id}&post_id=${row.post_id}" style="font-family:'微软雅黑';font-size: 10px;color: #666666;" target="_blank">回复</a>
					</div>
					<div class="myReplay_body_son_child">
						<div class="top"></div>
						<div class="reply_content">
							<a href="${ctx}/post/showPost?bar_id=${row.bar_id}&post_id=${row.post_id}" class="content_a" target="_blank">${row.text_title}</a>
							<a href="${ctx}/post/showPost?bar_id=${row.bar_id}&post_id=${row.post_id}" style="font-family:'微软雅黑';font-size: 10px;color: #666666;" target="_blank">&nbsp;回复</a>(${row.reply_count})-来自&nbsp;
							<a href="${ctx}/post/show?bar_id=${row.bar_id}" style="color: #2D64B3;" target="_blank">${row.bar_name}</a>
						</div>
						<div class="bottom">
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="myReplay_body_bottom">
				<div class="left">
					<itxh:page url="${ctx}/post/myReplay.action"></itxh:page>
				</div>
				<div class="right">
					共有&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${totalNumber}</span>&nbsp;条,当前显示第&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${currentPage}</span>&nbsp;页
				</div> 
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	</body>
</html>