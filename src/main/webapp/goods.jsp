<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="chen.mingyu.domain.Goods"%>
<%@page import="chen.mingyu.domain.Images"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.1.4.2-min.js"></script>
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
	<%
		Goods goods = (Goods)request.getSession().getAttribute("goods");
	%>
	<div class="main">
		<div class="lay1200 goodContent">
			<div class="goodsIntr clearfix">
				<div class="preview">
					<div class="bigImg">
						<img src="${pageContext.request.contextPath}/upload/<%=goods.getLtMage().get(0).getPathName()%>" alt="三叶草/Adidas Tubular X 小椰子 迷彩 陈奕迅上脚 B25700/B25701" class="midimg" />
						<div style="display:none;" class="winSelector"></div>
					</div><!--bigImg end-->	
					<div class="smallImg">
						<!-- <div class="scrollbutton smallImgUp disabled"></div> -->
						<div class="imageMenu">
							<ul>
								<li class="onlickImg"><img src="${pageContext.request.contextPath}/upload/<%=goods.getLtMage().get(0).getPathName() %>" alt="三叶草/Adidas Tubular X 小椰子 迷彩 陈奕迅上脚 B25700/B25701"/></li>
					<%
						if(goods!=null){
							List<Images> ltM = goods.getLtMage();
							if(ltM.size()>0){
								for(Images image : ltM){
					%>
								<li><img src="${pageContext.request.contextPath}/upload/<%=image.getPathName() %>" alt="${goods.g_title}"/></li>
					<%
								}
							}
						}
					%>
							</ul>
						 </div>
						<div class="scrollbutton smallImgDown"></div>
					</div><!--smallImg end-->	
					<!-- <div class="bigView" style="display:none;"><img width="800" alt="" src="" /></div> -->
				</div>

				<div class="goodSubst">
					<h1>${goods.g_title}</h1>
					<p>${goods.g_detail}</p>
					<div class="pinpai">品牌：<a href="javascript:;" target="_blank">${goods.g_brand }</a></div>
					<div class="d_price"><strong>￥${goods.g_price }</strong></div>
					<div class="d_social clearfix mt20">
	            	<div class="loveNum"><i class="icon iconfont icon-love"></i><span>${goods.g_like}</span></div>
	           		<div class="loveNum"><span>立即预定</span></div>
	            </div>
				</div>
			</div>

			<!-- 评论 -->
			<div class="d_nav_tab">
			<input type="text" name="goodsId" id="gId" value="test"  hidden="hidden"  class="focus">
				<div class="d_menu">评论<span>（3）</span></div>
				<div class="plList">
					<%-- <ul>
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
								<p>此用户没有填写评论！</p>
								<div class="zj"><span>收货26天后追加：</span>用了，非常好，方便</div>
								<div class="time"><span>01.09</span></div>
							</div>
							<div class="goodsType">颜色分类：黑色 44码</div>
							<div class="nm">周***驰<span>（匿名）</span></div>
						</li>
						<li>
							<div class="plText">
								<p>很好很好，还送了实用的小赠品，客服态度非常好。满意！</p>
								<div class="imgs">
									<img src="${pageContext.request.contextPath}/image/goods1-1.jpg" alt="">
									<img src="${pageContext.request.contextPath}/image/goods1-2.jpg" alt="">
								</div>
								<div class="time"><span>2017.12.19</span></div>
							</div>
							<div class="goodsType">颜色分类：黑色 44码</div>
							<div class="nm">周***驰<span>（匿名）</span></div>
						</li>
					</ul> --%>
				</div>
				<a href="javascript:nextPage()" class="morePj">查看更多</a>
			</div>

			<!-- 猜你喜欢 -->
			<div class="guessLike">
				<p>猜你喜欢</p>
				<div class="goods clearfix">
		      		<div class="box showpic">
		      			<div class="picbox">
		      				<a href="javascript:;" title=""><img src="${pageContext.request.contextPath}/image/goods1.jpg" alt=""></a>
		      				<a href="javascript:;" class="deShadow" title=""></a>
		      				<div class="actions">
			            		<div class="lefter">
									<a class="p_ilike" href="javascript:;"></a>
			                    </div>
			        		</div>
		      			</div>
		      			<div class="showpic_title">
		      				<a href="javascript:;" target="_blank" title="">三叶草/Adidas Tubular X 小椰子 迷彩 陈奕迅上脚 B25700/B25701</a>
		      			</div>
		      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank">Adidas originals</a></div>
		      			<div class="showpic_info clearfix">
			                <div class="priceNum fl"><b>¥8500.00</b></div>
			            </div>
		      		</div>

		      		<div class="box showpic">
		      			<div class="picbox">
		      				<a href="javascript:;" title=""><img src="${pageContext.request.contextPath}/image/goods2.jpg" alt=""></a>
		      				<a href="javascript:;" class="deShadow" title=""></a>
		      				<div class="actions">
			            		<div class="lefter">
									<a class="p_ilike" href="javascript:;"></a>
			                    </div>
			        		</div>
		      			</div>
		      			<div class="showpic_title">
		      				<a href="javascript:;" target="_blank" title="">YOHO有货 潮牌MACROPUS 绝对机能系列单肩挎包</a>
		      			</div>
		      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank">MACROPUS</a></div>
		      			<div class="showpic_info clearfix">
			                <div class="priceNum fl"><b>¥48.00</b></div>
			            </div>
		      		</div>

		      		<div class="box showpic">
		      			<div class="picbox">
		      				<a href="javascript:;" title=""><img src="${pageContext.request.contextPath}/image/goods1.jpg" alt=""></a>
		      				<a href="javascript:;" class="deShadow" title=""></a>
		      				<div class="actions">
			            		<div class="lefter">
									<a class="p_ilike" href="javascript:;"></a>
			                    </div>
			        		</div>
		      			</div>
		      			<div class="showpic_title">
		      				<a href="javascript:;" target="_blank" title="">三叶草/Adidas Tubular X 小椰子 迷彩 陈奕迅上脚 B25700/B25701</a>
		      			</div>
		      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank">Adidas originals</a></div>
		      			<div class="showpic_info clearfix">
			                <div class="priceNum fl"><b>¥8500.00</b></div>
			            </div>
		      		</div>

		      		<div class="box showpic">
		      			<div class="picbox">
		      				<a href="javascript:;" title=""><img src="${pageContext.request.contextPath}/image/goods2.jpg" alt=""></a>
		      				<a href="javascript:;" class="deShadow" title=""></a>
		      				<div class="actions">
			            		<div class="lefter">
									<a class="p_ilike" href="javascript:;"></a>
			                    </div>
			        		</div>
		      			</div>
		      			<div class="showpic_title">
		      				<a href="javascript:;" target="_blank" title="">YOHO有货 潮牌MACROPUS 绝对机能系列单肩挎包</a>
		      			</div>
		      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank">MACROPUS</a></div>
		      			<div class="showpic_info clearfix">
			                <div class="priceNum fl"><b>¥48.00</b></div>
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

	<script>	
	var goodsId = $("#gId").val();
  	
	    $(document).ready(function () {
	    	//加载商品评论列表
	    	showConsultList();

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


	    	// 图片上下滚动
	    	var count = $(".imageMenu li").length - 5; /* 显示 6 个 li标签内容 */
	    	var interval = $(".imageMenu li:first").width();
	    	var curIndex = 0;
	    	$('.scrollbutton').click(function(){
	    		if( $(this).hasClass('disabled') ) return false;
	    		if ($(this).hasClass('smallImgUp')) --curIndex;
	    		else ++curIndex;
	    		$('.scrollbutton').removeClass('disabled');
	    		if (curIndex == 0) $('.smallImgUp').addClass('disabled');
	    		if (curIndex == count-1) $('.smallImgDown').addClass('disabled');
	    		$(".imageMenu ul").stop(false, true).animate({"marginLeft" : -curIndex*interval + "px"}, 600);
	    	});	

	    	// 解决 ie6 select框 问题
	    	$.fn.decorateIframe = function(options) {
	            if ($.browser.msie && $.browser.version < 7) {
	                var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
	                $(this).each(function() {
	                    var $myThis = $(this);
	                    //创建一个IFRAME
	                    var divIframe = $("<iframe />");
	                    divIframe.attr("id", opts.iframeId);
	                    divIframe.css("position", "absolute");
	                    divIframe.css("display", "none");
	                    divIframe.css("display", "block");
	                    divIframe.css("z-index", opts.iframeZIndex);
	                    divIframe.css("border");
	                    divIframe.css("top", "0");
	                    divIframe.css("left", "0");
	                    if (opts.width == 0) {
	                        divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
	                    }
	                    if (opts.height == 0) {
	                        divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
	                    }
	                    divIframe.css("filter", "mask(color=#fff)");
	                    $myThis.append(divIframe);
	                });
	            }
	        }

	        $.fn.decorateIframe.defaults = {
	            iframeId: "decorateIframe1",
	            iframeZIndex: -1,
	            width: 0,
	            height: 0
	        }

	        //放大镜视窗
	        // $(".bigView").decorateIframe();
	        //点击到中图
	        var midChangeHandler = null;
	        $(".imageMenu li img").bind("click", function(){
	    		if ($(this).attr("class") != "onlickImg") {
	    			midChange($(this).attr("src").replace("small", "mid"));
	    			$(".imageMenu li").removeAttr("class");
	    			$(this).parent().attr("class", "onlickImg");
	    		}
	    	}).bind("mouseover", function(){
	    		if ($(this).attr("class") != "onlickImg") {
	    			window.clearTimeout(midChangeHandler);
	    			midChange($(this).attr("src").replace("small", "mid"));
	    			$(this).css({ "border": "3px solid #959595" });
	    		}
	    	}).bind("mouseout", function(){
	    		if($(this).attr("class") != "onlickImg"){
	    			$(this).removeAttr("style");
	    			midChangeHandler = window.setTimeout(function(){
	    				midChange($(".onlickImg img").attr("src").replace("small", "mid"));
	    			}, 1000);
	    		}
	    	});

	        function midChange(src) {
	            $(".midimg").attr("src", src).load(function() {
	                // changeViewImg();
	            });
	        }
	        // //大视窗看图
	        // function mouseover(e) {
	        //     if ($(".winSelector").css("display") == "none") {
	        //         $(".winSelector, .bigView").show();
	        //     }
	        //     $(".winSelector").css(fixedPosition(e));
	        //     e.stopPropagation();
	        // }
	        // function mouseOut(e) {
	        //     if ($(".winSelector").css("display") != "none") {
	        //         $(".winSelector, .bigView").hide();
	        //     }
	        //     e.stopPropagation();
	        // }

	        // $(".midimg").mouseover(mouseover); //中图事件
	        // $(".midimg, .winSelector").mousemove(mouseover).mouseout(mouseOut); //选择器事件

	        // var $divWidth = $(".winSelector").width(); //选择器宽度
	        // var $divHeight = $(".winSelector").height(); //选择器高度
	        // var $imgWidth = $(".midimg").width(); //中图宽度
	        // var $imgHeight = $(".midimg").height(); //中图高度
	        // var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度

	        // function changeViewImg() {
	        //     $(".bigView img").attr("src", $(".midimg").attr("src").replace("mid", "big"));
	        // }
	        // changeViewImg();
	        // $(".bigView").scrollLeft(0).scrollTop(0);
	        // function fixedPosition(e) {
	        //     if (e == null) {
	        //         return;
	        //     }
	        //     var $imgLeft = $(".midimg").offset().left; //中图左边距
	        //     var $imgTop = $(".midimg").offset().top; //中图上边距
	        //     X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
	        //     Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
	        //     X = X < 0 ? 0 : X;
	        //     Y = Y < 0 ? 0 : Y;
	        //     X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
	        //     Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

	        //     if ($viewImgWidth == null) {
	        //         $viewImgWidth = $(".bigView img").outerWidth();
	        //         $viewImgHeight = $(".bigView img").height();
	        //         if ($viewImgWidth < 200 || $viewImgHeight < 200) {
	        //             $viewImgWidth = $viewImgHeight = 800;
	        //         }
	        //         $height = $divHeight * $viewImgHeight / $imgHeight;
	        //         $(".bigView").width($divWidth * $viewImgWidth / $imgWidth);
	        //         $(".bigView").height($height);
	        //     }

	        //     var scrollX = X * $viewImgWidth / $imgWidth;
	        //     var scrollY = Y * $viewImgHeight / $imgHeight;
	        //     $(".bigView img").css({ "left": scrollX * -1, "top": scrollY * -1 });
	        //     $(".bigView").css({ "top": 75, "left": $(".preview").offset().left + $(".preview").width() + 15 });

	        //     return { left: X, top: Y };
	        // }
	         
	    
	        // 喜欢
	        $(".loveNum").click(function(){
				if(!$(this).hasClass("active")){
		            $(this).addClass("active");
		            $(this).children("span").text(parseInt($(this).children("span").text())+1);
		        }else{
		        	$(this).removeClass("active");
		        	$(this).children("span").text(parseInt($(this).children("span").text())-1);
		        }
			})
	    });
	    var goodsId = $("#gId").val();
	  	//获取用户评价列表  
		function showConsultList(){
			$('.plList').empty();
			var currentPage=$('#currentPage').val();
			$.ajax({
				url:'${pageContext.request.getContextPath()}/con/getConsultByGoods',
				async: false,
				type:'get',
				data:{
					goodsId:goodsId,
					currentPage:currentPage
				},
				dataType:'json',
				success:function(data){
					/* var dataArr=JSON.parse(data); */
					$('#maxPage').val(data.maxPage);	
					var consultVOArr = data.data;
					console.log(consultVOArr);
					$('#plList').append("<ul>");
					for(var i=0;i<consultVOArr.length;i++){
						var consultVO=consultVOArr[i];
						$('#plList').append("<li><div class='plText'><p>"+consultVO.consultMsg+"</p><div class='time'><span>"+consultVO.consultDate+"</span></div></div><div class='goodsType'>"+consultVO.goodsName+"</div></div></li>");
						if(consultVO.adminName!=null){
							$('#plList').append("<div class='answer'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font class='adminName'>"+consultVO.adminName+"</font>: "+consultVO.replyMsg+"<div class='time'>"+consultVO.replyDate+"</div></div>");
						}
					}
					$('.plList').append("</ul>");
					/* //循环完之后再加上分页 
					if(consultVOArr!=null && consultVOArr!=''){
						$('#plList').append("<div class='pagination'>"+
								"<a href='javascript:void(0)' onclick='firstPage()'>首页</a>" 
								+"&nbsp;<a href='javascript:void(0)' onclick='lastPage()'>上一页</a>"
								+"&nbsp;<a href='javascript:void(0)' onclick='nextPage()'>下一页</a>"
								+"&nbsp;<a href='javascript:void(0)' onclick='endPage()'>尾页</a>&nbsp;" 
								+$('#currentPage').val()+"/共"+$('#maxPage').val()+"页"  
								+"</div>");
					}else{
						$('#plList').append("<p class='consultAdvice'>暂无评价~</P>");
					} */
				}
			});
		}
			
			//评论分页功能 
			//下一页
			function nextPage(){
				var current=$('#currentPage').val();
				var maxPage=$('#maxPage').val();
				if(current==maxPage){
					showConsultList();
				}else if(current<maxPage){
					$('#currentPage').val(parseInt(current)+parseInt(1));
					showConsultList();
				}
			}
	</script>

</body>
</html>