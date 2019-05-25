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
  HashMap admin = (HashMap)session.getAttribute("admin"); 
	 String sql = "select * from h_d_orders where 1=1 and hdoctor='"+admin.get("id")+"'  ";
	 String url = "./jsp/admin/mypb.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
//	 key = Info.getUTFStr(key);
	 }
	 if(!key1.equals(""))
	 {
		 sql+=" and (rq >='"+key1+"' )";
		 url+="&key1="+key1;
		 }if(!key2.equals(""))
		 {
			 sql+=" and (rq <'"+key2+"' )";
			 url+="&key2="+key2;
			 }
	 sql+=" order by rq desc";
%>
  <body>
  <form action="./jsp/admin/mypb.jsp?f=f" method="post">
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
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"></div></td>
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
    <%--<th colspan="2"><span class="STYLE1">--%>
    <%--起止时间：<input type="text" id="key1" name="key1" value="<%=key1 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>---%>
                 <%--<input type="text" id="key2" name="key2" value="<%=key2 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>--%>
   <%--<input type="submit" value="查询" /></span>--%>
   <%--<script type="text/javascript" src="./hospital/jsp/js/calendar/WdatePicker.js"></script>--%>
    <%--</th>--%>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">日期</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">接诊数</span></strong></div></td>
      </tr>
      <%String did = request.getParameter("did");
   if(did!=null)
   {
dao.commOper("delete from h_d_orders where id="+did);
   }
   PageManager pageManager = PageManager.getPage(url,10, request);
   pageManager.doList(sql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
   	for(HashMap mstu:nlist){
   		HashMap ym=dao.select("select * from h_doctor where id="+mstu.get("hdoctor")).get(0);
   		HashMap km=dao.select("select * from h_type where id="+ym.get("htype")).get(0);
	    %>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("rq") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("rs") %></span></div></td>
      </tr>
      <%} %>
      <tr>
      	<td height="22" bgcolor="#FFFFFF" colspan="2"><div align="center"><span class="STYLE3">${page.info }</span></div>
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
