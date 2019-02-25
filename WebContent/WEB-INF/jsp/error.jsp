<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="${ctx}/images/tie.png" type="image/x-icon">
		<link rel="stylesheet" href="${ctx}/css/homePage.css" />
		<link rel="stylesheet" href="${ctx}/css/messagebox.css" />
		<link rel="stylesheet" href="${ctx}/css/footer.css" />
		<script type="text/javascript" src="${ctx}/js/messageBox.js" ></script>
		<title>非法访问</title>
	</head>

	<body>
		<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
		<div class="main">
			<div class="Reminder">
				<div class="Reminder_son">
					<h2>尊敬贴吧用户您好</h2></div>
				<div class="suojin">第1条：凡是注册用户和浏览用户均为本贴吧用户，以下统称【用户】 第2条：用户的个人信息受到保护，不接受任何个人或单位的查询。司法、检察机关因法律需要除外，用户的个人设置公开除外。 第3条：用户的言行不得违反《计算机信息网络国际联网安全保护管理办法》、《互联网信息服务管理办法》、《互联网电子公告服务管理规定》、《维护互联网安全的决定》、《互联网新闻信息服务管理规定》等相关法律规定。 另外注意 不得在本贴吧发布、传播或以其它方式传送含有下列内容之一的信息 ①反对宪法所确定的基本原则的。 ②危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的。 ③损害国家荣誉和利益的。 ④煽动民族仇恨、民族歧视、破坏民族团结的。 ⑤破坏国家宗教政策，宣扬邪教和封建迷信的。 ⑥散布谣言，扰乱社会秩序，破坏社会稳定的。 ⑦散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的。 ⑧侮辱或者诽谤他人，侵害他人合法权利的。 ⑨煽动非法集会、结社、游囧行、示囧威、聚众扰乱社会秩序的。 ⑩以非法民间组织名义活动的。 ⑾含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容。 ⑿含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的。 第4条：不允许在本贴吧内发布任何形式的广告。 第5条：用户应承担一切因其个人的行为而直接或间接导致的民事或刑事法律责任，用户应负责赔偿。 第6条：本贴吧拥有对违反本站规则的用户进行处理的权力，直至禁止其在本贴吧内发布信息。 第7条：禁止任何使用发贴机等非法软件进行爆吧、违规发贴的行为。 第8条：任何用户发现贴吧贴子内容涉嫌侮辱或者诽谤他人、侵害他人合法权益的或违反贴吧协议的，有权按贴吧投诉规则进行投诉。 第9条：凡文章出现以下情况之一，贴吧管理人员有权不提前通知作者直接删除，并依照有关规定作相应处罚。情节严重者，贴吧有权对其做出关闭部分权限、暂停直至删除其帐号。 1、发表含有本协议第7条禁止发布、传播内容的文章； 2、发表不符合版面主题，或者无内容的灌水文章； 3、同一文章多次出现的； 4、非广告发布区域发布的与版面主题关系不大的广告； 5、文章内容或个人签名会包含有严重影响网友浏览的内容或格式的；
				</div>
			</div>
			<div class="tieba">
				<h2>爱逛的吧</h2>
				<c:forEach items="${BarList}" var="row">
					<div class="tieba_son">
						<a href="${ctx}/post/show?bar_id=${row.bar_id}" target="_blank"><img src="${row.img_url}" />${row.bar_name}</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="goToTop"></div>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	</body>
	<script type="text/javascript" src="${ctx}/js/public.js" ></script>
	<script>
		messageBox("提示","您当前还未登录，请登录！",function(){
						window.location.href = "${ctx}/user/login";
					})
	</script>
</html>