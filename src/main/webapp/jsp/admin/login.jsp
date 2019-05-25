<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="javafx.scene.control.Alert" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>预约挂号系统管理平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-java.control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="admin/images/login.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  <center>
  	<form action="./common/adminlogin.do" method="get" name="f1" onsubmit="return ck()">
    <div id="login">
	     <div id="top">
		      <div id="top_left"><img src="./jsp/admin/images/login_03.gif" /></div>
			  <div id="top_center"></div>
		 </div>
		 <div id="center">
		      <div id="center_left"></div>
			  <div id="center_middle">
			       <div id="user">用 户
			         <input type="text" name="uname" id="uname"/>
			       </div>
				   <div id="password">密   码
				     <input type="password" name="upass" id="upass"/>
				   </div>
				   <div><input type="submit" value="登陆" size="5"/><input type="reset" value="重置" /></div>
			  <!-- <a href="javascript:sub()">登录</a><a href="#">清空</a> -->
			  </div>
			  <div id="center_right"></div>		 
		 </div>
		 
		 <div id="down">
		      <div id="down_left">
			      <div id="inf">
                       <span class="inf_text">版本信息</span>
					   <span class="copyright">管理信息系统 2012 v1.0</span>
			      </div>
			  </div>
			  <div id="down_center"></div>		 
		 </div>
	</div>
	</form>
	</center>
  </body>

  <script type="text/javascript">
  	function ck(){
  		if(f1.uname.value==""){
  			alert("用户名不能为空");
  			return false;
  		}if(f1.upass.value==""){
  			alert("密码不能为空");
  			return false;
  		}
  	}

    <%
if(request.getParameter("no")!=null){
%>
	  alert("用户名或密码错误！");
	  <%}%>
  </script>
</html>
