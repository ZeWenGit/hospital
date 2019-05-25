<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hosp.dao.CommonDao"%>
<%@page import="com.hosp.util.PageManager"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>医院网上预约系统</title>
<STYLE>BODY {
	BACKGROUND-IMAGE: url(image/bgp.gif)
}
</STYLE>
 
  </head>
  
  <body  class=frame_class leftMargin=0 topMargin=0>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>
 <%HashMap user = (HashMap)session.getAttribute("user"); 
%>
</center>
  <%--<FORM onsubmit="return ck()" method=post name="f1" action="/Demo/tms?ac=blogin">--%>
  <center>
   <TABLE border=1 cellSpacing=0 cellPadding=0 width=720 height="375">
  <TBODY>
    <TD class=lfont  align=center><B>我的预约挂号</B></TD></TR>
  <TR>
    <TD valign="top">
      <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%"   >
        
        <TBODY>
        <TR>
          <TD height=168 vAlign=top >
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
              height=130><TBODY>
              <TR bgcolor="#cccccc">
                <TD height=40>科室</TD>
                <TD height=40>医生</TD>
                <TD height=40>职称</TD>
                <TD height=40>就诊日期</TD>
                <TD height=40>状态</TD>
                <TD height=40>操作</TD>
              </TR>
              <%CommonDao dao=new CommonDao();
              String did = request.getParameter("did");
              if(did!=null){
              	dao.commOper("delete from h_p where id="+did);
              }
              String url = "./jsp/pation_orders.jsp?1=1";
              String sql = "select * from h_p where huser='"+user.get("id")+"' order by id desc";
              PageManager pageManager = PageManager.getPage(url,10, request);
   			  pageManager.doList(sql);
   			  PageManager bean= (PageManager)request.getAttribute("page");
  			  ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
              if(nlist.size()!=0){
              	for(HashMap map:nlist){
              		HashMap ysm = dao.select("select * from h_doctor where id="+map.get("hdoctor")).get(0);
              		HashMap ksm = dao.select("select * from h_type where id="+ysm.get("htype")).get(0);
              %>
              <tr>
              	<td><%=ksm.get("name") %></td>
              	<td><%=ysm.get("tname") %></td>
              	<td><%=ysm.get("level") %></td>
              	<td><%=map.get("rq") %></td>
              	<td><%=map.get("status") %></td>
              	<td>
                    <%if(!map.get("status").equals("完成")) {%>
                    <a href="./jsp/pation_orders.jsp?did=<%=map.get("id")%>" >取消预约</a>
                    <%}%>
                </td>
              </tr>
           <%}} %>
           <tr>
           		<td colspan="8">${page.info }</td>
           </tr>
           </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  </TBODY></TABLE>
  </center>
  <%--</FORM>--%>

  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
