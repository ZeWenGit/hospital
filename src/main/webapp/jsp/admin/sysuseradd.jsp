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
  
  <body>
  <form action="./common/doctorAdd.do" method="get" name="f1" onsubmit="return ck()" enctype="multipart/form-data">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">用户名</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><input type="text" id="uname" name="uname" /></span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">密码</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><input type="password" id="upass" name="upass" /></span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">姓名</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><input type="text" id="tname" name="tname" /></span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">性别</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        		<select id="sex" name="sex">
        			<option value="男">男</option>
        			<option value="女">女</option>
        		</select>
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">电话</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><input type="text" id="tel" name="tel" /></span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">科室</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        		<select id="ks" name="ks">
        			<%
        			CommDAO dao = new CommDAO();
        			ArrayList<HashMap> list = (ArrayList)dao.select("select * from h_type where delstatus=0");
        			if(list.size()!=0){
        				for(HashMap m:list){
        			%>
        			<option value="<%=m.get("id") %>"><%=m.get("name") %></option>
        			<%} }%>
        		</select>
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">职称</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        		<select id="zc" name="zc">
        			<option value="初级">初级</option>
        			<option value="中级">中级</option>
        			<option value="高级">高级</option>
        		</select>
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">身份证号</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><input type="text" id="idcard" name="idcard" /></span></div>
        </td>
      </tr>

      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">照片</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><input type="file" id="img" name="img" /></span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">简介</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><textarea rows="4" cols="40" id="remark" name="remark"></textarea> </span></div>
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
<script type="text/javascript">
	function ck(){
		if(f1.uname.value==""){
			alert("用户号不能为空");
			return false;
		}if(f1.upass.value==""){
			alert("密码不能为空");
			return false;
		}if(f1.tname.value==""){
			alert("姓名不能为空");
			return false;
		}if(f1.tel.value==""){
			alert("电话不能为空");
			return false;
		}if(f1.img.value==""){
			alert("照片不能为空");
			return false;
		}if(f1.idcard.value==""){
			alert("身份证不能为空");
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
location.replace("/Demo/admin/sysuser.jsp");
 <%}%>
</script>
</table>
</form>
  </body>
</html>
