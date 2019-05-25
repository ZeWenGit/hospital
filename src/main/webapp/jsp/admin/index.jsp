<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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

</head>

<frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="./jsp/admin/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame"/>
    <frameset rows="*" cols="188,*" framespacing="0" frameborder="no" border="0">
        <frame src="./jsp/admin/left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame"/>
        <frameset rows="73,*" cols="*">
            <frame src="./jsp/admin/right_top.jsp" name="mainFrame" id="mainFrame"/>
            <%
                HashMap admin = (HashMap) session.getAttribute("admin");
                if (admin.get("utype").equals("管理员")) {
            %>
            <frame src="./jsp/admin/sysuser.jsp" name="m"/>
            <%} else { %>
            <frame src="./jsp/admin/yybr.jsp" name="m"/>
            <%} %>
        </frameset>
    </frameset>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>
