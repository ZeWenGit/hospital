<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-java.control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="./jsp/admin/images/main.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
<div id="left">
		       <div id="left_menu"></div>
			   <div id="left_tree">
			        <div id="tree_icon">
					   <div id="yh"><img src="./jsp/admin/images/user.gif" />用户信息</div>
					   <div id="system"><img src="./jsp/admin/images/system.gif" />系统管理</div>
					</div>
					<div id="tree_text">
				<%HashMap admin = (HashMap)session.getAttribute("admin");  
				if(admin.get("utype").equals("0")){
				%>
						<li class="tree_li">
					     	<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/yyjj.jsp" target="m">医院简介</a>
					     </li>
					     <%--<li class="tree_li">--%>
					     	<%--<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/notice.jsp" target="m">新闻管理</a>--%>
					     <%--</li>--%>
					     <li class="tree_li">
					     	<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/sysuser.jsp" target="m">医生管理</a>
					     </li>
					     <li class="tree_li">
					     	<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/yspb.jsp" target="m">医生排班</a>
					     </li>
					     <li class="tree_li">
					     	<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/ks.jsp" target="m">科室管理</a>
					     </li>
						 <li class="tree_li">
						 	<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/br.jsp" target="m">病人管理</a>
						 </li>
						 <li class="tree_li">
							<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/bryy.jsp" target="m">病人预约</a>
						 </li>
						 <li class="tree_li">
							<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/bryy1.jsp" target="m">历史预约</a>
						 </li>
				<%}else{ %>
						<li class="tree_li">
							<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/yybr.jsp" target="m">预约病人</a>
						 </li>
						 <li class="tree_li">
							<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/wcbr.jsp" target="m">预约完成</a>
						 </li>
						 <li class="tree_li">
							<span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/mypb.jsp" target="m">我的排班</a>
						 </li>
				<%} %>
						 <li class="tree_li">
						 <span class="list_img"><img src="./jsp/admin/images/list_img.gif" /></span><a href="./jsp/admin/grxx.jsp" target="m">个人信息</a>
						 </li>

					</div>

			   </div>
			   					<div id="tree_down"></div>
  </body>
</html>
