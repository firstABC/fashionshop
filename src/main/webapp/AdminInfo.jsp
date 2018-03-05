<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
title>后台管理</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
	<!-- datatable -->
	<!-- <link rel="stylesheet" type="text/css" href="dataTables/css/dataTables.bootstrap.css"> -->
	<link rel="stylesheet" type="text/css" href="dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="dataTables/css/dataTables.tableTools.min.css">
	<link rel="stylesheet" type="text/css" href="dataTables/css/jquery.dataTables.min.css">

    <link rel="stylesheet" type="text/css" href="css/admin.css">

    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- Data Tables -->
    <script type="text/javascript" src="dataTables/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.responsive.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.tableTools.min.js"></script>
    

</head>
<body>

	<div class="wrapper">
		<jsp:include page="navAdmin.jsp" flush="true"/>

		<div class="page-wrapper gray-bg">
			<div class="row border-bottom white-bg dashboard-header">
		        <div class="col-lg-12">
		            <h2>资讯管理</h2>
		            <ol class="breadcrumb">
		                <li><a href="javascript:;">首页</a> </li>
		                <li><a href="javascript:;">潮品之家</a> </li>
		                <li class="active"><strong>资讯管理</strong> </li>
		            </ol>
		        </div>
		    </div>
		    <div class="row wrapper-content white-bg">
		    	<div class="m-b-sm">
	                <div class="m-b-sm-title">
		       			<a href="AdminInfoEdit.html" class="btn btn-primary">发布资讯</a>
	                </div>
		        </div>

		    	<div class="col-lg-12 white-bg">
		    		<table class="table-bordered table-striped table-hover" id="table" width="100%" border="0" cellspacing="0" cellpadding="2">
		    			<thead>
                            <tr>
                                <th>Id</th>
                                <th>资讯标题</th>
                                <th>资讯内容</th>
                                <th>发布者</th>
                                <th>发布时间</th>
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


	<script type="text/javascript">
		$(document).ready(function () {
	        var t = $('#table').DataTable({
	            "processing": true,
        		"ajax": "arrays.txt",
        		
        		"columns": [
		            { "data": "name" },
		            { "data": "position" },
		            { "data": "office" },
		            { "data": "extn" },
		            { "data": "start_date" },
		            { "data": null }
		        ],
		        "columnDefs":[{
		            "targets": 5,
		            "defaultContent": "<a href='AdminInfoEdit.html' id='editrow' class='btn btn-default' style='margin-right:5px;'>编辑</a><a href='#' id='delrow' class='btn btn-default'>删除</a>" 
		        }],

        		//插件的汉化
		        "language": {
                	url: 'dataTables/Chinese.txt'
            	},
	        });

	        /*删除按钮*/
		    $('#table tbody').on( 'click', 'a#delrow', function () {
		        var data = t.row( $(this).parents('tr') ).data();
		        if(confirm("是否确认删除这条信息")){
		            $.ajax({
		                url:'arrays.txt',
		                type:'post',
		                data: {"action":"del", "name": data.name}, 
		                timeout:"3000",
		                cache:"false",

		                success:function(str){
		                    if(str.data){
		                        t.row().remove();//删除这行的数据
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

</body>
</html>