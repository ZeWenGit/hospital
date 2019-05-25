<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="com.hosp.dao.CommonDao" %>
<%@page import="com.hosp.util.PageManager" %>

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
            <TD>
                <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff
                       cellPadding=0 width="100%">

                    <TBODY>
                    <%--<th colspan="2" align="left" height="3"><font size="2">站内新闻</font></th>--%>
                    <%--<tr>--%>
                        <%--<td vAlign=top>--%>
                            <%--<table border=1 cellSpacing=1 cellPadding=1 width="100%" bgcolor="#ffffff">--%>
                                <%--<tbody>--%>
                                <%--<%--%>
                                    <%--CommonDao dao = new CommonDao();--%>
                                    <%--String url = "./jsp/newscenter.jsp?1=1";--%>
                                    <%--String sql = "select top 5 * from notice order by savetime desc ";--%>

                                    <%--ArrayList<HashMap> list = (ArrayList<HashMap>) dao.select(sql);--%>
                                    <%--for (HashMap map : list) {--%>
                                <%--%>--%>
                                <%--<tr bordercolor="#ffffff">--%>
                                    <%--<tg align=right>--%>
                                        <%--<a href="./newsx.jsp?id=<%=map.get("id") %>"><%=map.get("title") %>--%>
                                        <%--</a>--%>
                                    <%--</tg>--%>
                                    <%--<td>--%>
                                        <%--<%=map.get("savetime") %>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<%} %>--%>


                                <%--</tbody>--%>
                            <%--</table>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <TR>
                        <TD>
                            <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff
                                   cellPadding=0 width="100%">

                                <TBODY>
                                <th colspan="2" align="left" height="3"><font size="2">名医风采</font></th>
                                <TR>
                                    <TD vAlign=top>

                                        <TABLE border=1 cellSpacing=1 cellPadding=1 width="100%" bgcolor="#ffffff">
                                            <TBODY>
                                            <TR bordercolor="#ffffff">
                                                <%
                                                    CommonDao dao = new CommonDao();
                                                    String sql1 = "select * from h_doctor where utype='1' order by id desc limit 5 ";
                                                    ArrayList<HashMap> list1 = (ArrayList<HashMap>) dao.select(sql1);
                                                    for (HashMap map1 : list1) {%>

                                                <TD align=right>
                                                    <a href="yspb.jsp?ysid=<%=map1.get("id") %>"><img border="0"
                                                                                                      src="/hospital/jsp/upfile/<%=map1.get("img") %>"
                                                                                                      width="80"
                                                                                                      height="80"/><br/><%=map1.get("tname") %>
                                                    </a>
                                                </TD>
                                                <%} %>
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
