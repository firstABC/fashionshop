<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>编辑资讯</title>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin.css">

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script type="text/javascript">
	  	function toPublishAdd(){
	    	var option = {
	    		url:'${pageContext.request.getContextPath()}/news/toEdit',
	    		type :"post",
	    		dataType:'json',
	    		headers:{"ClientCallMode" : "ajax"}, 
	    		success : function(data) {
	    			if(data.message == 'faile'){
						alert("修改失败！");
					}else{
						alert("修改成功！");
						window.location.href="${pageContext.request.getContextPath()}/news/toNewsMange";
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
		<nav class="navbar-default navbar-static-side">
			<ul class="nav">
				 <li class="nav-header">
                    <div class="people"> 
                    	<span><img alt="image" class="img-circle" src="${pageContext.request.contextPath}/image/profile_small.jpg" /></span>
                        <a class="dropdown-toggle" href="javascript:;">
                            <span class="clear block name"><strong>柯志慧</strong></span>
                        </a>
                        <a href="loginAdmin.html" class="text-muted text-xs block">退出 <i class="fa fa-sign-out"></i></a>
                    </div>
                </li>
                <li>
                    <a href="AdminProduct.html"><i class="fa fa-th-large"></i> <span class="nav-label">潮品管理</span></a>
                </li>
                <li>
                    <a href="AdminUser.html"><i class="fa fa-user"></i> <span class="nav-label">潮人管理</span></a>
                </li>
                <li class="active">
                    <a href="AdminInfo.html"><i class="fa fa-comments-o"></i> <span class="nav-label">资讯管理</span></a>
                </li>
			</ul>
		</nav><!-- 左侧导航 -->

		<div class="page-wrapper gray-bg">
			<div class="row border-bottom white-bg dashboard-header">
		        <div class="col-lg-12">
		            <h2>资讯编辑</h2>
		            <ol class="breadcrumb">
		                <li><a href="javascript:;">首页</a> </li>
		                <li><a href="javascript:;">潮品之家</a> </li>
		                <li class="active"><strong>资讯编辑</strong> </li>
		            </ol>
		        </div>
		    </div>
		    <div class="row wrapper-content white-bg">
		    	<div class="col-lg-12 white-bg">
		    	 <form action="" method="post" enctype="multipart/form-data" id="publish_form" name="publish_form">
		    		<table class="tbEdit" width="100%" border="0" cellspacing="0" cellpadding="0">
		    			<tr>
		    				<td width="100">标题</td>
		    				<td><input type="text" name="n_title" value="${newsEdit.n_title }"></td>
		    				<td><input type="text" name="n_id" value="${newsEdit.n_id}" hidden="true"></td>
		    			</tr>
		    			<tr>
		    				<td width="100">内容</td>
		    				<td><textarea name="n_detal">${newsEdit.n_detal }</textarea></td>
		    			</tr>
		    			<tr>
		    				<td width="100">作者</td>
		    				<td><input type="text" name="n_author" value="${newsEdit.n_author }" placeholder=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">阅读数</td>
		    				<td><input type="num" name="n_number" value="${newsEdit.n_number }"></td>
		    			</tr>
		    			<tr>
		    				<td></td>
				            <td style="padding-top: 20px;">
				             	<a href="javascript:toPublishAdd();" class="btn btn-primary btnEdit">修改资讯</a> 
				            </td>
			            </tr>
		    		</table>
		    		</form>
		    	</div>
		    </div>
		</div><!-- 内容 -->

	</div>

	<script>
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