<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
	<link rel="stylesheet" type="text/css" href="css/font/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
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
	                 <a href="information.jsp">潮流资讯</a>
	                 <a href="javascript:;">新品</a>  
	                 <a href="javascript:;">服装</a>  
	                 <a href="javascript:;">鞋类</a>
	            </nav>
	        </div>
		</header>
	</div>
	
	<div class="main">
		<div class="lay1200 infoMy">
			<div class="info clearfix">
				<img src="image/people.png" alt="个人中心头像" class="peopleImg">
				<div class="infoText">
					<p>用&nbsp;户&nbsp;名:<input type="text" name="userName" value=" ${user.userName}" placeholder="用户名" disabled="disabled"></p>
					<p>手&nbsp;机&nbsp;号:<input type="tel" name="userPhone" value="${user.userPhone}" placeholder="手机号" disabled="disabled"></p>
					<p>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:<input type="email" name="userEmail" value="${user.userEmail}" placeholder="邮箱" disabled="disabled"></p>
					<p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="userPwd" value="${user.userPwd}" placeholder="*******" disabled="disabled"></p>
					<a href="javascript:;" class="tj">编辑</a>
				</div>
			</div>

			<div class="myOrder">
				<div class="myList">
					<ul>
						<li class="active"><a href="javascript:;">我的预定<span>（2）</span></a></li>
						<li><a href="javascript:;">我的喜欢<span>（1）</span></a></li>
						<li><a href="javascript:;">我的评论<span>（2）</span></a></li>
					</ul>
				</div>
				<div class="myMenu">
					<!-- 我的预定 -->
					<div class="myItem">
						<div class="goods clearfix">
				      		<div class="box showpic">
				      			<div class="picbox">
				      				<a href="javascript:;" title=""><img src="image/goods11.jpg" alt=""></a>
				      				<a href="javascript:;" class="deShadow" title=""></a>
				      				<div class="actions">
					            		<div class="lefter">
											<a class="p_iliked" href="javascript:;"></a>
					                    </div>
					        		</div>
				      			</div>
				      			<div class="showpic_title">
				      				<a href="javascript:;" target="_blank" title="">BLACK HEAD黑头 骷髅头铆钉双肩包、旅行包</a>
				      			</div>
				      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank">black head</a></div>
				      			<div class="showpic_info clearfix">
					                <div class="priceNum fl"><b>¥89.00</b><s>268.00</s><span>( 3.3 折 )</span></div>
					            </div>
				      		</div>

				      		<div class="box showpic">
				      			<div class="picbox">
				      				<a href="javascript:;" title=""><img src="image/goods22.jpg" alt=""></a>
				      				<a href="javascript:;" class="deShadow" title=""></a>
				      				<div class="actions">
					            		<div class="lefter">
											<a class="p_iliked" href="javascript:;"></a>
					                    </div>
					        		</div>
				      			</div>
				      			<div class="showpic_title">
				      				<a href="javascript:;" target="_blank" title="">Mean Streets x YZ Tattoo 联名设计棒球帽 - 纯黑限定版</a>
				      			</div>
				      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank">Mean Streets</a></div>
				      			<div class="showpic_info clearfix">
					                <div class="priceNum fl"><b>¥318.00</b><s class="ml5">398.00</s> <span>( 8.0 折 )</span></div>
					            </div>
				      		</div>
				      	</div>
					</div>
					<!-- 我的喜欢 -->
					<div class="myItem none">
						<div class="goods clearfix">
				      		<div class="box showpic">
				      			<div class="picbox">
				      				<a href="javascript:;" title=""><img src="image/goods22.jpg" alt=""></a>
				      				<a href="javascript:;" class="deShadow" title=""></a>
				      				<div class="actions">
					            		<div class="lefter">
											<a class="p_iliked" href="javascript:;"></a>
					                    </div>
					        		</div>
				      			</div>
				      			<div class="showpic_title">
				      				<a href="javascript:;" target="_blank" title="">Mean Streets x YZ Tattoo 联名设计棒球帽 - 纯黑限定版</a>
				      			</div>
				      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank">Mean Streets</a></div>
				      			<div class="showpic_info clearfix">
					                <div class="priceNum fl"><b>¥318.00</b><s class="ml5">398.00</s> <span>( 8.0 折 )</span></div>
					            </div>
				      		</div>
				      	</div>
					</div>
					<!-- 我的评论 -->
					<div class="myItem none">
						<div class="plList">
							<ul>
								<li>
									<div class="plText">
										<p>老板很给力，周五晚下的单，今天周日中午就收到宝贝了，物流给力，赞。客服的态度也很好，最重要的是，东西很实用。外观好看方便，看着不错，高大尚。总之，非常非常完美的购物体验！</p>
										<div class="time"><span>01.23</span></div>
									</div>
									<div class="goodsType">颜色分类：白色 42码</div>
									<div class="nm">月***汐<span>（匿名）</span></div>
								</li>
								<li>
									<div class="plText">
										<p>很好很好，还送了实用的小赠品，客服态度非常好。满意！</p>
										<div class="imgs">
											<img src="image/goods1-1.jpg" alt="">
											<img src="image/goods1-2.jpg" alt="">
										</div>
										<div class="time"><span>2017.12.19</span></div>
									</div>
									<div class="goodsType">颜色分类：黑色 44码</div>
									<div class="nm">周***驰<span>（匿名）</span></div>
								</li>
							</ul>
						</div>
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
		<div class="editBox">
		<div class="info">
				<h1>修改个人信息</h1>
				<div class="infoText">
					<form action="updateUser" method="post">
							<input type="text" name="userId" value="${user.userId }" hidden="hidden" class="focus">
							<p>用&nbsp;户&nbsp;名:<input type="text" name="userName" value="${user.userName}" placeholder="用户名" class="focus"></p>
							<p>手&nbsp;机&nbsp;号:<input type="tel" name="userPhone" value="${user.userPhone}" placeholder="手机号" class="focus" ></p>
							<p>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:<input type="email" name="userEmail" value="${user.userEmail}" placeholder="邮箱" class="focus"></p>
							<p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="userPwd" value="${user.userPwd}" placeholder="*******" class="focus"></p>		
						
						<div class="sure">
							<a href="javascript:;" class="close">取消</a>
							<a href="javascript:;"><input type="submit" name="" value="确认" placeholder=""></a>
						</div>
					</form>
				</div>
		</div>
		</div>
	<script type="text/javascript">
		$(function(){
			$('.myList li').click(function(){
				if(!$(this).hasClass("active")){
	              $('.myList li').removeClass("active");
	              $(this).addClass("active");
	            }
				var aa = $(this).index();
		        $('.myMenu').children('.myItem').hide();
		        $('.myMenu').children('.myItem').eq(aa).show();
			})

			// 信息编辑
			$('.tj').click(function(){
				$('.editBox').show();
			});
			$('.sure a').click(function(){
				$('.editBox').hide();
			})
		})
	</script>
	
</body>
</html>