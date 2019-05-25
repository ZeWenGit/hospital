<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String pathTop = request.getContextPath();
    String basePathTop = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + pathTop + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePathTop%>">

    <title>医院网上预约系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-java.control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <LINK rel=stylesheet type=text/css href="./jsp/files/index_top_files/css.css">
</head>

<body >
<TABLE style="margin: 0 auto;" border=0 cellSpacing=0 cellPadding=0 width=750
       background=./jsp/files/index_top_files/top_logo.gif height=80>
    <TBODY>
    <TR>
        <TH height=40 scope=row>&nbsp;</TH>
    </TR>
    <TR>
        <TH scope=row>
            <%
                HashMap topUser = (HashMap) session.getAttribute("user");
            %>
            <form action="searchys.jsp?f=f" method="post">
                <TABLE  style="margin: 0 auto" border=0 align=right>
                    <TBODY>
                    <TR>
                        <TD vAlign=center>
                            <select id="key8" name="key8">
                                <option value="1">科室</option>
                                <option value="2">医生</option>
                            </select>
                            <input type="text" id="key9" name="key9" size="5">
                            <input type="submit" value="搜索">
                        </TD>
                        <TD vAlign=center width=51>|<A
                                href="./jsp/welcome.jsp">首页</A></TD>
                        <%--<TD vAlign=center width=71>|&gt;<A--%>
                                <%--href="./jsp/pation_orders.jsp">我的预约</A></TD>--%>
                        <TD vAlign=center width=71>|&gt;<A
                                href="./jsp/yyjj.jsp">医院简介</A></TD>
                        <%if (topUser == null) { %>
                        <TD vAlign=center width=71>|&gt;<A
                                href="./index.jsp">用户登陆</A></TD>
                        <TD vAlign=center width=71>|&gt;<A
                                href="./jsp/reg.jsp">用户注册</A></TD>
                        <%} else { %>
                        <%--<TD vAlign=center width=71>|&gt;<A--%>
                                <%--href="./jsp/searchks.jsp">预约挂号</A></TD>--%>
                        <TD vAlign=center width=71>|&gt;<A
                                href="./jsp/pation_orders.jsp">我的预约</A></TD>
                        <TD vAlign=center width=71>|&gt;<A
                                href="./jsp/patient_info.jsp">个人信息</A></TD>
                        <TD vAlign=center width=51>|&gt;<A
                                href="./common/logoutPatient.do"
                        >注销</A></TD>
                        <%} %>

                    </TR>
                    </TBODY>
                </TABLE>
            </form>

        </TH>
    </TR>
    <tr>
        <table style="margin: 0 auto">
            <tr>
                <td><img src="./jsp/files/process.gif" width="720" height="100"></td>
            </tr>
        </table>
    </tr>

    </TBODY>
</TABLE>
</body>
</html>
