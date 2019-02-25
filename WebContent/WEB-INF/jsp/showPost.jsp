<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" href="${ctx}/css/showPost.css" />
		<link rel="stylesheet" href="${ctx}/css/IMGUP.css" />
		<link rel="stylesheet" href="${ctx}/css/footer.css" />
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>显示信息</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
		<div class="main_div">
			<div class="Show_top"></div>
			<div class="bar_name">
				<div class="bar_name_son"><img src="${bar.img_url}" /></div>
				<div class="bar_name_son">${bar.bar_name}</div>
			</div>
			<div class="menu">
				<div class="menu_son">
					<div class="text">看帖</div>
				</div>
				<div class="menu_son">
					<div class="text">图片</div>
				</div>
				<div class="menu_son">
					<div class="text">精品</div>
				</div>
				<div class="menu_son">
					<div class="text">视频</div>
				</div>
				<div class="menu_son">
					<div class="text">游戏</div>
				</div>
			</div>
			<div class="Post_title">
				<div class="Post_title_text">${mypost.text_title}</div>
			</div>
			<div class="Landlord">
				<div class="Landlord_left">
					<div class="louzhu"></div>
					<div class="louzhu_img"><img src="${louzhu.imageurl}"></div>
					<div class="louzhu_name">${louzhu.user_name}</div>
				</div>
				<div class="Landlord_right">
					<div class="Post_message">
						<div class="Landlord_content">${mypost.text_content}</div>
						<div class="Landlord_img">
							<c:if test="${fn:length(mypost.img_url)!=0}">
								<c:set value="${ fn:split(mypost.img_url, ',') }" var="names" />
								<c:forEach items="${names}" var="imgurl">
									<img src="${imgurl}" />
								</c:forEach>
							</c:if>
						</div>
						<div class="Landlord_message">
							<div class="Landlord_message_left">
								来自用户: <span>${louzhu.user_name}</span> 1楼
								<fmt:formatDate value="${mypost.time}" type="date" pattern="yyyy-MM-dd HH:mm" />
							</div>
							<div class="hf">
								<a id="aa">回复</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="Reply_main">
				<c:forEach items="${replyList}" var="rpl">
					<div class="Post_Reply" id="${rpl.time}">
						<div class="Post_Reply_left">
							<div class="user_img"><img src="${rpl.user_imageurl}" /></div>
							<div class="user_name">${rpl.user_name}</div>
						</div>
						<div class="Post_Reply_right">
							<div class="Reply_message">
								${rpl.text_content}</br>
								<c:if test="${fn:length(rpl.text_content_imageurl)!=0}">
									<c:set value="${ fn:split(rpl.text_content_imageurl, ',') }" var="names" />
									<c:forEach items="${names}" var="imgurl">
										<img src="${imgurl}" />
									</c:forEach>
								</c:if>
							</div>
							<div class="Reply_time">
								来自用户: <span style="color: #687CCD;">${rpl.user_name}</span> ${rpl.i}楼
								<fmt:formatDate value="${rpl.time}" type="date" pattern="yyyy-MM-dd HH:mm" /> &nbsp;&nbsp;
								<c:if test="${!empty rpl.sonReplayList}">
									<div name="son_replies" class="replies" onclick="son_replies()">收起回复</div>
								</c:if>
								<c:if test="${empty rpl.sonReplayList}">
									<div name="son_replies" class="replies" onclick="son_replies()">回复</div>
								</c:if>
							</div>
							<div class="son_replay">
								<c:if test="${!empty rpl.sonReplayList}">
									<div class="son_replies_main">
										<c:forEach items="${rpl.sonReplayList}" var="son_rpl">
											<c:if test="${son_rpl.reply_id == 0}">
												<div class="son_replies_content" name="son_replies_content">
													<div class="left"><img src="${son_rpl.us.imageurl}" /><span style="color: 2D64B3;font-family:'微软雅黑';">&nbsp;&nbsp;${son_rpl.us.user_name}:</span>&nbsp; ${son_rpl.son_comment_content}
													</div>
													<div class="right">
														<span class="deleteSpan" onclick="delet_son_replies(${son_rpl.son_comment_id})">删除</span>&nbsp;
														<fmt:formatDate value="${son_rpl.time}" type="date" pattern="yyyy-MM-dd HH:mm" />&nbsp;&nbsp;<span style="cursor: pointer;" onclick="hf('${son_rpl.us.user_name}','${son_rpl.son_comment_id}')">回复</span></div>
												</div>
											</c:if>
											<c:if test="${son_rpl.reply_id != 0}">
												<div class="son_replies_content" name="son_replies_content">
													<div class="left"><img src="${son_rpl.us.imageurl}" /><span style="color: 2D64B3;font-family:'微软雅黑';">&nbsp;&nbsp;${son_rpl.us.user_name}:</span>&nbsp; 回复&nbsp;
														<span style="color: 2D64B3;font-family:'微软雅黑';">${rpl.user_name}&nbsp;:</span>${son_rpl.son_comment_content}</div>
													<div class="right">
														<span class="deleteSpan" onclick="delet_son_replies(${son_rpl.son_comment_id})">删除</span>&nbsp;
														<fmt:formatDate value="${son_rpl.time}" type="date" pattern="yyyy-MM-dd HH:mm" />&nbsp;&nbsp;<span style="cursor: pointer;" onclick="hf('${son_rpl.us.user_name}','${son_rpl.son_comment_id}')">回复</span></div>
												</div>
											</c:if>
										</c:forEach>
										<div class="my_said">
											<button name="my_said">我也说一句</button>
										</div>
									</div>
								</c:if>
								<div class="son_replies">
									<textarea placeholder="回复${rpl.user_name}:"></textarea>
									<button onclick="submit(${rpl.comment_id})">发表</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="mask">
				<form id="form" onsubmit="return func()">
					<div class="Reply">
						<div class="Reply_son">回复<span id="close_span">×</span></div>
						<div class="Reply_son">
							<div class="text_nav">
								<div class="upload_btn">
									<!--图片选择对话框-->
									<div id="div_imgfile">选择图片</div>
									<input type="file" class="imgfile" name="pictureFile" accept=".png,.jpg,.jpeg" num="0">
									<input type="hidden" name="bar_id" value="${bar.bar_id}" />
									<input type="hidden" name="post_id" value="${mypost.post_id}" />
									<input type="hidden" name="user_id" value="${us.user_id}" />
								</div>
							</div>
							<textarea rows="10" cols="20" id="text_content" placeholder="回复楼主:${louzhu.user_name}发布的${mypost.text_title}..." name="text_content"></textarea>
						</div>
						<div class="Reply_son">
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
		</div>
		<div id="goToTop"></div>
		<div class="div_bottom"></div>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
		<script type="text/javascript" src="${ctx}/js/IMGUP.js"></script>
		<script type="text/javascript" src="${ctx}/js/showPost.js"></script>
		<script type="text/javascript" src="${ctx}/js/public.js" ></script>
	</body>
	<script>
		//子回复内回复方法
		function hf(name, id) {
			var son_replies = $(window.event.srcElement.parentElement.parentElement.parentElement.parentElement).find(".son_replies");
			if(son_replies.is(':hidden')) {
				son_replies.show();
			}
			var text = $(window.event.srcElement.parentElement.parentElement.parentElement.parentElement).find(".son_replies textarea");
			text.attr("placeholder", "回复:" + name);
			text.attr("reply_id", id);
		}
		//子回复提交
		function submit(e) {
			var reply_id = $(window.event.srcElement.parentElement).find("textarea").attr("reply_id");
			var son_comment_content = $(window.event.srcElement.parentElement).find("textarea").val();
			if(son_comment_content.trim() == "") {
				alert("回复内容为空,请重新输入!");
				return false;
			}
			if(reply_id == null) {
				console.log("false");
				$.post(window.ctx + "/post/sonComment", {
					"son_comment_content": son_comment_content,
					"comment_id": e,
					"bar_id": "${bar.bar_id}",
					"post_id": "${mypost.post_id}",
					"user_id": "${us.user_id}",
					"reply_id": 0
				}, function(json) {
					alert("回复成功！");
					window.location.reload();
				})
			} else {
				console.log("true");
				$.post(window.ctx + "/post/sonComment", {
					"son_comment_content": son_comment_content,
					"comment_id": e,
					"bar_id": "${bar.bar_id}",
					"post_id": "${mypost.post_id}",
					"user_id": "${us.user_id}",
					"reply_id": reply_id
				}, function(json) {
					alert("回复成功！");
					window.location.reload();

				})
			}
		}
	</script>

</html>