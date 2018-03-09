<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="chen.mingyu.domain.Goods"%>
<%@page import="chen.mingyu.domain.Images"%>
<%@page import="chen.mingyu.domain.News"%>

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
</head>
<body>
	<div class="banner">
		<jsp:include page="header.jsp" flush="true"/>
		<div class="list">
        	<nav class="lay1200 clearfix">
                 <a href="javascript:;" class="on">首页</a> 
                 <a href="information.jsp">潮流资讯</a>
                 <a href="javascript:;">新品</a>  
                 <a href="javascript:;">服装</a>  
                 <a href="javascript:;">鞋类</a>
            </nav>
		</div>
	</div>
	<div class="main">
		<!-- 轮播图 -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/image/banner1.jpg" alt=""></div>  
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/image/banner2.jpg" alt=""></div>  
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/image/banner3.jpg" alt=""></div>  
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div> 
		</div>
		<%
			List<News> ltNews = (List<News>)request.getSession().getAttribute("ltNews");
		%>
		<div class="lay1200">
			<!-- 资讯推荐 -->
			<div class="information clearfix">
				<div class="smadd-pic">
					<p class="oha-chan"><span>潮流资讯</span></p>
					<a href="infoDemo.jsp" target="_blank"><img alt="" src="${pageContext.request.contextPath}/upload/<%=ltNews.get(0).getLtMage().get(0).getPathName() %>"></a>
					<a href="infoDemo.jsp" target="_blank"><img alt="" src="${pageContext.request.contextPath}/upload/<%=ltNews.get(1).getLtMage().get(0).getPathName() %>"></a>
					<a href="infoDemo.jsp" target="_blank"><img alt="" src="${pageContext.request.contextPath}/upload/<%=ltNews.get(2).getLtMage().get(0).getPathName() %>"></a>
					<a href="infoDemo.jsp" target="_blank"><img alt="" src="${pageContext.request.contextPath}/upload/<%=ltNews.get(3).getLtMage().get(0).getPathName() %>"></a>
				</div>
				<div class="smadd-hiddiv">
					<div class="ind-hotzx-bt">
		        		<a class="bt-on" href="javascript:;">最新咨询</a>
		        	</div>
		        	<ul class="ind-hotul">
		        		<li>
		        			<span class="hot-i">1</span>
		        			<a href="${pageContext.request.contextPath}/news/newsInfo?n_id=<%=ltNews.get(0).getN_id()%>"><%=ltNews.get(0).getN_title() %></a>
		        		</li>
		        		<li>
		        			<span class="hot-i">2</span>
		        			<a href="${pageContext.request.contextPath}/news/newsInfo?n_id=<%=ltNews.get(1).getN_id()%>"><%=ltNews.get(1).getN_title() %></a>
		        		</li>
		        		<li>
		        			<span class="hot-i">3</span>
		        			<a href="${pageContext.request.contextPath}/news/newsInfo?n_id=<%=ltNews.get(2).getN_id()%>"><%=ltNews.get(2).getN_title() %></a>
		        		</li>
		        		<li>
		        			<span>4</span>
		        			<a href="${pageContext.request.contextPath}/news/newsInfo?n_id=<%=ltNews.get(3).getN_id()%>"><%=ltNews.get(3).getN_title() %></a>
		        		</li>
		        		<li>
		        			<span>5</span>
		        			<a href="${pageContext.request.contextPath}/news/newsInfo?n_id=<%=ltNews.get(4).getN_id()%>"><%=ltNews.get(4).getN_title() %></a>
		        		</li>
		        	</ul>
				</div>
			</div>

			<div class="tjContent clearfix">
				<div class="tjTitle">
					<ul>
						<li class="active">
			            	<a href="javascript:;">热门推荐</a>
			            </li>
			            <li>
			            	<a href="javascript:;">新品预定</a>
			            </li>
					</ul>
				</div>
				<!-- 热门推荐 -->
				<div class="tjGoods">
					<div class="goodsList">
				      	<a href="javascript:;" class="active">男士</a>
				      	<a href="javascript:;">女士</a>
			      	</div>
			      	<!-- 男士 -->
			     <div class="goods goodsN clearfix">
			      <%
			      	List<Goods> ltgoodsM = (List<Goods>)request.getSession().getAttribute("ltgoodsM");
			      	if(ltgoodsM!=null&&ltgoodsM.size()>0){
			      		for(Goods good:ltgoodsM){
			      			List<Images> ltM = good.getLtMage();
			      			Images images = ltM.get(0);
			      %>
			      		<div class="box showpic">
			      			<div class="picbox">
			      				<a href="goods.jsp" title=""><img src="${pageContext.request.contextPath}/upload/<%=images.getPathName() %>" alt=""></a>
			      				<a href="goods.jsp" class="deShadow" title=""></a>
			      				<div class="actions">
				            		<div class="lefter">
										<a class="p_ilike" href="javascript:;"></a>
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
			      	<!-- 女士 -->
			      	<div class="goods goodsN none clearfix">
			      	 <%
			      	List<Goods> ltgoodsW = (List<Goods>)request.getSession().getAttribute("ltgoodsW");
			      	if(ltgoodsW!=null&&ltgoodsM.size()>0){
			      		for(Goods good:ltgoodsW){
			      			List<Images> ltM = good.getLtMage();
			      			Images images = ltM.get(0);
			      %>
			      	
			      		<div class="box showpic">
			      			<div class="picbox">
			      				<a href="javascript:;" title=""><img src="${pageContext.request.contextPath}/upload/<%=images.getPathName() %>" alt=""></a>
			      				<a href="javascript:;" class="deShadow" title=""></a>
			      				<div class="actions">
				            		<div class="lefter">
										<a class="p_ilike" href="javascript:;"></a>
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
			      	
				<!-- 新品预定 -->
				<div class="tjGoods none">
					<div class="goods clearfix">

			      		 <%
			      	List<Goods> ltgoodsN = (List<Goods>)request.getSession().getAttribute("ltgoodsN");
			      	if(ltgoodsN!=null&&ltgoodsM.size()>0){
			      		for(Goods good:ltgoodsN){
			      			List<Images> ltM = good.getLtMage();
			      			Images images = ltM.get(0);
			      %>
			      	
			      		<div class="box showpic">
			      			<div class="picbox">
			      				<a href="javascript:;" title=""><img src="${pageContext.request.contextPath}/upload/<%=images.getPathName() %>" alt=""></a>
			      				<a href="javascript:;" class="deShadow" title=""></a>
			      				<div class="actions">
				            		<div class="lefter">
										<a class="p_ilike" href="javascript:;"></a>
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
		//登录成功
		var userName = $('#user').text();
		if(userName != null&&userName !=""){
			$('#index').hide();
			$('#success').show();
		}else{
			$('#success').hide();
		}

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

			// 热门推荐、新品预定
			$('.tjTitle li').click(function(){
				if(!$(this).hasClass("active")){
	              $('.tjTitle li').removeClass("active");
	              $(this).addClass("active");
	            }
				var aa = $(this).index();

		        $('.tjContent').children('.tjGoods').hide();
		        $('.tjContent').children('.tjGoods').eq(aa).show();
			})

			// 男士女士
			$('.goodsList a').click(function(){
				if(!$(this).hasClass("active")){
	              $('.goodsList a').removeClass("active");
	              $(this).addClass("active");
	            }
				var ab = $(this).index();

	          $('.tjGoods').children('.goodsN').hide();
	          $('.tjGoods').children('.goodsN').eq(ab).show();
			})
	    });

        // 轮播图
    	var swiper = new Swiper('.swiper-container', {
        	pagination: '.swiper-pagination',
        	slidesPerView: 1,	
       		slidesPerGroup : 1,
			loop: true,
       		paginationClickable: true,
			autoplay: 2000
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