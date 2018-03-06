<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>后台管理</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
	<!-- datatable -->
	<!-- <link rel="stylesheet" type="text/css" href="dataTables/css/dataTables.bootstrap.css"> -->
	<link rel="stylesheet" type="text/css" href="dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="dataTables/css/dataTables.tableTools.min.css">
	<link rel="stylesheet" type="text/css" href="dataTables/css/jquery.dataTables.min.css">

    <link rel="stylesheet" type="text/css" href="css/admin.css">

    <!-- Mainly scripts -->
    <!-- <script src="js/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script> -->
	<!-- Data Tables -->
    <!-- <script type="text/javascript" src="dataTables/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.responsive.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.tableTools.min.js"></script> -->
	
</head>

	<div class="wrapper">
		<jsp:include page="navAdmin.jsp" flush="true"/>

		<div class="page-wrapper gray-bg">
			<div class="row border-bottom white-bg dashboard-header">
		        <div class="col-lg-12">
		            <h2>潮人管理</h2>
		            <ol class="breadcrumb">
		                <li><a href="javascript:;">首页</a> </li>
		                <li><a href="javascript:;">潮品之家</a> </li>
		                <li class="active"><strong>潮人管理</strong> </li>
		            </ol>
		        </div>
		    </div>
		    <div class="row wrapper-content white-bg">
		    	<div class="m-b-sm">
	                <div class="m-b-sm-title">
		       			<a href="AdminUserEdit.jsp" class="btn btn-primary">新增潮人</a>
	                </div>
		        </div>

		    	<div class="col-lg-12 white-bg">
		    		<table  id="table" class="table-bordered table-striped table-hover" width="100%" border="0" cellspacing="0" cellpadding="2">
		    			<thead>
                            <tr>
                                <th>Id</th>
                                <th>潮人姓名</th>
                                <th>潮人邮箱</th>
                                <th>潮人手机号</th>
                                <th>潮人密码</th>
                                <th>注册时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<!-- <tr>
                        		<td>id1</td>
				                <td>张晓红</td>
				                <td>17602150396</td>
				                <td>admin</td>
				                <td>2018/01/06</td>
				                <td><a href="AdminUserEdit.jsp">编辑</a></td>
                        	</tr>
                        	<tr>
                        		<td>id2</td>
				                <td>李云</td>
				                <td>13564566920</td>
				                <td>admin</td>
				                <td>2017/8/19</td>
				                <td><a href="AdminUserEdit.jsp">编辑</a></td>
                        	</tr>
                        	<tr>
                        		<td>id3</td>
				                <td>卢晓</td>
				                <td>17703126930</td>
				                <td>admin</td>
				                <td>2009/01/12</td>
				                <td><a href="AdminUserEdit.jsp">编辑</a></td>
                        	</tr> -->
                        </tbody>
		    		</table>
		    	</div>
		    </div>
		</div><!-- 内容 -->

	</div>

 	<!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- Data Tables -->
    <script type="text/javascript" src="dataTables/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.responsive.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.tableTools.min.js"></script>
	<script type="text/javascript">
	/* $.ajax({
		url:"getAllUser",
		type:"get",
		success:function(data){
			 
			$('#table').DataTable().fnClearTable();   //将数据清除
       　  		$('#table').DataTable().fnAddData(packagingdatatabledata(data),true);   
		}
	}) */
		$(document).ready(function () {
			console.log( $('#table'));
			var t = $('#table').DataTable({
			   serverSide: true,//打开后台分页 
	           processing: true,
	           ajax: {
	               //指定数据源
	        	   url:"getAllUser",
	        	   type:"GET",
	        	   dataSrc: "rows",
	           },
			    columns: [
			    	{"data": "userId"},
	            	{"data": "userName"},
	            	{"data": "userPwd"},
	            	{"data": "userEmail"},
	            	{"data": "userPhone"},
	            	{"data": "userDate"},
	            	{"data": null}
	            	
	            	/* {"data": <a href="AdminUserEdit.jsp">编辑</a>} */
	            ],  
	            aLengthMenu:[3,10],
	          //插件的汉化
		        "language": {
                	url: 'dataTables/Chinese.txt'
            	},
			});
	    });
	</script>


</html>