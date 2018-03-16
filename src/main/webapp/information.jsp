<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="chen.mingyu.domain.News"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>潮品之家</title>
	<link rel="stylesheet" type="text/css" href="css/font/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
</head>
<body>
	<div class="banner">
		<header>
			<jsp:include page="header.jsp" flush="true"/>
	        <div class="list">
	        	<nav class="lay1200 clearfix">
	                 <a href="index.jsp">首页</a> 
	                 <a href="information.jsp" class="on">潮流资讯</a>
	                 <a href="javascript:;">新品</a>  
	                 <a href="javascript:;">服装</a>  
	                 <a href="javascript:;">鞋类</a>
	            </nav>
	        </div>
		</header>
	</div>

	<div class="main">
		<div class="lay1200">
			<div class="zx clearfix">
				<ul>
				<%
				List<News> ltNews =  (List<News>)request.getSession().getAttribute("ltNews");
				if(ltNews!=null&&ltNews.size()>0){
					for(News news :ltNews){
				%>	
					<li>
						<a href="javascript:;">
							<div class="zxImg"><img src="${pageContext.request.contextPath}/upload/<%=news.getLtMage().get(0) %>" alt=""></div>
                        	<div class="zxText">
                        		<span class="title"><%=news.getN_title() %></span>
                        		<span class="author"><%=news.getN_author() %></span>
                        		<span class="date"><%=news.getN_dateTime() %></span>
                        	</div>
						</a>
					</li>
				<%	
					}
				}
				%>
				</ul>
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