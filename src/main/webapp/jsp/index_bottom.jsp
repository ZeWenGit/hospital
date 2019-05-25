<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String pathButtom = request.getContextPath();
    String basePathButtom = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + pathButtom + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePathButtom%>">

    <title>医院网上预约系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-java.control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <LINK rel=stylesheet type=text/css href="./jsp/files/index_bottom_files/css.css">
    <STYLE type=text/css>TD {
        TEXT-ALIGN: center
    }
    </STYLE>
</head>

<body leftMargin=0 topMargin=0>
<TABLE style="margin: 0 auto" border=0 cellSpacing=0 cellPadding=0 width=750
       background=./jsp/files/index_bottom_files/bottom_logo.gif height=50>
    <TBODY>
    <TR>
        <TD>
            <TABLE cellSpacing=0 cellPadding=0 align=center>
                <TBODY>
                <TR>
                    <TD width=583>(C)2014 协和医院版权所有 地址：广州市广州大道北1838号
                        医院总机：020-61641888<BR>挂号咨询处：020-61641888转87104
                        电子信箱：webmaster@nfyy.com &gt;&gt;&gt;<A
                                href="./jsp/admin/login.jsp"
                                target=_blank>管理</A>
                </TR>
                </TBODY>
            </TABLE>
        </TD>
    </TR>
    </TBODY>
</TABLE>
</body>
</html>