<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="./index_top.jsp"%>
<%@include file="./navframe.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
  <form onsubmit="return ck()" method="get" name=f1 action="./common/register.do">
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center height=282>
  <TBODY>
  <TR>
    <TD class=lfont  align=top><B>用户注册</B></TD></TR>
  <TR>
    <TD height=170 align=middle>
      <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff
      cellPadding=0 width="100%" align=center height=170>

        <TBODY>
        <TR>
          <TD height=168 vAlign=top align=middle>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%"
              height=130><TBODY>
              <TR>
                <TD height=40 width="41%" align=right>
                  <P>登陆名： </P></TD>
                <TD height=40 width="59%"><INPUT id=uname class=inputtxt
                  name=uname> <IMG src="./jsp/files/exp_book_login_files/user_id.gif"
                  width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>密码： </TD>
                <TD height=40 width="59%"><INPUT id=upass class=inputtxt
                  type=password name=upass> <IMG
                        src="./jsp/files/exp_book_login_files/psw.gif" width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>再次输入密码： </TD>
                <TD height=40 width="59%"><INPUT id=upass1 class=inputtxt
                  type=password name=upass1> <IMG
                        src="./jsp/files/exp_book_login_files/psw.gif" width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>姓名： </TD>
                <TD height=40 width="59%"><INPUT id=tname class=inputtxt
                  type=text name=tname>&nbsp&nbsp&nbsp&nbsp&nbsp</TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>性别： </TD>
                <TD height=40 width="59%" align=left>
                	<select id="sex" name="sex">
        			<option value="男">男</option>
        			<option value="女">女</option>
        		</select>
                </TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>年龄： </TD>
                <TD height=40 width="59%"><INPUT id=age class=inputtxt
                  type=text name=age>&nbsp&nbsp&nbsp&nbsp&nbsp</TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>电话： </TD>
                <TD height=40 width="59%"><INPUT id=tel class=inputtxt
                  type=text name=tel>&nbsp&nbsp&nbsp&nbsp&nbsp</TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>身份证： </TD>
                <TD height=40 width="59%"><INPUT id=idcard class=inputtxt
                  type=text name=idcard>&nbsp&nbsp&nbsp&nbsp&nbsp</TD>
              </TR>
              <TR align=middle>
                <TD height=28 colSpan=2><INPUT class=Btn value=注册 type=submit name=Submit>
                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
  </form>
  <script type="text/javascript">
  	function ck(){
  		if (f1.uname.value==""){
			alert("请输入用户名！");
			return false;
		}
		if (f1.upass.value==""){
			alert("请输入密码！");
			return false;
		}if (f1.upass1.value==""){
			alert("请输入再次输入密码！");
			return false;
		}if (f1.upass1.value!=f1.upass1.value){
			alert("两次密码不一致！");
			return false;
		}if (f1.tname.value==""){
			alert("请输入姓名！");
			return false;
		}if (f1.age.value==""){
			alert("请输入年龄！");
			return false;
		}if (f1.tel.value==""){
			alert("请输入电话！");
			return false;
		}if (f1.idcard.value==""){
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
 alert("已存在的用户名");
 <%}
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/Demo/index.jsp");
 <%}%>
  </script>
  <%@include file="./index_bottom.jsp"%>
  </body>
</html>
