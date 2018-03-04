<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>编辑潮品</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="css/admin.css">

    <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
  	<script src="http://www.jq22.com/jquery/vue.min.js"></script>
    
</head>
<body>

	<div class="wrapper">
		<nav class="navbar-default navbar-static-side">
			<ul class="nav">
				 <li class="nav-header">
                    <div class="people"> 
                    	<span><img alt="image" class="img-circle" src="image/profile_small.jpg" /></span>
                        <a class="dropdown-toggle" href="javascript:;">
                            <span class="clear block name"><strong>柯志慧</strong></span>
                        </a>
                        <a href="loginAdmin.html" class="text-muted text-xs block">退出 <i class="fa fa-sign-out"></i></a>
                    </div>
                </li>
                <li class="active">
                    <a href="AdminProduct.html"><i class="fa fa-th-large"></i> <span class="nav-label">潮品管理</span></a>
                </li>
                <li>
                    <a href="AdminUser.html"><i class="fa fa-user"></i> <span class="nav-label">潮人管理</span></a>
                </li>
                <li>
                    <a href="AdminInfo.html"><i class="fa fa-comments-o"></i> <span class="nav-label">资讯管理</span></a>
                </li>
			</ul>
		</nav><!-- 左侧导航 -->

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
		    		<table class="tbEdit" width="100%" border="0" cellspacing="0" cellpadding="0">
		    			<tr>
		    				<td width="100">潮品名称</td>
		    				<td><input type="text" name="" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">潮品价格</td>
		    				<td><input type="text" name="" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">上架时间</td>
		    				<td><input type="date" name="" value=""></td>
		    			</tr>
		    			<tr>
		    				<td width="100">上传潮图</td>
		    				<td>
		    					<div id="app">
								  <div class="hello">
								    <div class="upload">
								      <div class="upload_warp">
								        <div class="upload_warp_left" @click="fileClick">
								          <img src="image/upload.png">
								        </div>
								      </div>
								      <div class="upload_warp_text">选中{{imgList.length}}张图片</div>
								      <input @change="fileChange($event)" type="file" id="upload_file" multiple style="display: none"/>
								      <div class="upload_warp_img" v-show="imgList.length!=0">
								        <div class="upload_warp_img_div" v-for="(item,index) of imgList">
								          <div class="upload_warp_img_div_top">
								            <div class="upload_warp_img_div_text">
								              {{item.file.name}}
								            </div>
								            <img src="image/del.png" class="upload_warp_img_div_del" @click="fileDel(index)">
								          </div>
								          <img :src="item.file.src">
								        </div>
								      </div>
								    </div>
								  </div>
								</div>
    						</td>
		    			</tr>
		    			<tr>
		    				<td></td>
				            <td style="padding-top: 20px;">
				             	<a href="javascript:;" class="btn btn-primary btnEdit">修改潮品</a> 
				            </td>
			            </tr>
			          </table>
		    	</div>
		    </div>
		</div><!-- 内容 -->

	</div>

	<script>
	  	var app = new Vue({
		    el: '#app',
		    data () {
			    return {
			        imgList: [],
			        size: 0
			    }
		    },
		    methods: {
		        fileClick() {
		            document.getElementById('upload_file').click()
		        },
		        fileChange(el) {
		            if (!el.target.files[0].size) return;
		            this.fileList(el.target);
		            el.target.value = ''
		        },
		          fileList(fileList) {
		              let files = fileList.files;
		              for (let i = 0; i < files.length; i++) {
		                  //判断是否为文件夹
		                  if (files[i].type != '') {
		                      this.fileAdd(files[i]);
		                  } else {
		                      //文件夹处理
		                      this.folders(fileList.items[i]);
		                  }
		              }
		          },
		          fileAdd(file) {
		              //判断是否为图片文件
		              if (file.type.indexOf('image') == -1) {
		                  alert('请上传图片！');
		              } else {
		                  let reader = new FileReader();
		                  reader.vue = this;
		                  reader.readAsDataURL(file);
		                  reader.onload = function () {
		                      file.src = this.result;
		                      this.vue.imgList.push({
		                          file
		                      });
		                  }
		              }
		          },
		          fileDel(index) {
		              this.imgList.splice(index, 1);
		          },
		          dragenter(el) {
		              el.stopPropagation();
		              el.preventDefault();
		          },
		          dragover(el) {
		              el.stopPropagation();
		              el.preventDefault();
		          },
		          	drop(el) {
		              el.stopPropagation();
		              el.preventDefault();
		              this.fileList(el.dataTransfer);
		          }
		      }
		  })
	</script>

</body>
</html>