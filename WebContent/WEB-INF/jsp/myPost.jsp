<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="itxh" uri="http://itcast.cn/common/"%>
<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" href="${ctx}/css/myPost.css" />
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>我的帖子</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
		<div class="mypost_nav">我的贴子</div>
		<div class="mypost_body">
			<c:forEach items="${page.rows}" var="row">
				<div class="mypost_body_son">
					<div class="mypost_body_son_child">
						<span class="left">在<a href="${ctx}/post/show?bar_id=${row.bar_id}" class="ba_a" target="_blank"> ${row.bar_name}</a> 发帖</span>
						<span class="right"><a href="${ctx}/post/showPost?bar_id=${row.bar_id}&post_id=${row.post_id}" class="Post_a" target="_blank"> ${row.text_title}</a></span>
						<span class="Reply">回复</span>
					</div>
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today" />
					<!--获取当前系统时间-->
					<fmt:formatDate value="${row.time}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="date" />
					<!--获取数据库发帖日期时间-->
					<c:if test="${today == date }">
						<!--如果两个日期相同那么页面显示当天日期的发布时分-->
						<div class="mypost_body_son_child">
							<fmt:formatDate value="${row.time}" type="date" pattern="HH:mm" />
						</div>
					</c:if>
					<c:if test="${today != date }">
						<!--如果两个日期不相同那么页面显示数据发布日期的月日-->
						<div class="mypost_body_son_child">
							<fmt:formatDate value="${row.time}" type="date" pattern="MM-dd" />
						</div>
					</c:if>
				</div>
			</c:forEach>
			<div class="mypost_body_bottom">
				<div class="left">
					<itxh:page url="${ctx}/post/myPost.action"></itxh:page>
				</div>
				<div class="right">
					共有&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${totalNumber}</span>&nbsp;条,当前显示第&nbsp;<span style="color: #EC5851;font-family: '微软雅黑';font-weight: bold;">${currentPage}</span>&nbsp;页
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	</body>

</html>