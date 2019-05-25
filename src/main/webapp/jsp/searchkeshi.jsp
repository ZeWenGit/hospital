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

</center>
  <center>
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720  >
  <TBODY>
  <TR>
    <TD class=lfont  align=middle><B>科室查询</B></TD></TR>
  <TR>
    <TD >
      <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%" height="375" >
        
        <TBODY>
        <TR>
          <TD vAlign=top >
            <TABLE border=1 cellSpacing=1 cellPadding=1 width="100%" bgcolor="#ffffff"><TBODY>
              <%
              CommonDao dao=new CommonDao();
            String key9 = request.getParameter("key9")==null?"":request.getParameter("key9");;
            String url = "/Demo/searchkeshi.jsp?1=1";
              String sql = "select * from h_type where 1=1 ";
              if(!key9.equals("")){
            	  sql += " and name like '%"+key9+"%' ";
              }
              sql += "order by id desc";
              ArrayList<HashMap> list=(ArrayList<HashMap>)dao.select(sql);
              for(HashMap map:list){%>
              <TR bordercolor="#ffffff">
                <TD align=right >
                <a href="doctor_info.jsp?id=<%=map.get("