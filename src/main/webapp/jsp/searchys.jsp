<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hosp.dao.CommDAO"%>
<%@page import="com.hosp.util.PageManager"%>
<%@ page import="com.hosp.dao.CommonDao" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>医院网上预约系统</title>
<STYLE>BODY {
	BACKGROUND-IMAGE: url(image/bgp.gif)
}
</STYLE>
 
  </head>
  <script type="text/javascript">
  	 <%String key8 = request.getParameter("key8");
  	String key9 = request.getParameter("key9")==null?"":request.getParameter("key9");;
              if(key8.equals("1")){%>
            	  location.href("searchkeshi.jsp?key9=<%=key9%>");
            <% }%>
  </script>
  <body  class=frame_class leftMargin=0 topMargin=0>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>

</center>
  <center>
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720  >
  <TBODY>

  
               <TR>
    <TD >
      <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%"  >
        
        <TBODY>
        <th colspan="2" align="left" height="3"><font size="2">名医风采</font></th>
        <TR>
          <TD vAlign=top >
          
            <TABLE border=1 cellSpacing=1 cellPadding=1 width="100%" bgcolor="#ffffff"><TBODY>
            <TR bordercolor="#ffffff">
              <%
              CommonDao dao=new CommonDao();
              String sql1 = "select  * from sysuser where utype='医生' ";
              if(!key9.equals("")){
            	  sql1 += " and tname like '%"+key9+"%' ";
              }
              sql1 += " order by id desc ";
              ArrayList<HashMap> list1 = (ArrayList<HashMap>)dao.select(sql1);
              int i=0;
              for(HashMap map1:list1){
            	  HashMap ksm = dao.select("select * from h_type where id="+map1.get("htype")).get(0);
              i++;%>
              
                <TD align=right >
                <a href="doctor_plans.jsp?ysid=<%=map1.get(" text/javascript">
  	
 <%
String no = (String)request.getAttribute("no");
if(no!=null) {
 %>
 alert("用户名或密码错误");
 <%}%>
  </script>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
