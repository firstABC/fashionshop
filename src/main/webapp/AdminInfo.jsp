<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="chen.mingyu.domain.News"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>后台管理</title>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet">
	<!-- datatable -->
	<!-- <link rel="stylesheet" type="text/css" href="dataTables/css/dataTables.bootstrap.css"> -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dataTables/css/dataTables.tableTools.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dataTables/css/jquery.dataTables.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin.css">

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    
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
                               <tr>
                                <th>Id</th>
                                <th>资讯标题</th>
                                <th>发布者</th>
                                <th>发布时间</th>
                                <th>阅读数</th>
                                <th>操作</th>
                            </tr>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            List<News> ltNews =  (List<News>)request.getSession().getAttribute("ltNews");
                            if(ltNews!=null&&ltNews.size()>0){
                            	for(News news : ltNews){
                           	%>	
                             <tr>
                                <td><%=news.getN_id() %></td>
                                <td><%=news.getN_title() %></td>
                                <td><%=news.getN_author() %></td>
                                <td><%=news.getN_dateTime() %></td>
                                <td><%=news.getN_number() %></td>
                                <td><a href="${pageContext.request.contextPath}/news/forEdit?n_id=<%=news.getN_id() %>">编辑</a></td>
                            </tr>
                            <%
                            	}
                            }
                            %>	
                        </tbody>
		    		</table>
		    	</div>
		    </div>
		</div><!-- 内容 -->

	</div>


	<!-- Data Tables -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.responsive.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.tableTools.min.js"></script>
    
	<script type="text/javascript">
		$(document).ready(function () {
	        var t = $('#table').DataTable({
	            "processing": true,
        		// "ajax": "dataTables/info.txt",

        		//插件的汉化
		        "oLanguage": {
		            "sLengthMenu": "每页显示 _MENU_ 条记录",
		            "sZeroRecords": "抱歉， 没有找到",
		            "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
		            "sInfoEmpty": "没有数据",
		            "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
		            "oPaginate": {
		                "sFirst": false,
		                "sPrevious": false,
		                "sNext": false,
		                "sLast": false
		            },
		            "sZeroRecords": "没有检索到数据",
		            "sProcessing": "<img src='' />",
		            "sSearch": "搜索"
		        },
	        });

	    });
	</script>

</body>
</html>