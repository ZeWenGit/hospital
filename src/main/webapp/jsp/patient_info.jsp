<%@ page language="java" import="com.hosp.dao.CommonDao" pageEncoding="UTF-8" %>
<%@page import="com.hosp.util.Info" %>
<%@page import="java.util.HashMap" %>
<%@include file="./index_top.jsp"%>
<%@include file="./navframe.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN">
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
<%
    HashMap user = (HashMap) session.getAttribute("user");
    CommonDao dao = new CommonDao();
    HashMap map = dao.select("select * from h_user where id=" + user.get("id")).get(0);
%>
<form onsubmit="return ck()" method="get" name="f1" action="./common/updatePatient.do">
    <table border=0 cellSpacing=0 cellPadding=0 width=720 align=center height="375">
        <tbody>
        <tr>
            <td class=lfont align=center><B>个人信息</B></td>
        </tr>
        <tr>
            <td valign=top>
                <table border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff
                       cellPadding=0 width="82%" align=center>

                    <tbody>
                    <tr>
                        <td vAlign=top align=middle>
                            <table border=0 cellSpacing=0 cellPadding=0 width="89%">
                                <tbody>
                                <tr>
                                    <td height=40 width="41%" align=right>
                                        <P>登陆名： </P></td>
                                    <td height=40 width="59%"><input id=uname class=inputtxt
                                                                     name=uname readonly==true
                                                                     value="<%=map.get("uname")%>"> <IMG
                                            src="./jsp/files/exp_book_login_files/user_id.gif"
                                            width=15 height=16></td>
                                </tr>
                                <tr>
                                    <td height=40 width="41%" align=right>旧密码：</td>
                                    <td height=40 width="59%"><input id="oldupass" class="inputtxt" type="password"
                                                                     name="oldupass"> <IMG
                                            src="./jsp/files/exp_book_login_files/psw.gif" width=15 height=16></td>
                                </tr>
                                <tr>
                                    <td height=40 width="41%" align=right>新密码：</td>
                                    <td height=40 width="59%"><input id="upass1" class="inputtxt" type="password"
                                                                     name="upass1"> <img
                                            src="./jsp/files/exp_book_login_files/psw.gif" width=15 height=16></td>
                                </tr>
                                <tr>
                                    <td height=40 width="41%" align=right>姓 名：</td>
                                    <td height=40 width="59%"><input id="tname" class="inputtxt" type="text"
                                                                     name="tname">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                                </tr>
                                <tr>
                                    <td height=40 width="41%" align=right>性别：</td>
                                    <td height=40 width="59%" align=left>
                                        <select id="sex" name="sex">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td height=40 width="41%" align=right>年龄：</td>
                                    <td height=40 width="59%"><input id="age" class="inputtxt" type="text" name="age">
                                        &nbsp&nbsp&nbsp&nbsp&nbsp</td>
                                </tr>
                                <tr>
                                    <td height=40 width="41%" align=right>电话：</td>
                                    <td height=40 width="59%"><input id="tel" class="inputtxt" type="text" name="tel">
                                        &nbsp&nbsp&nbsp&nbsp&nbsp</td>
                                </tr>
                                <tr>
                                    <td height=40 width="41%" align=right>身份证：</td>
                                    <td height=40 width="59%">
                                        <input id="idcard" class="inputtxt" type="text" name="idcard">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                                </tr>
                                <tr align="middle">
                                    <td height="28" colSpan="2"><input class="28" value="提交" type="submit"
                                                                       name="submit">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<script type="text/javascript">
    function ck() {
        if (f1.uname.value == "") {
            alert("请输入用户名！");
            return false;
        }
        if (f1.oldupass.value == "") {
            alert("请输入旧密码！");
            return false;
        }
        if (f1.upass1.value == "") {
            alert("请输入新密码！");
            return false;
        }
        if (f1.tname.value == "") {
            alert("请输入姓名！");
            return false;
        }
        if (f1.age.value == "") {
            alert("请输入年龄！");
            return false;
        }
        if (f1.tel.value == "") {
            alert("请输入电话！");
            return false;
        }
        if (f1.idcard.value == "") {
            alert("请输入身份证！");
            return false;
        }
    }

    <%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
%>
    alert("旧密码错误");
    <%}
   if(suc!=null)
   {
    %>
    alert("操作成功");
    location.replace("./jsp/patient_info.jsp");
    <%}%>
</script>
<%--<center>--%>
    <%--<jsp:include page="index_bottom.jsp"></jsp:include>--%>
<%--</center>--%>
<%@include file="./index_bottom.jsp"%>
</body>
</html>
<%--<%=Info.tform(map)%>--%>