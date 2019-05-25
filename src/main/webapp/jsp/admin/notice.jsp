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
	 String sql = "select * from notice where 1=1  ";
	 String url = "/Demo/admin/notice.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
//	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
	 sql+=" and (title like'%"+key+"%' )";
	 url+="&key="+key;
	 }
	 sql+=" order by id desc";
%>
  <body>
  <form action="admin/notice.jsp?f=f" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td style="padding-right:10px;"><div align="right">
          <table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="admin/images/001.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="admin/noticeadd.jsp">新增</a></div></td>
                  </tr>
              </table></td>
             
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
    <th colspan="3"><span class="STYLE1">按标题：<input type="text" id="key" name="key" />&nbsp;&nbsp;&nbsp;
   <input type="submit" value="查询" /></span>
    </th>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">标题</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">日期</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
      <%String did = request.getParameter("did");
   if(did!=null)
   {
dao.commOper("delete from notice where id="+did);
   }
   PageManager pageManager = PageManager.getPage(url,10, request);
   pageManager.doList(sql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
   	for(HashMap mstu:nlist){
	    %>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("title") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("savetime") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><a href="admin/noticeedit.jsp?id=<%=mstu.get("id") %>">修改</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="admin/notice.jsp?did=<%=mstu.get("id") %>">删除</a></span></div></td>
      </tr>
      <%} %>
      <tr>
      	<td height="22" bgcolor="#FFFFFF" colspan="3"><div align="center"><span class="STYLE3">${page.info }</span></div>
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
