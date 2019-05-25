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
  <%CommDAO dao = new CommDAO();
	 String sql = "select * from h_user where 1=1 and delstatus='0'  ";
	 String url = "/Demo/admin/br.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
//	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
	 sql+=" and (uname like'%"+key+"%' or tname like'%"+key+"%' )";
	 url+="&key="+key;
	 }
	 sql+=" order by id desc";
%>
  <body>
  <form action="admin/br.jsp?f=f" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td style="padding-right:10px;"><div align="right">

        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
    <%--<th colspan="8"><span class="STYLE1">按用户名或姓名：<input type="text" id="key" name="key" />&nbsp;&nbsp;&nbsp;--%>
   <%--<input type="submit" value="查询" /></span>--%>
    <%--</th>--%>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">用户名</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">密码</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">姓名</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">性别</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">年龄</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">电话</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">是否黑名单</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
      <%String did = request.getParameter("did");
   if(did!=null)
   {
dao.commOper("update  br set delstatus='1' where id="+did);
   }
   String hid = request.getParameter("hid");
   if(hid!=null)
   {
dao.commOper("update  br set isblack='yes' where id="+hid);
   }
   String bid = request.getParameter("bid");
   if(bid!=null)
   {
dao.commOper("update  br set isblack='no' where id="+bid);
   }
   PageManager pageManager = PageManager.getPage(url,10, request);
   pageManager.doList(sql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
   	for(HashMap mstu:nlist){
	    %>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("uname") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("upass") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("tname") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("sex") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("age") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("tel") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("isblack") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">
        <%if(mstu.get("isblack").equals("no")){ %>
        	<a href="admin/br.jsp?hid=<%=mstu.get("id") %>">置为黑名单</a>
        <%}else{ %>
        	<a href="admin/br.jsp?bid=<%=mstu.get("id") %>">恢复正常</a>
        <%} %>
        <a href="admin/br.jsp?did=<%=mstu.get("id") %>">删除</a>
        
        </span></div></td>
      </tr>
      <%} %>
      <tr>
      	<td height="22" bgcolor="#FFFFFF" colspan="8"><div align="center"><span class="STYLE3">${page.info }</span></div>
      	</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" height="29" nowrap="nowrap">
        
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
  </body>
</html>
