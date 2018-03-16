<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="chen.mingyu.domain.Goods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jeditable/jquery.jeditable.js"></script>
	<!-- Data Tables -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.responsive.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.tableTools.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="${pageContext.request.contextPath}/js/inspinia.js"></script>
    <script src="${pageContext.request.contextPath}/js/pace/pace.min.js"></script>

    
</head>
<body>

	<div class="wrapper">
		<jsp:include page="navAdmin.jsp" flush="true"/>

		<div class="page-wrapper gray-bg">
			<div class="row border-bottom white-bg dashboard-header">
		        <div class="col-lg-12">
		            <h2>潮品管理</h2>
		            <ol class="breadcrumb">
		                <li><a href="javascript:;">首页</a> </li>
		                <li><a href="javascript:;">潮品之家</a> </li>
		                <li class="active"><strong>潮品管理</strong> </li>
		            </ol>
		        </div>
		    </div>
		    <div class="row wrapper-content white-bg">
		    	<div class="m-b-sm">
	                <div class="m-b-sm-title">
		       			<a href="AdminProductEdit.jsp" class="btn btn-primary">发布潮品</a>
	                </div>
		        </div>

		    	<div class="col-lg-12 white-bg">
		    		<table class="table-bordered table-striped table-hover" id="table" width="100%" border="0" cellspacing="0" cellpadding="2">
		    			<thead>
                            <tr>
                                <th>Id</th>
                                <th>产品名称</th>
                                <th>价格</th>
                                <th>喜欢数</th>
                                <th>预购数量</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        List<Goods> ltgoodsM = (List<Goods>)request.getSession().getAttribute("ltGoodsMange");
                        if(ltgoodsM!=null&&ltgoodsM.size()>0){
                        	for(Goods goods : ltgoodsM){
                        %>
                        	<tr>
                        		<td><%=goods.getG_id() %></td>
				                <td><%=goods.getG_title() %></td>
				                <td><%=goods.getG_price() %></td>
				                <td><%=goods.getG_like() %></td>
				                <td>预购数量</td>
				                <td><a href="AdminProduct.jsp">编辑</a></td>
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