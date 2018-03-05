<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/font/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="js/swiper.min.js"></script>
</head>
<body>
	<nav class="navbar-default navbar-static-side">
			<ul class="nav">
				 <li class="nav-header">
                    <div class="people"> 
                    	<span><img alt="image" class="img-circle" src="image/profile_small.jpg" /></span>
                        <a class="dropdown-toggle" href="javascript:;">
                            <span class="clear block name"><strong><span id="admin">${adminName}</span></strong></span>
                        </a>
                        <a href="outAdmin" class="text-muted text-xs block">退出 <i class="fa fa-sign-out"></i></a>
                    </div>
                </li>
                <li>
                    <a href="AdminProduct.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">潮品管理</span></a>
                </li>
                <li>
                    <a href="AdminUser.jsp"><i class="fa fa-user"></i> <span class="nav-label">潮人管理</span></a>
                </li>
                <li>
                    <a href="AdminInfo.jsp"><i class="fa fa-comments-o"></i> <span class="nav-label">资讯管理</span></a>
                </li>

			</ul>
		</nav><!-- 左侧导航 -->
</body>
<script type="text/javascript">
var adminName = $('#admin').text();
if(adminName != null&&adminName != ""){
	
}else{
	window.location.href="../chen.mingyu/loginAdmin.jsp";//需要跳转的地址          
}
</script>
</html>