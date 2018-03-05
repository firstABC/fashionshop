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
		    		<table class="tbEdit" width="100%" border="0" cellspacing="0" cellpadding="0">
		    			<tr>
		    				<td width="100">潮人名称</td>
		    				<td><input type="text" name="" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮人手机号</td>
		    				<td><input type="number" name="" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮人密码</td>
		    				<td><input type="text" name="" value=""></td>
		    			</tr>
		    			<tr>
		    				<td></td>
				            <td>
				             	<a href="javascript:;" class="btn btn-primary btnEdit">修改潮人</a> 
				            </td>
			            </tr>
		    		</table>
		    	</div>
		    </div>
		</div><!-- 内容 -->

	</div>

</body>
</html>