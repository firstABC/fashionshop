<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>编辑潮品</title>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="css/admin.css">

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
     <script type="text/javascript">
	  	function toPublishAdd(){
	    	var option = {
	    		url:'${pageContext.request.getContextPath()}/goods/toPublish',
	    		type :"post",
	    		dataType:'json',
	    		headers:{"ClientCallMode" : "ajax"}, 
	    		success : function(data) {
	    			if(data.message == 'error'){
						alert("发布失败！");
					}else{
						alert("发布成功！");
						window.location.href="${pageContext.request.getContextPath()}/goods/togoodsMange";
					}
	            },
	            error: function(data) {
	                alert(JSON.stringify(data) + "--上传失败,请刷新后重试");
	            }
	         };
	   	 	$("#publish_form").ajaxSubmit(option);
	   	 	return false;
	  	}
  	</script>
    
</head>
<body>

	<div class="wrapper">
		<jsp:include page="navAdmin.jsp" flush="true"/>

		<div class="page-wrapper gray-bg">
			<div class="row border-bottom white-bg dashboard-header">
		        <div class="col-lg-12">
		            <h2>潮品编辑</h2>
		            <ol class="breadcrumb">
		                <li><a href="javascript:;">首页</a> </li>
		                <li><a href="javascript:;">潮品之家</a> </li>
		                <li class="active"><strong>潮品编辑</strong> </li>
		            </ol>
		        </div>
		    </div>
		    <div class="row wrapper-content white-bg">
		    	<div class="col-lg-12 white-bg">
		    	 <form action="" method="post" enctype="multipart/form-data" id="publish_form" name="publish_form">
		    		<table class="tbEdit" width="100%" border="0" cellspacing="0" cellpadding="0">
		    			<tr>
		    				<td width="100">潮品名称</td>
		    				<td><input type="text" name="g_title" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮品详情</td>
		    				<td><textarea name="g_detail"></textarea></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮品价格</td>
		    				<td><input type="num" name="g_price" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮品品牌</td>
		    				<td><input type="text" name="g_brand" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮品数量</td>
		    				<td>
		    					<div class="numEdit"><span class="numReduce">-</span><input class="numDetail" name="g_inventory" type="text" value="3" readonly="readonly"><span class="numAdd">+</span></div>
		    				</td>
		    			</tr>
		    			<tr>
		    				<td width="100">喜欢数</td>
		    				<td>
		    					<div class="numEdit"><span class="numReduce">-</span><input class="numDetail" name="g_like" type="text" value="18" readonly="readonly"><span class="numAdd">+</span></div>
		    				</td>
		    			</tr>
		    			<tr>
		    				<td width="100">状态</td>
		    				<td>
		    					<select name="g_status">
		    						<option value="A">已上架</option>
		    						<option value="B">已下架</option>
		    						<option value="C">新品预定</option>
		    					</select>
		    				</td>
		    			</tr>
		    			<tr>
		    				<td width="100">性别</td>
		    				<td>
		    					<select  name="g_sex">
		    						<option value="0">男士</option>
		    						<option value="1">女士</option>
		    					</select>
		    				</td>
		    			</tr>
		    			<tr>
		    				<td width="100">所属分类</td>
		    				<td>
		    					<select  name="g_type">
		    						<option value="A">服装</option>
		    						<option value="B">鞋类</option>
		    					</select>
		    				</td>
		    			</tr>
		    			<tr>
		    				<td width="100">上传图片</td>
		    				<td>
		    					<p class="uploadTs">最多可上传4张图片</p>
		    					<div class="images">
			    					<div class="img">
							             <div class="addhao">
							                 <input type="file" name="file" class="fileinput">
							             </div>
							             <div class="on">
							                <div class="xian"></div>
							                 <div class="chahao"></div>
							             </div>
							         </div>
							         <div class="img">
							             <div class="addhao">
							                 <input type="file" name="file" class="fileinput">
							             </div>
							             <div class="on">
							                <div class="xian"></div>
							                 <div class="chahao"></div>
							             </div>
							         </div>
							         <div class="img">
							             <div class="addhao">
							                 <input type="file" name="file" class="fileinput">
							             </div>
							             <div class="on">
							                <div class="xian"></div>
							                 <div class="chahao"></div>
							             </div>
							         </div>
							         <div class="img">
							             <div class="addhao">
							                 <input type="file" name="file" class="fileinput">
							             </div>
							             <div class="on">
							                <div class="xian"></div>
							                 <div class="chahao"></div>
							             </div>
							         </div>
							    </div>
    						</td>
		    			</tr>
		    			<tr>
		    				<td></td>
				            <td style="padding-top: 20px;">
				             	<a href="javascript:toPublishAdd();" class="btn btn-primary btnEdit">发布潮品</a> 
				            </td>
			            </tr>
			        </table>
			        </form>
		    	</div>
		    </div>
		</div><!-- 内容 -->

	</div>

	<script>
		// 数量加减
		$(function() {
			$(".numAdd").click(function() {
				var t = $(this).parent().find('input[class*=numDetail]');
				t.val(parseInt(t.val()) + 1);
			})
			$(".numReduce").click(function() {
				var t = $(this).parent().find('input[class*=numDetail]');
				t.val(parseInt(t.val()) - 1)
				if(parseInt(t.val()) < 1) {
					t.val(1);
				}
			})
		})

		// 上传照片  删除照片
		 $(" .fileinput").change(function () {
		      var file = this.files[0];
		      readFile(file,$(this).parent().siblings(".on"));
		 });
		 $(".on").mouseover(function () {
		      $(this).children(".xian").show();
		      $(this).children(".chahao").show();
		 
		 });
		 $(".on").mouseleave(function () {
		      $(this).children(".xian").hide();
		      $(this).children(".chahao").hide();
		 });
		 $(".chahao").click(function () {
		      $(this).next().remove();
		      $(".xian").hide();
		      $(".chahao").hide();
		      $(this).parent().hide();
		      $(this).parent().siblings(".addhao").show();
		      $(this).parent().siblings(".addhao").children().val("");
		 
		 });
		 var on =document.querySelector(".on");
		 //    需要把阅读的文件传进来file element是把读取到的内容放入的容器
		 function readFile(file,element) {
		 //        新建阅读器
		 var reader = new FileReader();
		 //        根据文件类型选择阅读方式
		 switch (file.type){
		 case 'image/jpg':
		 case 'image/png':
		 case 'image/jpeg':
		 case 'image/gif':
		 reader.readAsDataURL(file);
		 break;
		 }
		 //        当文件阅读结束后执行的方法
		 reader.addEventListener('load',function () {
		 //         如果说让读取的文件显示的话 还是需要通过文件的类型创建不同的标签
		 switch (file.type){
		     case 'image/jpg':
		     case 'image/png':
		     case 'image/jpeg':
		     case 'image/gif':
		     var img = document.createElement('img');
		     img.src = reader.result;
		     element.append(img);
		     element.siblings(".addhao").hide();
		     element.show();
		     break;
		    }
		   });
		 }

	</script>

</body>
</html>