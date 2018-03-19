<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="chen.mingyu.domain.Goods"%>
<%@page import="chen.mingyu.domain.Images"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font/iconfont.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js"></script>
</head>
<body>
	<div class="banner">
		<header>
			<jsp:include page="header.jsp"/>
	        <div class="list">
	        	<nav class="lay1200 clearfix">
		             <a href="${pageContext.request.contextPath}/switch/toIdex" class="on">首页</a> 
	                 <a href="${pageContext.request.contextPath}/news/toNewsMangeIndex">潮流资讯</a>
	                 <a href="${pageContext.request.contextPath}/goods/toNewProduct">新品</a>  
	                 <a href="${pageContext.request.contextPath}/goods/toCloProduct">服装</a>  
	                 <a href="${pageContext.request.contextPath}/goods/toShoProduct"">鞋类</a>
	            </nav>
	        </div>
		</header>
	</div>
	<div class="main">
		<div class="lay1200 infoMy">
			<div class="info clearfix">
				<img src="${pageContext.request.contextPath}/image/people.png" alt="个人中心头像" class="peopleImg">
				<div class="infoText">
					<input type="text" name="userIdN" value="${userId }" hidden="hidden" id="uId">
					<p>用&nbsp;户&nbsp;名:<input type="text" name="userNameN" value="${user.userName}" placeholder="用户名" disabled="disabled" class="uName"></p>
					<p>手&nbsp;机&nbsp;号:<input type="tel" name="userPhoneN" value="${user.userPhone}" placeholder="手机号" disabled="disabled" class="uPhone"></p>
					<p>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:<input type="email" name="userEmailN" value="${user.userEmail}" placeholder="邮箱" disabled="disabled" class="uEmail"></p>
					<p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="userPwdN" value="${user.userPwd}" placeholder="*******" disabled="disabled" class="uPwd"></p>
					<a href="javascript:;" class="tj">编辑</a>
				</div>
			</div>

			<div class="myOrder">
				<div class="myList">
					<ul>
						<li class="active"><a href="javascript:;">我的预定</a></li>
						<li><a href="javascript:;">我的喜欢</a></li>
						<li><a href="javascript:;">我的评论</a></li>
					</ul>
				</div>
				<div class="myMenu">
					<!-- 我的预定 -->
					<div class="myItem">
						<div class="goods clearfix" id="myOrder">
						<%
						List<Goods> ltgoodsOrder = (List<Goods>)request.getSession().getAttribute("ltgoodsOrder");
						if(ltgoodsOrder!=null){
							for(Goods goods : ltgoodsOrder){
						%>
				      		<div class="box showpic">
				      			<div class="picbox">
				      				<a href="javascript:;" title=""><img src="${pageContext.request.contextPath}/upload/<%=goods.getLtMage().get(0).getPathName() %>" alt=""></a>
				      				<a href="javascript:;" class="deShadow" title=""></a>
				      				<!-- <div class="actions">
					            		<div class="lefter">
											<a class="p_iliked" href="javascript:;"></a>
					                    </div>
					        		</div> -->
				      			</div>
				      			<div class="showpic_title">
				      				<a href="${pageContext.request.contextPath}/goods/toGInfo?g_id=<%=goods.getG_id() %>" target="_blank" title=""><%=goods.getG_title() %></a>
				      			</div>
				      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank"><%=goods.getG_brand() %></a></div>
				      			<div class="showpic_info clearfix">
					                <div class="priceNum fl"><b>¥<%=goods.getG_price() %></b></div>
					                <a href="javascript:toShow('<%=goods.getG_id() %>');" class="plNow">立即评论</a>
					            </div>
				      		</div>
						<%
						
							}
						}
						%>
				      		
				      	</div>
					</div>
					<!-- 我的喜欢 -->
					<div class="myItem none">
						<div class="goods clearfix">
						<%
						List<Goods> ltgoodsMylike = (List<Goods>)request.getSession().getAttribute("ltgoodsMylike");
						if(ltgoodsMylike!=null){
							for(Goods goods : ltgoodsMylike){
						%>
				      		<div class="box showpic">
				      			<div class="picbox">
				      				<a href="javascript:;" title=""><img src="${pageContext.request.contextPath}/upload/<%=goods.getLtMage().get(0).getPathName() %>" alt=""></a>
				      				<a href="javascript:;" class="deShadow" title=""></a>
				      				<div class="actions">
					            		<div class="lefter">
											<a class="p_iliked" href="javascript:;"></a>
					                    </div>
					        		</div>
				      			</div>
				      			<div class="showpic_title">
				      				<a href="${pageContext.request.contextPath}/goods/toGInfo?g_id=<%=goods.getG_id() %>" target="_blank" title=""><%=goods.getG_title() %></a>
				      			</div>
				      			<div class="showpic_pinpaiinfo">品牌：<a href="javascript:;" target="_blank"><%=goods.getG_brand() %></a></div>
				      			<div class="showpic_info clearfix">
					                <div class="priceNum fl"><b>¥<%=goods.getG_price() %></b></div>
					            </div>
				      		</div>
				      		<%
						
							}
						}
						%>
				      	</div>
					</div>
					<!-- 我的评论 -->
					<div class="myItem none">
						<div class="plList" id="plList">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> 
	<input type="hidden" id="currentPage" value="1">	
	<input type="hidden" id="maxPage">
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
		<!-- 个人信息修改 -->
		<div class="editBox">
		<div class="info">
				<h1>修改个人信息</h1>
				<div class="infoText">
					<form action="" method="post" id="updateUserForm" onSubmit="return checkForm()">
							<input type="text" name="userId" value="${sessionScope.user.userId }" hidden="hidden" class="focus">
							<p>用&nbsp;户&nbsp;名:<input type="text" name="userName" value="${sessionScope.user.userName}" placeholder="用户名" class="focus"></p>
							<p>手&nbsp;机&nbsp;号:<input type="tel" name="userPhone" value="${sessionScope.user.userPhone}" placeholder="手机号" class="focus" ></p>
							<p>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:<input type="email" name="userEmail" value="${sessionScope.user.userEmail}" placeholder="邮箱" class="focus"></p>
							<p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="userPwd" value="${sessionScope.user.userPwd}" placeholder="*******" class="focus" id="pwd"></p>
							<p>确认密码:<input type="password" value="${sessionScope.user.userPwd}" placeholder="*******" class="focus" id="pwdR">		
						<div class="sure">
							<a href="javascript:;" class="close">取消</a>
							<a href="javascript:updateUser()">确认</a>
							<span id="errorMsg" style="display:none"></span>
						</div>
					</form>
				</div>
		</div>
		</div>
		<!-- 评论 -->
		<div class="plBox">
			<div class="info">
				<h1>立即评论</h1>
				<div class="plTextarea">
				<form action="" method="post">
					<input type="text" name="userId" id="plUserId" value="${sessionScope.user.userId }" hidden="hidden" class="focus">
					<input type="text" name="goodsId" id="gId" class="focus" hidden="hidden">
					<textarea name="consultMsg" id="consultMsg" placeholder="请输入评论内容"></textarea>
					<div class="sure2">
						<a href="javascript:;" class="close">取消</a>
						<a href="javascript:addConsult()">确认</a>
					</div>
				</form>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	var userId = $("#uId").val();
	function addConsult(){
		var goodsId = $("#gId").val();
		var consultMsg = $("#consultMsg").val();
		var a = $.ajax({
			url:'${pageContext.request.getContextPath()}/con/addConsult',
    		type :'post',
    		data:{
    			userId:userId,
    			goodsId:goodsId,
    			consultMsg:consultMsg
    		}, 
    		success:function(data){
    			if(data == 'error'){
    				alert("评论失败！");
    			}else{
    				alert("评论成功！");
    			}
    		}
		});
		
	}
	function updateUser(){
		var params = $('#updateUserForm').serialize();;
		var a = $.ajax({
			url:'${pageContext.request.getContextPath()}/updateUser',
    		type :'post',
    		data:params, 
    		success:function(data){
    			if(data == 'success'){
    				alert("修改成功！");
    				window.location.href="${pageContext.request.getContextPath()}/getUserInfoById?userId="+userId;
    			}else if(data =='warn'){
    				alert("用户名重复！");
    			}else{
    				window.location.href="${pageContext.request.getContextPath()}/login.jsp";
    			}
    		}
		});
		
	}
	//获取用户评价列表  
	function showConsultList(){
		$('.plList').empty();
		var currentPage=$('#currentPage').val();
		$.ajax({
			url:'${pageContext.request.getContextPath()}/con/getConsultByUser',
			async: false,
			type:'get',
			data:{
				userId:userId,
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
					$('#plList').append("<li><div class='plText'><p>"+consultVO.consultMsg+"</p><div class='time'><span>"+consultVO.consultDate+"</span></div></div><div class='goodsType'>"+consultVO.goodsName+"</div></li>");
					if(consultVO.adminName!=null){
						$('#plList').append("<div class='answer'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font class='adminName'>"+consultVO.adminName+"</font>: "+consultVO.replyMsg+"<div class='time'>"+consultVO.replyDate+"</div></div>");
					}
				}
				$('#plList').append("</ul>");
				//循环完之后再加上分页 
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
				}
			}
		});
	}
	
		$(function(){
			$('.myList li').click(function(){
				if(!$(this).hasClass("active")){
	              $('.myList li').removeClass("active");
	              $(this).addClass("active");
	            }
				var aa = $(this).index();
		        $('.myMenu').children('.myItem').hide();
		        $('.myMenu').children('.myItem').eq(aa).show();
		        if(aa == 2){
		        	firstPage();
		        }
			})

			// 信息编辑
			$('.tj').click(function(){
				$('.editBox').show();
				
			});
			$('.sure a').click(function(){
				$('.editBox').hide();
				
			})
			
			// 立即评论
			$('.plNow').click(function(){
				
			});
			$('.sure2 a').click(function(){
				$('.plBox').hide();
				//window.location.href="${pageContext.request.getContextPath()}/getUserInfoById?userId="+userId;
			})
			//错误信息
			var cont=$("#msg").text();
			if(cont != null&&cont != ""){
				$('#errorMsg').text(cont);
				$('.editBox').show();
				$('#errorMsg').show();
			}
		})
		
		
		function toShow(g_id){
			$("#gId").val(g_id)
			$('.plBox').show();
		}
		function checkForm(){
			if($('#pwdR').val() != $('#pwd').val()){
				$('#errorMsg').text("密码两次输入不一致!");
				$('.editBox').show();
				$('#errorMsg').show();
				return false;
			}
		}
			//评论分页功能 
			//首页
			function firstPage(){
				$('#currentPage').val("1");
				showConsultList();
			}
			//上一页
			function lastPage(){
				var current=$('#currentPage').val();
				if(current==1){
					showConsultList();
				}else if(current>1){
					$('#currentPage').val(parseInt(current)-parseInt(1));
					showConsultList();
				}
			}
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