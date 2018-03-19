<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="chen.mingyu.domain.Goods"%>
<%@page import="chen.mingyu.domain.Images"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>潮品之家</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/swiper.min.js"></script>
	<script type="text/javascript">
		function addLike(g_id){
			var userId = document.getElementById("hiddenuser").value;
			if(userId!=null&&userId!=""){
				$.ajax({
					type:"post",
					url:'${pageContext.request.contextPath}/goods/addLike?g_id='+g_id,
					success:function(result){
						if(result.message == 'repetition'){
							alert("请不要重复收藏");
							
						}else{
							alert("收藏成功！");
						}				
					}
					
				})
			}
		}
	</script>
</head>
<body>
	<div class="banner">
		<header>
			<jsp:include page="header.jsp" flush="true"/>
	        <div class="list">
	        	<nav class="lay1200 clearfix">
	                 <a href="${pageContext.request.contextPath}/switch/toIdex">首页</a> 
                	 <a href="${pageContext.request.contextPath}/news/toNewsMangeIndex">潮流资讯</a>
                	 <a href="${pageContext.request.contextPath}/goods/toNewProduct" >新品</a>  
	                 <a href="${pageContext.request.contextPath}/goods/toCloProduct" class="on">服装</a>
	                 <a href="${pageContext.request.contextPath}/goods/toShoProduct"">鞋类</a>
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
			      	List<Goods> ltGoodsClo = (List<Goods>)request.getSession().getAttribute("ltGoodsClo");
			      	if(ltGoodsClo!=null&&ltGoodsClo.size()>0){
			      		for(Goods good:ltGoodsClo){
			      			List<Images> ltM = good.getLtMage();
			      			Images images = ltM.get(0);
			      %>
			      		<div class="box showpic">
			      			<div class="picbox">
			      				<a href="goods.jsp" title=""><img src="${pageContext.request.contextPath}/upload/<%=images.getPathName() %>" alt=""></a>
			      				<a href="goods.jsp" class="deShadow" title=""></a>
			      				<div class="actions">
				            		<div class="lefter">
										<a class="p_ilike" href="javascript:addLike('<%=good.getG_id() %>');"></a>
				                    </div>
				        		</div>
			      			</div>
			      			<div class="showpic_title">
			      				<a href="${pageContext.request.contextPath}/goods/toGInfo?g_id=<%=good.getG_id() %>" target="_blank" title=""><%=good.getG_title() %></a>
			      			</div>
			      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank"><%=good.getG_brand()%></a></div>
			      			<div class="showpic_info clearfix">
				                <div class="priceNum fl"><b><%=good.getG_price() %></b></div>
				                <div class="fr loveNum"><i class="icon iconfont icon-love"></i><span><%=good.getG_like() %></span></div>
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
		<div class="back-top" style="display: none;"><img src="${pageContext.request.contextPath}/image/back-top.png"></div>
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
	        	if (!$('.userId').children('input').val()) {
	        		alert('请先登录~');
	        	} else{
					var loveNum =  parseInt($(this).parents('.showpic').find('.loveNum').children('span').text());
					if(!$(this).find('.p_ilike').hasClass("p_iliked")){
			            $(this).find('.p_ilike').addClass("p_iliked");
			            $(this).parents('.picbox').parents('.showpic').find('.loveNum').children('span').text(loveNum+1)
			        }
			    }
			}) 
	    });

	</script>

	<!-- 输入框模糊提醒 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
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