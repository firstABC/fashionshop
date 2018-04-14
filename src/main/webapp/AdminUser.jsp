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
		    	<!-- <div class="m-b-sm">
	                <div class="m-b-sm-title">
		       			<a href="AdminUserEdit.jsp" class="btn btn-primary">新增潮人</a>
	                </div>
		        </div> -->

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
		$(document).ready(function () {
			console.log( $('#table'));
			var t = $('#table').DataTable({
	           processing: true,
	          	ajax: {
	               //指定数据源
	        	   url:'${pageContext.request.getContextPath()}/getAllUser',
	        	   type:'GET',
	        	   dataType:'json',
	           },
			    columns: [
			    	{"data": "userId"},
	            	{"data": "userName"},
	            	{"data": "userPwd"},
	            	{"data": "userEmail"},
	            	{"data": "userPhone"},
	            	{"data": "userDate"},
	            	{"data": null}
	            ], 
	            aLengthMenu:[3,10],
	            "columnDefs":[{
		            "targets": 6,
		            "defaultContent": "<a href='#' id='editrow' class='btn btn-default' style='margin-right:5px;'>编辑</a><a href='#' id='delrow' class='btn btn-default'>删除</a>" 
		        }],

        		//插件的汉化
		        "language": {
                	url: 'dataTables/Chinese.txt'
            	},
	        });
			/*编辑按钮*/
		    $('#table tbody').on( 'click', 'a#editrow', function () {
		        var data = t.row( $(this).parents('tr') ).data();
		            $.ajax({
		                url:'${pageContext.request.getContextPath()}/getUserInfoByIdAdmin',
		                type:'get',
		                data: {"userId": data.userId}, 
		                timeout:"3000",
		                cache:"false",
		                success:function(str){
		                	window.location.href="${pageContext.request.getContextPath()}/AdminUserEdit.jsp";
		                },
		                error:function(err){
		                    // alert(url);
		                    alert("获取数据失败");
		                }
		            });
		        
		    });
	        /*删除按钮*/
		    $('#table tbody').on( 'click', 'a#delrow', function () {
		        var data = t.row( $(this).parents('tr') ).data();
		        if(confirm("是否确认删除这条信息")){
		            $.ajax({
		                url:'${pageContext.request.getContextPath()}/deleteUser',
		                type:'post',
		                data: {"userId": data.userId}, 
		                timeout:"3000",
		                cache:"false",

		                success:function(str){
		                    if(str == 'success'){
		                        t.row().remove();//删除这行的数据
		                        window.location.href="${pageContext.request.getContextPath()}/AdminUser.jsp";
		                    }else{
		                    	alert("删除失败!");
		                    }
		                },
		                error:function(err){
		                    // alert(url);
		                    alert("获取数据失败");
		                }
		            });
		        }
		    });


	    });
	</script>


</html>