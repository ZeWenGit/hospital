<%@ page language="java" import="com.hosp.dao.CommonDao" pageEncoding="UTF-8" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
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
<center>
    <jsp:include page="index_top.jsp"></jsp:include>
    <jsp:include page="navframe.jsp"></jsp:include>
</center>
<%
    CommonDao dao = new CommonDao();
    String ysid = request.getParameter("ysid");
    HashMap user = (HashMap) session.getAttribute("user");
    HashMap map = dao.select("select * from h_doctor where id='" + ysid + "'").get(0);
%>
<FORM onsubmit="return ck()" method=post name=f1 action="/Demo/tms?ac=ghadd">
    <input type="hidden" id="id" name="id" value="<%=map.get("id") %>"/>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center>
        <TBODY>
        <TR>
            <TD class=lfont align=top><B>医生信息</B></TD>
        </TR>
        <TR>
            <TD align=top>
                <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff
                       cellPadding=0 width="100%">


                    <TBODY>
                    <tr>
                        <td>
                            <TABLE border=1 cellSpacing=0 cellPadding=0 width="100%">
                                <TBODY>
                                <tr>
                                    <td>医生姓名</td>
                                    <td><%=map.get("tname") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>性别</td>
                                    <td><%=map.get("sex") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>电话</td>
                                    <td><%=map.get("tel") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>职称</td>
                                    <td><%=map.get("level") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>简介</td>
                                    <td><%=map.get("remark") %>
                                    </td>
                                </tr>


                                </TBODY>
                            </TABLE>
                    <TR>
                        </td>
                    </tr>
                    <TR>
                        <TD vAlign=center align=middle>
                            <TABLE border=1 cellSpacing=0 cellPadding=0 width="100%" height=130>
                                <TBODY>

                                <TR>
                                    <TD height=40 align=right>排班信息：</TD>
                                    <TD height=40>
                                        <table width="100%" border="0">
                                            <tr>
                                                <Td>日期</Td>
                                                <Td>挂号情况</Td>
                                                <Td>操作</Td>
                                            </tr>
                                            <%
                                                List<HashMap> pblist = dao.select("select * from h_d_orders where hdoctor= '" + ysid + "'   ");
                                                for (HashMap pbm : pblist) {
                                            %>
                                            <tr>
                                                <Td><%=pbm.get("rq") %>
                                                </Td>
                                                <Td>
                                                    <%
                                                        ArrayList yylist = (ArrayList) dao.select("select * from h_p where hdoctor='" + ysid + "' and rq='" + pbm.get("rq") + "' ");
                                                        int sys = Integer.parseInt(pbm.get("rs").toString()) - yylist.size();
                                                    %>
                                                    可预约：<%=pbm.get("rs") %>人 （已预约：<%=yylist.size() %>人）
                                                </Td>
                                                <Td>
                                                    <%if (user != null) { %>
                                                    <%if (sys >= 0) { %>
                                                    <a href="./common/registerDoctor.do?doctorId=<%=ysid %>&time=<%=pbm.get("rq") %>">预约挂号</a>
                                                    <%} else { %>
                                                    号已挂完
                                                    <%} %>
                                                    <%} else { %>
                                                    请<a href="../../index.jsp">登陆</a>后预约
                                                    <%} %>
                                                </Td>
                                            </tr>
                                            <%} %>
                                        </table>
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
</FORM>
<script type="text/javascript">

    <%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
%>
    alert("不能重复挂号");
    <%}
   if(suc!=null)
   {
    %>
    alert("挂号成功，请于有效期内前往就诊");

    window.location.href="./jsp/pation_orders.jsp";

    // location.replace("./jsp/doctor_plans.jsp?ysid=" + ysid);
    <%}%>
</script>
<center>
    <jsp:include page="index_bottom.jsp"></jsp:include>
</center>
</body>
</html>
