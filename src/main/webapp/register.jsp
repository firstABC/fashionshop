<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/font/iconfont.css">
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
</head>
<body>
	<div class="banner">
		<header>
			<div class="headerTop">
	        	<div class="header_m lay1200 clearfix">
	                <a href="index.jsp"><img src="image/logo.png" alt="潮品之家" title="潮品之家"></a>
	            </div>
	        </div>
		</header>
	</div>
		
	<div class="main">
		<div class="login-panel">
			<div class="form-sidebar">
			    <div class="hand-logo"><i class="icon iconfont icon-hand"></i></div><img src="image/logo.png">
			    <p>全球潮品优选</p>
			  </div>
			<div class="form-container">
				<div class="switch-header">
			      <div class="switch-container">
			        <div class="form-header login">
			          <label class="form-title"><span>注册</span><img src="image/logo.png" alt="潮品之家" title="潮品之家"></label>
			          <a href="login.jsp" class="switch">登录<i class="icon iconfont icon-switch"></i></a>
			        </div>
			      </div>
			    </div>
			    <div class="form-wrap">
			      <form  method="post" action="register" onSubmit="return checkForm()">
			      	<ul>
			          <li class="input-row">
			          	<i class="icon iconfont icon-user"></i>
			            <input type="text" name="userName" value="" placeholder="请输入用户名" autocomplete="off" class="input-phone">
			          </li>
			          <li class="input-row">
			          	<i class="icon iconfont icon-email"></i>
			            <input type="email" name="userEmail" value="" placeholder="请输入邮箱 " autocomplete="off" class="input-phone">
			          </li>
			          <li class="input-row">
			          	<i class="icon iconfont icon-phone"></i>
			            <input type="tel" name="userPhone" value="" placeholder="请输入手机号" autocomplete="off" class="input-phone">
			          </li>
			          <li class="input-row">
			          	<i class="icon iconfont icon-lock"></i>
			            <input type="password" name="userPwd" value="" placeholder="请输入密码" maxlength="20" autocomplete="off" class="input-password" id="pwd">
			          </li>
			          <li class="input-row">
			          	<i class="icon iconfont icon-lock"></i>
			            <input type="password" value="" placeholder="请重复输入密码" maxlength="20" autocomplete="off" class="input-password" id="pwdR">
			          </li>
			        </ul>
			        <div class="form-actions">
			          <div class="form-options">
			            <input type="checkbox" value="1" checked="checked" autocomplete="off" class="checkbox">
			            <label for="agreed">我已阅读并同意遵守</label><a href="javascript:;" style="float:none" class="text show-terms">服务条款</a>
			          </div>
			         <input type="submit" class="button btnLogin" value="注册">
			        </div>
			      </form>
			    </div>
				<div class="social-login">
			      <h5>社交账号登录</h5>
			      <div class="social-links">
			      	<a href="javascript:;" target="_blank" title="微信" class="wechat"><i class="icon iconfont icon-wechat"></i></a>
			      	<a href="javascript:;" target="_blank" title="新浪微博" class="weibo"><i class="icon iconfont icon-weibo"></i></a>
			      	<a href="javascript:;" target="_blank" title="QQ" class="qq"><i class="icon iconfont icon-qq"></i></a>
			      	<a href="javascript:;" target="_blank" title="淘宝" class="taobao"><i class="icon iconfont icon-taobao"></i></a>
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
	</div>

	<span id="msg" style="display:none">${msg}</span>
	<script type="text/javascript">
		$(function(){
			$('.input-row input').focus(function() {
				$(this).parents('.input-row').addClass('focus');
			});
			$('.input-row input').blur(function() {
				$(this).parents('.input-row').removeClass('focus');
			});
		})
		var cont=$("#msg").text();
		if(cont != null&&cont != ""){
			console.log(cont);
			alert(cont);
		}
		function checkForm(){
			if($('#pwdR').val() != $('#pwd').val()){
				alert("密码两次输入不一致!");
				return false;
			}
		}
	</script>
	
</body>
</html>