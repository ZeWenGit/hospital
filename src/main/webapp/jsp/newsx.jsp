<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="com.hosp.dao.CommDAO" %>
<%@page import="com.hosp.util.PageManager" %>
<%@ page import="com.hosp.dao.CommonDao" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>医院网上预约系统</title>
    <STYLE>BODY {
        BACKGROUND-IMAGE: url(image/bgp.gif)
    }
    </STYLE>

</head>

<body class=frame_class leftMargin=0 topMargin=0>
<center>
    <jsp:include page="index_top.jsp"></jsp:include>
    <jsp:include page="navframe.jsp"></jsp:include>

</center>
<center>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=720>
        <TBODY>
        <TR>
            <TD class=lfont align=top><B>新闻中心</B></TD>
        </TR>
        <TR>
            <TD>
                <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff
                       cellPadding=0 width="100%" height="375">

                    <TBODY>
                    <TR>
                        <TD vAlign=top>
                            <TABLE border=1 cellSpacing=0 cellPadding=0 width="100%">
                                <TBODY>
                                <%
                                    CommonDao dao = new CommonDao();
                                    String id = request.getParameter("id");
                                    HashMap map = dao.select("select * from notice where id=" + id).get(0);
                                %>
                                <TR>
                                    <TD align=center>
                                        <%=map.get("title") %>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD align=right>
                                        <%=map.get("content") %>
                                    </TD>
                                </TR>


                                </TBODY>
                            </TABLE>
                        </TD>
                    </TR>
                    </TBODY>
                </TABLE>
            </TD>
        </TR>
        </TBODY>
    </TABLE>
</center>

<script type="text/javascript">

    <%
String no = (String)request.getAttribute("no");
if(no!=null)
{
%>
    alert("用户名或密码错误");
    <%}%>
</script>

<center>
    <jsp:include page="index_bottom.jsp"></jsp:include>
</center>
</body>
</html>
