<%@ page language="java" import="java.util.HashMap" pageEncoding="UTF-8" %>
<%@include file="./jsp/index_top.jsp"%>
<%@include file="./jsp/navframe.jsp"%>
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
    <%--<jsp:include page="./jsp/index_top.jsp"></jsp:include>--%>
    <%--<jsp:include page="./jsp/navframe.jsp"></jsp:include>--%>
    <%
        HashMap user1 = (HashMap) session.getAttribute("user");
        if (user1 != null) {
            response.sendRedirect("/hospital/jsp/readme.jsp");
        } else {
    %>
</center>
<TABLE  style="margin: 0 auto" border=0 cellSpacing=0 cellPadding=0 width=720 height=282>
<form onsubmit="return ck()" method="get" name="f1" action="./common/login.do">
            <TBODY>
            <TR>
                <TD class=lfont align=middle><B>预约挂号用户登陆</B></TD>
            </TR>
            <TR>
                <TD height=170>
                    <TABLE style="margin: 0 auto" border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff
                           cellPadding=0 width="82%" height=170>

                        <TBODY>
                        <TR>
                            <TD height=168 vAlign=top>
                                <TABLE border=1 cellSpacing=0 cellPadding=0 width="89%"
                                       height=130>
                                    <TBODY>
                                    <TR>
                                        <TD height=40 width="41%" align=right>
                                            <P>登陆名： </P></TD>
                                        <TD height=40 width="59%"><INPUT id=uname class=inputtxt
                                                                         name=uname> <IMG
                                                src="./jsp/files/exp_book_login_files/user_id.gif"
                                                width=15 height=16></TD>
                                    </TR>
                                    <TR>
                                        <TD height=40 width="41%" align=right>密码：</TD>
                                        <TD height=40 width="59%"><INPUT id=upass class=inputtxt
                                                                         type=password name=upass> <IMG
                                                src="./jsp/files/exp_book_login_files/psw.gif" width=15 height=16></TD>
                                    </TR>
                                    <TR align=middle>
                                        <TD height=28 colSpan=2><INPUT class=Btn value=登陆 type=submit name=Submit>
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
            <TR>
                <TD height=109><pre>注意：<BR>
    ◆ 使用网上预约挂号功能必须是<B>我院的诊疗卡用户</B>
    ◆ 如果您的诊疗卡没有开通网上服务功能，请携带诊疗卡及身份有效证件到医院门诊四楼门诊办公室开通网上服务功能。
    ◆ 如果您没有领取南方医院的诊疗卡，请携带有效证件到医院门诊四楼门诊办公室申领，并开通网上服务功能。 
    ◆ 不明之处请电话咨询<B>020-61642320</B>(8：00-12：00；14：30-17：30)或挂号处咨询电话：020-61641888-87104。
    ◆ 诊疗卡办理和开通网上预约时间为每天上午8：00-12：00，下午14：30-17：00（周末和节假日除外）。 
    ◆ 如果您是新用户，请阅读详细的<A href="WEB-INF/jsp/readme.jsp"><U><B>预约须知</B></U></A>。 </pre>
                </TD>
            </TR>
            </TBODY>
        </TABLE>
</FORM>
<script type="text/javascript">
    function ck() {
        if (f1.uname.value == "") {
            alert("请输入用户名！");
            return false;
        }
        if (f1.upass.value == "") {
            alert("请输入密码！");
            return false;
        }
    }

    <%
String no = (String)request.getAttribute("no");
if(no!=null)
{
%>
    alert("用户名或密码错误");
    <%}%>
</script>
<%} %>
<%@ include file="./jsp/index_bottom.jsp" %>
</body>
</html>
