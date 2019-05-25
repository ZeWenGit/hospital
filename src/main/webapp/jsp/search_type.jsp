<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="com.hosp.dao.CommonDao" %>
<%@include file="./index_top.jsp"%>
<%@include file="./navframe.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>医院网上预约系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-java.control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <LINK rel=stylesheet type=text/css href="files/exp_book_login_files/css.css">

</head>

<body>
<FORM onsubmit="return ck()" method=post name=f1 action="/Demo/tms?ac=reg">
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center height=282>
        <TBODY>
        <TR>
            <TD class=lfont height=33 align=middle><B>科室选择</B></TD>
        </TR>
        <TR>
            <TD height=170 align=middle>
                <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff
                       cellPadding=0 width="82%" align=center height=170>
                    <%
                        CommonDao dao = new CommonDao();
                    %>
                    <TBODY>
                    <TR>
                        <TD height=168 vAlign=top align=middle>
                            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                                <tr>
                                    <td colspan="3" bgcolor="#cccccc"><b>内科</b></td>
                                </tr>
                                <tr>
                                    <%
                                        ArrayList<HashMap> list1 = (ArrayList) dao.select("select * from h_type where type='内科' and delstatus='0' ");
                                        int i1 = 0;
                                        if (list1.size() != 0) {
                                            for (HashMap m1 : list1) {
                                                i1++;
                                    %>
                                    <td>
                                        <a href="./jsp/doctor_info.jsp?id=<%=m1.get("id") %>"><%=m1.get("name") %>
                                        </a>
                                    </td>
                                    <%
                                            if (i1 % 3 == 0) {
                                                out.print("</tr><tr>");
                                            }
                                        }
                                    %><%} %>
                                </tr>

                                <tr>
                                    <td colspan="3" bgcolor="#cccccc"><b>外科</b></td>
                                </tr>
                                <tr>
                                    <%
                                        ArrayList<HashMap> list2 = (ArrayList) dao.select("select * from h_type where type='外科' and delstatus='0'");
                                        int i2 = 0;
                                        if (list2.size() != 0) {
                                            for (HashMap m2 : list2) {
                                                i2++;
                                    %>
                                    <td>
                                        <a href="./jsp/doctor_info.jsp?id=<%=m2.get("id") %>"><%=m2.get("name") %>
                                        </a>
                                    </td>
                                    <%
                                            if (i2 % 3 == 0) {
                                                out.print("</tr><tr>");
                                            }
                                        }
                                    %><%} %>
                                </tr>

                                <tr>
                                    <td colspan="3" bgcolor="#cccccc"><b>外科</b></td>
                                </tr>
                                <tr>
                                    <%
                                        ArrayList<HashMap> list3 = (ArrayList) dao.select("select * from h_type where type='妇产科' and delstatus='0'");
                                        int i3 = 0;
                                        if (list3.size() != 0) {
                                            for (HashMap m3 : list3) {
                                                i3++;
                                    %>
                                    <td>
                                        <a href="./jsp/doctor_info.jsp?id=<%=m3.get("id") %>"><%=m3.get("name") %>
                                        </a>
                                    </td>
                                    <%
                                            if (i3 % 3 == 0) {
                                                out.print("</tr><tr>");
                                            }
                                        }
                                    %><%} %>
                                </tr>

                                <tr>
                                    <td colspan="3" bgcolor="#cccccc"><b>儿科</b></td>
                                </tr>
                                <tr>
                                    <%
                                        ArrayList<HashMap> list4 = (ArrayList) dao.select("select * from h_type where type='儿科' and delstatus='0'");
                                        int i4 = 0;
                                        if (list4.size() != 0) {
                                            for (HashMap m4 : list4) {
                                                i4++;
                                    %>
                                    <td>
                                        <a href="./jsp/doctor_info.jsp?id=<%=m4.get("id") %>"><%=m4.get("name") %>
                                        </a>
                                    </td>
                                    <%
                                            if (i4 % 3 == 0) {
                                                out.print("</tr><tr>");
                                            }
                                        }
                                    %><%} %>
                                </tr>

                                <tr>
                                    <td colspan="3" bgcolor="#cccccc"><b>眼科</b></td>
                                </tr>
                                <tr>
                                    <%
                                        ArrayList<HashMap> list5 = (ArrayList) dao.select("select * from h_type where type='眼科' and delstatus='0'");
                                        int i5 = 0;
                                        if (list5.size() != 0) {
                                            for (HashMap m5 : list5) {
                                                i5++;
                                    %>
                                    <td>
                                        <a href="./jsp/doctor_info.jsp?id=<%=m5.get("id") %>"><%=m5.get("name") %>
                                        </a>
                                    </td>
                                    <%
                                            if (i5 % 3 == 0) {
                                                out.print("</tr><tr>");
                                            }
                                        }
                                    %><%} %>
                                </tr>

                                <tr>
                                    <td colspan="3" bgcolor="#cccccc"><b>口腔科</b></td>
                                </tr>
                                <tr>
                                    <%
                                        ArrayList<HashMap> list6 = (ArrayList) dao.select("select * from h_type where type='口腔科' and delstatus='0'");
                                        int i6 = 0;
                                        if (list6.size() != 0) {
                                            for (HashMap m6 : list6) {
                                                i6++;
                                    %>
                                    <td>
                                        <a href="./jsp/doctor_info.jsp?id=<%=m6.get("id") %>"><%=m6.get("name") %>
                                        </a>
                                    </td>
                                    <%
                                            if (i6 % 3 == 0) {
                                                out.print("</tr><tr>");
                                            }
                                        }
                                    %><%} %>
                                </tr>

                                <tr>
                                    <td colspan="3" bgcolor="#cccccc"><b>耳鼻喉科</b></td>
                                </tr>
                                <tr>
                                    <%
                                        ArrayList<HashMap> list7 = (ArrayList) dao.select("select * from h_type where type='耳鼻喉科' and delstatus='0'");
                                        int i7 = 0;
                                        if (list7.size() != 0) {
                                            for (HashMap m7 : list7) {
                                                i7++;
                                    %>
                                    <td>
                                        <a href="./jsp/doctor_info.jsp?id=<%=m7.get("id") %>"><%=m7.get("name") %>
                                        </a>
                                    </td>
                                    <%
                                            if (i7 % 3 == 0) {
                                                out.print("</tr><tr>");
                                            }
                                        }
                                    %><%} %>
                                </tr>

                                <tr>
                                    <td colspan="3" bgcolor="#cccccc"><b>中医科</b></td>
                                </tr>
                                <tr>
                                    <%
                                        ArrayList<HashMap> list8 = (ArrayList) dao.select("select * from h_type where type='中医科' and delstatus='0'");
                                        int i8 = 0;
                                        if (list8.size() != 0) {
                                            for (HashMap m8 : list8) {
                                                i8++;
                                    %>
                                    <td>
                                        <a href="./jsp/doctor_info.jsp?id=<%=m8.get("id") %>"><%=m8.get("name") %>
                                        </a>
                                    </td>
                                    <%
                                            if (i8 % 3 == 0) {
                                                out.print("</tr><tr>");
                                            }
                                        }
                                    %><%} %>
                                </tr>

                            </TABLE>
                        </TD>
                    </TR>
                    </TBODY>
                </TABLE>
            </TD>
        </TR>
        </TBODY>
    </TABLE>
</FORM>
<%@include file="./index_bottom.jsp"%>
</body>
</html>
