<%@ page language="java" import="com.hosp.dao.CommonDao" pageEncoding="UTF-8" %>
<%@page import="com.hosp.util.PageManager" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

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
            <TD class=lfont align=middle><B>新闻中心</B></TD>
        </TR>
        <TR>
            <TD>
                <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff
                       cellPadding=0 width="100%" height="375">

                    <TBODY>
                    <TR>
                        <TD vAlign=top>
                            <TABLE border=1 cellSpacing=1 cellPadding=1 width="100%" bgcolor="#ffffff">
                                <TBODY>
                                    <%CommonDao dao=new CommonDao();
                                    String url = "./jsp/newscenter.jsp?1=1";
              String sql = "select * from notice order by savetime desc";
              PageManager pageManager = PageManager.getPage(url,10, request);
              pageManager.doList(sql);
              PageManager bean= (PageManager)request.getAttribute("page");
              ArrayList<HashMap> list=(ArrayList)bean.getCollection();
              for(HashMap map:list){%>
                                <TR bordercolor="#ffffff">
                                    <TD align=right>
                                        <a href="./newsx.jsp?id=<%=map.get("用户名或密码错误")
 <%}%>
  </script>
<%@ include file="./index_bottom.jsp" %>
  </body>
</html>
