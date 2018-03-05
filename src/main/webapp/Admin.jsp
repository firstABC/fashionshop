<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <script src="js/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="js/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="js/jeditable/jquery.jeditable.js"></script>
	<!-- Data Tables -->
    <script type="text/javascript" src="dataTables/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.responsive.js"></script>
    <script type="text/javascript" src="dataTables/js/dataTables.tableTools.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/pace/pace.min.js"></script>
    
</head>
<body>

	<div class="wrapper">
		<jsp:include page="navAdmin.jsp" flush="true"/>
	</div>

</body>
<script>
var adminName = $('#admin').text();
if(adminName != null&&adminName != ""){
	
}else{
	window.location.href="../fashionshop/loginAdmin.jsp";//需要跳转的地址          
}
</script> 
</html>