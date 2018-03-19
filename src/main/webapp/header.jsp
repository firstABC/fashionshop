<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/swiper.min.js"></script>
</head>
<body>
	<div class="headerTop">
       	<div class="header_m lay1200 clearfix">
               <a href="${pageContext.request.contextPath}/switch/toIdex"><img src="${pageContext.request.contextPath}/image/logo.png" alt="潮品之家" title="潮品之家"></a>
               <div class="topSearch clearfix fl">
                   <form method="post" action="${pageContext.request.contextPath}/goods/selectGoodsByCondition">
                   	<input class="fl inputSearch" id="searchList" type="text" name="keyword" autocomplete="off" placeholder="请输入你喜欢的品牌或商品" value="">
                      <input type="submit" class="btnSearch fl" value="">
                   </form>
               </div>
               <div class="login">
                <li id="index">
              		<a href="${pageContext.request.contextPath}/register.jsp">注册</a>                
                   <a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
    	
    			 <li id="success">
    			 	     <a href="${pageContext.request.contextPath}/out" target="_parent">退出登录</a></li>
    			 		 <a href="${pageContext.request.contextPath}/getUserInfoById?userId=${userId}" class="user"><i class="icon iconfont icon-user"></i> <span id="user">${userName}</span></a>
          		</div>
           </div>
       </div>
</body>
<script type="text/javascript">
var userName = $('#user').text();
if(userName != null&&userName !=""){
	$('#index').hide();
	$('#success').show();
}else{
	$('#success').hide();
}
</script>
</html>