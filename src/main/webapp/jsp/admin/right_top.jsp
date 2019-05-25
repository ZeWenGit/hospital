<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'right_top.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-java.control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link href="./jsp/admin/images/main.css" rel="stylesheet" type="text/css"/>
</head>
<%HashMap admin = (HashMap) session.getAttribute("admin"); %>
<body>
<div id="right_top">
    <div id="img"><img src="./jsp/admin/images/close.gif"/></div>
    <span class="imgtext"></span>
    <div id="loginout">
        <div id="loginoutimg"><img src="./jsp/admin/images/loginout.gif"/></div>
        <span class="logintext"><a href="./common/adminLogout.do" target="_top">退出系统</a></span>
    </div>
</div>
<div id="right_font"><img src="./jsp/admin/images/main_14.gif"/> 用户   <%=admin.get("tname") %>   欢迎您！</div>
</body>
</html>
