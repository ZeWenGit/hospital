<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hosp.dao.CommDAO"%>
<%@page import="com.hosp.util.Info"%>
<%@page import="com.hosp.util.PageManager"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

      <title>预约挂号系统管理平台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-java.control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language=javascript src="/Demo/fckeditor/fckeditor.js"></script>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE3 {color: #707070; font-size: 12px; }
.STYLE5 {color: #0a6e0c; font-size: 12px; }
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE7 {font-size: 12}
-->
</style>
  </head>
  <%CommDAO dao = new CommDAO();

   %>
  <body>
  <form action="/Demo/tms?ac=noticeadd" method="post" name="f1" >
  <input type="hidden" id="id" name="id" />
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
<tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">标题</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><input type="text" id="title" name="title" size="50"/></span></div>
        </td>
      </tr>
       <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">内容</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><textarea id="content" name="content" cols="40" rows="5"></textarea></span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF" colspan="2">
        	<div><span class="STYLE3">
        		<input type="submit" value="提交" />
        		<input type="reset" value="重置" />
        	</span></div>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<script type="text/javascript">
	function window.onload() { 

var of = new FCKeditor("content");
of.BasePath="/Demo/fckeditor/";
of.Height = "285";
of.ToolbarSet="Default";
of.ReplaceTextarea();

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+350; return;}}} 

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
location.replace("/Demo/admin/notice.jsp");
 <%}%>
</script>
  </body>
</html>
