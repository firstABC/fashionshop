<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="chen.mingyu.domain.Goods"%>
<%@page import="chen.mingyu.domain.Images"%>
<%@page import="chen.mingyu.domain.News"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>潮品之家</title>
	<link rel="stylesheet" type="text/css" href="css/font/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="js/swiper.min.js"></script>
</head>
<body>
	<div class="banner">
		<header>
			<div class="headerTop">
	        	<div class="header_m lay1200 clearfix">
	                <a href="javascript:;"><img src="image/logo.png" alt="潮品之家" title="潮品之家"></a>
	                <div class="topSearch clearfix fl">
	                    <form method="post" action="">
	                    	<input class="fl inputSearch" id="searchList" type="text" name="keyword" autocomplete="off" placeholder="请输入你喜欢的品牌或商品" value="">
	                       <input type="submit" class="btnSearch fl" value="">
	                    </form>
	                </div>
	                <div class="login">
                		<a href="register.html">注册</a>                
	                    <a href="login.html">登录</a>
            		</div>
	            </div>
	        </div>
	        <div class="list">
	        	<nav class="lay1200 clearfix">
	                 <a href="index.html">首页</a> 
	                 <a href="information.html">潮流资讯</a>
	                 <a href="javascript:;" class="on">新品</a>  
	                 <a href="javascript:;">服装</a>  
	                 <a href="javascript:;">鞋类</a>
	            </nav>
	        </div>
		</header>
	</div>
	
	<div class="main">

		<div class="lay1200">
			<div class="tjContent clearfix">
				<div class="tjGoods">
					<div class="goods clearfix">
			      		
						<%
						 List<Goods> ltgoodsN = (List<Goods>)request.getSession().getAttribute("ltGoodsNew");
						 if(ltgoodsN!=null&&ltgoodsN!=null){
							 for(Goods goods :ltgoodsN){
						%>
						<div class="box showpic">
			      			<div class="picbox">
			      				<a href="javascript:;" title=""><img src="${pageContext.request.contextPath}/upload/<%=goods.getLtMage().get(0).getPathName() %>" alt=""></a>
			      				<a href="javascript:;" class="deShadow" title=""></a>
			      				<div class="actions">
				            		<div class="lefter">
										<a class="p_ilike" href="javascript:;"></a>
				                    </div>
				        		</div>
			      			</div>
			      			<div class="showpic_title">
			      				<a href="javascript:;" target="_blank" title=""><%=goods.getG_title() %></a>
			      			</div>
			      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank"><%=goods.getG_brand() %></a></div>
			      			<div class="showpic_info clearfix">
				                <div class="priceNum fl"><b>¥<%=goods.getG_price() %></b></div>
				                <div class="fr loveNum"><i class="icon iconfont icon-love"></i><span>0</span></div>
				            </div>
			      		</div>
						
						<%
							 }
						 }
						%>
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


	<script type="text/javascript">	
	    $(document).ready(function () {
	    	// 回到顶部
	        $(window).scroll(function () {
	            if ($(window).scrollTop() >= 500) {
	                $('.back-top').css('display', 'block');
	            } else {
	                $('.back-top').css('display', 'none');
	            }
	        });
	        $('.back-top').click(function () {
	            $('html,body').animate({scrollTop: '0px'}, 800);
	        });

	        // 喜欢
	        $('.actions').click(function(){
				if(!$(this).find('.p_ilike').hasClass("p_iliked")){
		            $(this).find('.p_ilike').addClass("p_iliked");
		        }else{
		        	$(this).find('.p_ilike').removeClass("p_iliked");
		        }
			})
	    });

	</script>

	<!-- 输入框模糊提醒 -->
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript">
        $(function() {
		    var searchList = [
		      "商品",
		      "商品1",
		      "商品2",
		      "商品3",
		      "商品4",
		    ];
		    $("#searchList").autocomplete({
		      source: searchList
		    });
		});
	</script>

</body>
</html>