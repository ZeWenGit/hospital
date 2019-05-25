package com.hosp.controller;

import com.hosp.dao.CommDAO;
import com.hosp.util.Info;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MainCtrl extends HttpServlet {

	public MainCtrl() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	this.doPost(request, response);
	}

		public void go(String url,HttpServletRequest request, HttpServletResponse response)
		{
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
		
		public void gor(String url,HttpServletRequest request, HttpServletResponse response)
		{
			try {
				response.sendRedirect(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		HashMap admin = (HashMap)session.getAttribute("admin");
		HashMap user = (HashMap)session.getAttribute("user");
		String ac = request.getParameter("ac");
		if(ac==null)ac="";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0,10);
		String tomonth = date.substring(0,7);
		
		//登录
		if(ac.equals("login"))
		{
			    String uname = request.getParameter("uname");
			    String upass = request.getParameter("upass");
			    	String sql = "select * from h_doctor  where uname='"+uname+"' and upass='"+upass+"' and delstatus='0' ";
			    
			    	List<HashMap> list = dao.select(sql);
			    	if(list.size()==1)
			    	{
			    	session.setAttribute("admin", list.get(0));
			    	request.setAttribute("suc", "");
			    	go("/admin/index.jsp", request, response);
			    	}else{
			    		request.setAttribute("no", "");
				    	go("/admin/login.jsp", request, response);
			    	}
		}
		//后台注销 
		if(ac.equals("exit"))
		{
			session.removeAttribute("admin");
		    	go("/admin/login.jsp", request, response);
		}
		//病人用户登录
		if(ac.equals("blogin"))
		{
			    String uname = request.getParameter("uname");
			    String upass = request.getParameter("upass");
			    	String sql = "select * from h_user where uname='"+uname+"' and upass='"+upass+"' and isblack='no' and delstatus='0'  ";
			    
			    	List<HashMap> list = dao.select(sql);
			    	if(list.size()==1)
			    	{
			    	session.setAttribute("user", list.get(0));
			    	request.setAttribute("suc", "");
			    	go("/readme.jsp", request, response);
			    	}else{
			    		request.setAttribute("no", "");
				    	go("/index.jsp", request, response);
			    	}
		}
		//医生修改个人信息
		if(ac.equals("grxx"))
		{
			    String id = request.getParameter("id");  
			    String tname = request.getParameter("tname");
			    String upass = request.getParameter("upass");
			    String sex = request.getParameter("sex");
			    String tel = request.getParameter("tel");
			    String sql = "update sysuser set tname='"+tname+"',upass='"+upass+"',sex='"+sex+"',tel='"+tel+"' where id='"+id+"' ";
			    	dao.commOper(sql);
			    	request.setAttribute("suc", "");
			    	go("/admin/grxx.jsp", request, response);
		}
		
		
		//添加科室
		if(ac.equals("ksadd"))
		{
			    String name = request.getParameter("name");  
			    String type = request.getParameter("type");
			    String remark = request.getParameter("remark");
			    String sql = "insert into ks (name,type,remark,delstatus) values('"+name+"','"+type+"','"+remark+"','0')";
			    dao.commOper(sql);
		    	request.setAttribute("suc", "");
		    	go("/admin/ksadd.jsp", request, response);
		}
		
		
		//修改科室
		if(ac.equals("ksedit"))
		{
			    String id = request.getParameter("id");
			    String name = request.getParameter("name");
			    String type = request.getParameter("type");
			    String remark = request.getParameter("remark");
			    String sql = "update ks set name='"+name+"',type='"+type+"',remark='"+remark+"' where id="+id;
			    dao.commOper(sql);
		    	request.setAttribute("suc", "");
		    	request.setAttribute("id", id);
		    		go("/admin/ksadd.jsp", request, response);
		}
		//添加医生
		if(ac.equals("sysuseradd"))
		{
			    try {
			    	String uname = "";
			    	String upass = "";
				    String tname = "";
				    String sex = "";
				    String tel = "";
				    String ks = "";
				    String zc = "";
				    String idcard = "";
					String filename = "";
					String remark = "";
				request.setCharacterEncoding("utf-8");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){
				   DiskFileItemFactory factory = new DiskFileItemFactory();
				   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
				   ServletFileUpload upload = new ServletFileUpload(factory);
				   upload.setSizeMax(100*1024*1024);
				   List items = new ArrayList();
				     items = upload.parseRequest(request);
				     
				     uname = ((FileItem) items.get(0)).getString();
				     uname = Info.getUTFStr(uname);
				     
				     upass = ((FileItem) items.get(1)).getString();
				     upass = Info.getUTFStr(upass);	
				     
				     tname = ((FileItem) items.get(2)).getString();
				     tname = Info.getUTFStr(tname);	
				     
				     sex = ((FileItem) items.get(3)).getString();
				     sex = Info.getUTFStr(sex);	
				     
				     tel = ((FileItem) items.get(4)).getString();
				     tel = Info.getUTFStr(tel);	
				     
				     ks = ((FileItem) items.get(5)).getString();
				     ks = Info.getUTFStr(ks);	
				     
				     zc = ((FileItem) items.get(6)).getString();
				     zc = Info.getUTFStr(zc);	
				     
				     idcard = ((FileItem) items.get(7)).getString();
				     idcard = Info.getUTFStr(idcard);
				     
				     remark = ((FileItem) items.get(9)).getString();
				     remark = Info.getUTFStr(remark);
				     
				    FileItem fileItem = (FileItem) items.get(8);

				    if(fileItem.getName()!=null && fileItem.getSize()!=0){
				      File fullFile = new File(fileItem.getName());
				      filename = Info.generalFileName(fullFile.getName());
				      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
				      try {
				       fileItem.write(newFile);
				      } catch (Exception e) {
				       e.printStackTrace();
				      }
				     }else{
				     }
				    
				}
				String csql = "select * from h_doctor  where uname='"+uname+"'";
			    if(dao.select(csql).size()>0)
			    {
			    	request.setAttribute("error", "");
			    	go("/admin/sysuseradd.jsp", request, response);
			    }else{
			    String sql = "insert sysuser (uname,upass,tname,sex,tel,ks,zc,utype,img,delstatus,idcard,remark) values('"+uname+"','"+upass+"','"+tname+"','"+sex+"','"+tel+"','"+ks+"','"+zc+"','医生','"+filename+"','0','"+idcard+"','"+remark+"')";
				//String sql = "insert into info (title,content,type,savetime,img) values ('"+title+"','"+mt+"','1','"+Info.getDateStr()+"','"+filename+"') ";
				dao.commOper(sql);
				request.setAttribute("suc", "");
				go("/admin/sysuseradd.jsp", request, response);
			    }
				} catch (Exception e1) {
					e1.printStackTrace();
					request.setAttribute("error", "");
				     request.getRequestDispatcher("/admin/sysuseradd.jsp").forward(request, response);
				    }
				
		}
		//修改医生
		if(ac.equals("sysuseredit"))
		{
		    	String id = request.getParameter("id");
				HashMap map = dao.select("select * from h_doctor  where id="+id).get(0);
				try {
					String uname = "";
			    	String upass = "";
				    String tname = "";
				    String sex = "";
				    String tel = "";
				    String ks = "";
				    String zc = "";
				    String idcard = "";
					String filename = "";
					String remark = "";
					String sql = "";
				request.setCharacterEncoding("utf-8");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){

				   DiskFileItemFactory factory = new DiskFileItemFactory();
				   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
				   ServletFileUpload upload = new ServletFileUpload(factory);
				   upload.setSizeMax(100*1024*1024);
				   List items = new ArrayList();
				     items = upload.parseRequest(request);
				     uname = ((FileItem) items.get(0)).getString();
				     uname = Info.getUTFStr(uname);
				     
				     upass = ((FileItem) items.get(1)).getString();
				     upass = Info.getUTFStr(upass);	
				     
				     tname = ((FileItem) items.get(2)).getString();
				     tname = Info.getUTFStr(tname);	
				     
				     sex = ((FileItem) items.get(3)).getString();
				     sex = Info.getUTFStr(sex);	
				     
				     tel = ((FileItem) items.get(4)).getString();
				     tel = Info.getUTFStr(tel);	
				     
				     ks = ((FileItem) items.get(5)).getString();
				     ks = Info.getUTFStr(ks);	
				     
				     zc = ((FileItem) items.get(6)).getString();
				     zc = Info.getUTFStr(zc);	
				     
				     idcard = ((FileItem) items.get(7)).getString();
				     idcard = Info.getUTFStr(idcard);
				     
				     remark = ((FileItem) items.get(9)).getString();
				     remark = Info.getUTFStr(remark);
				     
				    FileItem fileItem = (FileItem) items.get(8);
				    
				    if(fileItem.getName()!=null && fileItem.getSize()!=0){
				      File fullFile = new File(fileItem.getName());
				      filename = Info.generalFileName(fullFile.getName());
				      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
				      sql = "update sysuser set upass='"+upass+"' ,tname='"+tname+"',sex='"+sex+"',tel='"+tel+"',ks='"+ks+"',zc='"+zc+"',img='"+filename+"',idcard='"+idcard+"',remark='"+remark+"' where id='"+id+"'";
				      try {
				       fileItem.write(newFile);
				      } catch (Exception e) {
				       e.printStackTrace();
				      }
				     }else{
				    	 sql = "update sysuser set upass='"+upass+"' ,tname='"+tname+"',sex='"+sex+"',tel='"+tel+"',ks='"+ks+"',zc='"+zc+"',idcard='"+idcard+"',remark='"+remark+"' where id='"+id+"'";
				     }
				}
				dao.commOper(sql);
				request.setAttribute("suc", "");
				go("/admin/sysuseradd.jsp?id="+id, request, response);
				} catch (Exception e1) {
					e1.printStackTrace();
					request.setAttribute("error", "");
				     request.getRequestDispatcher("/admin/sysuseradd.jsp?id="+id).forward(request, response);
				    }
				
		}
		//病人注册
		if(ac.equals("reg"))
		{
			    String uname = request.getParameter("uname");
			    String csql = "select * from h_user where uname='"+uname+"'";
			    if(dao.select(csql).size()>0)
			    {
			    	request.setAttribute("no", "");
			    	go("/reg.jsp", request, response);
			    }else{
			    String upass = request.getParameter("upass");
			    String tname = request.getParameter("tname");
			    String sex = request.getParameter("sex");
			    String age = request.getParameter("age");
			    String tel = request.getParameter("tel");
			    String idcard = request.getParameter("idcard");
			    String sql = "insert into br (uname,upass,tname,sex,age,tel,isblack,delstatus,idcard) values('"+uname+"','"+upass+"','"+tname+"','"+sex+"','"+age+"','"+tel+"','no','0','"+idcard+"')";
			    dao.commOper(sql);
		    	request.setAttribute("suc", "");
		    	go("/reg.jsp", request, response);
			    }
		}
		//病人修改个人信息
		if(ac.equals("grinfo"))
		{
			    String uname = request.getParameter("uname");
			    String oldupass = request.getParameter("oldupass");
			    
			    String csql = "select * from h_user where id='"+user.get("id")+"'";
			    HashMap map = dao.select(csql).get(0);
			    if(!oldupass.equals(map.get("upass")))
			    {
			    	request.setAttribute("no", "");
			    	go("/patient_info.jsp", request, response);
			    }else{
			    String upass = request.getParameter("upass1");
			    String tname = request.getParameter("tname");
			    String sex = request.getParameter("sex");
			    String age = request.getParameter("age");
			    String tel = request.getParameter("tel");
			    String idcard = request.getParameter("idcard");
			    String sql = "update br set upass='"+upass+"',tname='"+tname+"',sex='"+sex+"',age='"+age+"',tel='"+tel+"',idcard='"+idcard+"' where id="+user.get("id");
			    dao.commOper(sql);
		    	request.setAttribute("suc", "");
		    	go("/patient_info.jsp", request, response);
			    }
		}
		//病人注销 
		if(ac.equals("bexit"))
		{
				session.removeAttribute("user");
		    	go("/newscenter.jsp", request, response);
		}
		
		
		
		//医院简介
		if(ac.equals("yyjj")){
			String remark = request.getParameter("remark");
			dao.commOper("update yyjj set remark='"+remark+"' where id=1 ");
			request.setAttribute("suc", "");
	    	go("/admin/yyjj.jsp", request, response);
		}
		//添加新闻
		if(ac.equals("noticeadd")){
			String title=  request.getParameter("title");
			String content = request.getParameter("content");
			String savetime = Info.getDateStr();
			dao.commOper("insert into notice (title,content,savetime) values ('"+title+"','"+content+"','"+savetime+"') ");
			request.setAttribute("suc", "");
	    	go("/admin/noticeadd.jsp", request, response);
		}
		//编辑新闻
		if(ac.equals("noticeedit")){
			String id=  request.getParameter("id");
			String title=  request.getParameter("title");
			String content = request.getParameter("content");
			String savetime = Info.getDateStr();
			dao.commOper("update notice set title='"+title+"',content='"+content+"' where id="+id);
			request.setAttribute("suc", "");
	    	go("/admin/noticeadd.jsp", request, response);
		}
		//添加排班
		if(ac.equals("yspbadd")){
			String ysid = request.getParameter("ysid");
			String rq = request.getParameter("rq");
			String rs = request.getParameter("rs");
			ArrayList cklist = (ArrayList)dao.select("select * from h_d_orders where hdoctor='"+ysid+"' and rq='"+rq+"'");
			if(cklist.size()>0){
				request.setAttribute("no", "");
		    	go("/admin/yspbadd.jsp", request, response);
			}else{
				dao.commOper("insert into yspb (ysid,rq,rs) values ('"+ysid+"','"+rq+"','"+rs+"') ");
				request.setAttribute("suc", "");
		    	go("/admin/yspbadd.jsp", request, response);
			}
		}
		//修改排班
		if(ac.equals("yspbedit")){
			String id = request.getParameter("id");
			String rs = request.getParameter("rs");
			dao.commOper("update yspb set rs='"+rs+"' where id="+id);
			request.setAttribute("suc", "");
	    	go("/admin/yspbedit.jsp?id="+id, request, response);
		}
		//预约挂号
		if(ac.equals("yygh")){
			String ysid = request.getParameter("ysid");
			String rq = request.getParameter("rq");
			String uid = user.get("id").toString();
			ArrayList cklist = (ArrayList)dao.select("select * from h_p where hdoctor='"+ysid+"' and rq='"+rq+"' and huser='"+uid+"'");
			if(cklist.size()>0){
				request.setAttribute("no", "");
		    	go("/doctor_plans.jsp?ysid="+ysid, request, response);
			}else{
				dao.commOper("insert into yy (ysid,rq,uid,status) values ('"+ysid+"','"+rq+"','"+uid+"','待诊') ");
				request.setAttribute("suc", "");
		    	go("/doctor_plans.jsp?ysid="+ysid, request, response);
			}
		}
	dao.close();
	out.flush();
	out.close();
}


	public void init() throws ServletException {
		// Put your code here
	}
	
	
	public static void main(String[] args) {
		System.out.println(new CommDAO().select("select * from mixinfo"));
	}
	

}
