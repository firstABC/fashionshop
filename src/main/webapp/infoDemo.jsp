<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>潮品之家</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js"></script>
</head>
<body>
	<div class="banner">
		<header>
			<jsp:include page="header.jsp" flush="true"/>
	        <div class="list">
	        	<nav class="lay1200 clearfix">
	                 <a href="${pageContext.request.contextPath}/switch/toIdex" >首页</a> 
                 	<a href="${pageContext.request.contextPath}/news/toNewsMangeIndex" class="on">潮流资讯</a>
                 	<a href="${pageContext.request.contextPath}/goods/toNewProduct">新品</a>  
                 	<a href="${pageContext.request.contextPath}/goods/toCloProduct">服装</a>  
                	 <a href="${pageContext.request.contextPath}/goods/toShoProduct"">鞋类</a>
	            </nav>
	        </div>
		</header>
	</div>

	<div class="main">
		<div class="lay1200">
			<div class="zxWz">
				<h2>${news.n_title }</h2>
				<div class="ti_user">
					<span>
						<a href="javascript:;" title="潮品之家独家频道">潮品之家独家频道</a>
					</span>
					<p>发布者：<span>${news.n_author}</span><span>时间：${news.n_dateTime }</span>阅读量:${news.n_number}</p>
			    </div>
			    <div class="zxWz-content">
			    	<p>${news.n_detal }</p>
			    	<div class="zxWzImgs">
			    		<ul>
			    			<li><img src="${pageContext.request.contextPath}/upload/${news.ltMage.get(0).pathName}" alt=""></li>
			    			<li><img src="${pageContext.request.contextPath}/upload/${news.ltMage.get(1).pathName}" alt=""></li>
			    			<li><img src="${pageContext.request.contextPath}/upload/${news.ltMage.get(2).pathName}" alt=""></li>
			    			<li><img src="${pageContext.request.contextPath}/upload/${news.ltMage.get(3).pathName}" alt=""></li>
				    	</ul>
			    	</div>
			    </div>
			</div>
		</div>
	</div>

	<!-- 地址栏 -->
	<div class="foot_wrap">
	    <div class="foot lay1200">
	        <div class="footNav">
	            <ul class="fl">
	                <li class="fl"><a href="javascript:;" target="_blank">关于我们</a></li>	
	                <li class="fl"><a href="javascript:;" target="_blank">联系我们</a></li>	
	                <li class="fl"><a href="javascript:;" target="_blank">加入我们</a></li>		
	                <li class="fl"><a href="javascript:;" target="_blank">友情链接</a></li>
	                <li class="fl"><a href="javascript:;" target="_blank">意见反馈</a></li>		
	            </ul>
	            <span>Copyright © 2012 - 2018 版权所有 pinchao.cc</span><span>苏ICP备12028376号-2</span>
	        </div>
	    </div>
		<!-- 回到顶部 -->
		<div class="back-top" style="display: none;"><img src="image/back-top.png"></div>
	</div>

</body>
</html>