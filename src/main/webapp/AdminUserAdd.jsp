<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑潮品</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="css/admin.css">

    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    
</head>
<body>

	<div class="wrapper">
		<jsp:include page="navAdmin.jsp" flush="true"/>

		<div class="page-wrapper gray-bg">
			<div class="row border-bottom white-bg dashboard-header">
		        <div class="col-lg-12">
		            <h2>潮人编辑</h2>
		            <ol class="breadcrumb">
		                <li><a href="javascript:;">首页</a> </li>
		                <li><a href="javascript:;">潮品之家</a> </li>
		                <li class="active"><strong>潮人编辑</strong> </li>
		            </ol>
		        </div>
		    </div>
		    <div class="row wrapper-content white-bg">
		    	<div class="col-lg-12 white-bg">
		    	<form action="" method="post" id="updateUserForm2">
		    		<table class="tbEdit" width="100%" border="0" cellspacing="0" cellpadding="0">
		    			<tr>
		    				<td width="100">潮人名称</td>
		    				<td><input type="text" name="userName" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮人手机号</td>
		    				<td><input type="tel"  name="userPhone" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮人邮箱</td>
		    				<td><input type="email" name="userEmail" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮人密码</td>
		    				<td><input type="text" name="userPwd" value=""></td>
		    			</tr>
		    			<tr>
		    				<td></td>
				            <td>
				            	
				            		<a href="javascript:addUser()" class="btn btn-primary btnEdit">增加潮人</a> 
				            	
				            </td>
			            </tr>
		    		</table>
		    	</form>
		    	</div>
		    </div>
		</div><!-- 内容 -->

	</div>
	<script type="text/javascript">
	function addUser(){
		var params = $('#updateUserForm2').serialize();;
		var a = $.ajax({
			url:'${pageContext.request.getContextPath()}/addUser',
    		type :'post',
    		data:params, 
    		success:function(data){
    			if(data == 'success'){
    				alert("新增成功！");
    				window.location.href="${pageContext.request.getContextPath()}/AdminUser.jsp";
    			}else if(data =='warn'){
    				alert("用户名重复！");
    			}else{
    				window.location.href="${pageContext.request.getContextPath()}/loginAdmin.jsp";
    			}
    		}
		});
	}
	</script>
</body>
</html>