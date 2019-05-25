package com.hosp.controller;

import com.hosp.dao.CommonDao;
import com.hosp.util.Info;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author ZhangHang
 * @create 2018-12-02 23:14
 **/
@Controller
@RequestMapping("/common")
public class CommonController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private HttpServletRequest request; //自动注入request

    @Autowired
    private CommonDao commonDao;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(String uname, String upass, String tname, String sex, String age, String tel, String idcard) {
        String csql = "select * from t_user where uname='" + uname + "'";
        if (commonDao.select(csql).size() > 0) {
            request.setAttribute("no", "");
        } else {
            String sql = "insert into h_user (uname,upass,tname,sex,age,tel,isblack,delstatus,idcard) values('" + uname + "','" + upass + "','" + tname + "','" + sex + "','" + age + "','" + tel + "','no','0','" + idcard + "')";
            commonDao.commOper(sql);
            request.setAttribute("suc", "");
        }
        return "/jsp/reg.jsp";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(String uname, String upass) {
        HttpSession session = request.getSession();
        String sql = "select * from h_user where uname='" + uname + "' and upass='" + upass + "' and isblack='no' and delstatus='0'  ";
        List<HashMap> list = commonDao.select(sql);
        if (list.size() == 1) {
            session.setAttribute("user", list.get(0));
            request.setAttribute("suc", "");
            return "/jsp/readme.jsp";
        } else {
            request.setAttribute("no", "");
            return "/index.jsp";
        }
    }

    /**
     * 病人修改个人信息
     *
     * @param uname
     * @param oldupass
     * @param upass
     * @param tname
     * @param sex
     * @param age
     * @param tel
     * @param idcard
     * @return
     */
    @RequestMapping(value = "/updatePatient", method = RequestMethod.GET)
    public String updatePatient(String uname, String oldupass, String upass, String tname, String sex, String age, String tel, String idcard) {
        HashMap user = (HashMap) request.getSession().getAttribute("user");
        String csql = "select * from h_user where id='" + user.get("id") + "'";
        HashMap map = commonDao.select(csql).get(0);
        if (!oldupass.equals(map.get("upass"))) {
            request.setAttribute("no", "");
        } else {
            String sql = "update h_user set upass='" + upass + "',tname='" + tname + "',sex='" + sex + "',age='" + age + "',tel='" + tel + "',idcard='" + idcard + "' where id=" + user.get("id");
            commonDao.commOper(sql);
            request.setAttribute("suc", "");
        }
        return "/jsp/patient_info.jsp";
    }

    /**
     * 病人注销
     *
     * @return
     */
    @RequestMapping(value = "/logoutPatient", method = RequestMethod.GET)
    public String logoutPatient() {
        request.getSession().removeAttribute("user");
        return "/index.jsp";
    }


    /**
     * 预约挂号
     *
     * @return
     */
    @RequestMapping(value = "/registerDoctor", method = RequestMethod.GET)
    public String registerDoctor(String doctorId, String time) {
        HashMap user = (HashMap) request.getSession().getAttribute("user");

        String uid = user.get("id").toString();
        ArrayList cklist = (ArrayList) commonDao.select("select * from h_p where hdoctor='" + doctorId + "' and rq='" + time + "' and huser='" + uid + "'");
        if (cklist.size() > 0) {
            request.setAttribute("no", "");
        } else {
            commonDao.commOper("insert into h_p (hdoctor,rq,huser,status) values ('" + doctorId + "','" + time + "','" + uid + "','待诊') ");
            request.setAttribute("suc", "");
        }
        return "/jsp/doctor_plans.jsp?ysid=" + doctorId;
    }

    /**
     * 管理员登录
     *
     * @return
     */
    @RequestMapping(value = "/adminlogin", method = RequestMethod.GET)
    public String adminLogin(String uname, String upass) {
        String sql = "select * from h_doctor where uname='" + uname + "' and upass='" + upass + "' and delstatus='0' ";

        List<HashMap> list = commonDao.select(sql);
        if (list.size() == 1) {
            request.getSession().setAttribute("admin", list.get(0));
            request.setAttribute("suc", "");
            return "/jsp/admin/index.jsp";
        } else {
            request.setAttribute("no", "");
            return "/jsp/admin/login.jsp";
        }
    }

    /**
     * 医生修改个人信息
     *
     * @param upass
     * @return
     */
    @RequestMapping(value = "/patientUpdate", method = RequestMethod.GET)
    public String patientUpdate(String id, String tname, String upass, String sex, String tel) {
        String sql = "update h_doctor set tname='" + tname + "',upass='" + upass + "',sex='" + sex + "',tel='" + tel + "' where id='" + id + "' ";
        commonDao.commOper(sql);
        request.setAttribute("suc", "");
        return "/jsp/admin/grxx.jsp";
    }

    /**
     * 后台注销
     *
     * @return
     */
    @RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
    public String adminLogout() {
        request.getSession().removeAttribute("admin");
        return "/jsp/admin/login.jsp";
    }

    /**
     * 医院简介
     *
     * @return
     */
    @RequestMapping(value = "/hospitalMark", method = RequestMethod.GET)
    public String hospitalMark(String remark) {
        commonDao.commOper("update yyjj set remark='" + remark + "' where id=1 ");
        request.setAttribute("suc", "");
        return "/jsp/admin/yyjj.jsp";
    }

    /**
     * 修改医生
     *
     * @return
     */
    @RequestMapping(value = "/doctorEdit", method = RequestMethod.GET)
    public String doctorEdit(String id) {
        HashMap map = commonDao.select("select * from h_doctor where id=" + id).get(0);
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
            RequestContext requestContext = new ServletRequestContext(request);
            if (FileUpload.isMultipartContent(requestContext)) {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(100 * 1024 * 1024);
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

                if (fileItem.getName() != null && fileItem.getSize() != 0) {
                    File fullFile = new File(fileItem.getName());
                    filename = Info.generalFileName(fullFile.getName());
                    File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                    sql = "update sysuser set upass='" + upass + "' ,tname='" + tname + "',sex='" + sex + "',tel='" + tel + "',ks='" + ks + "',zc='" + zc + "',img='" + filename + "',idcard='" + idcard + "',remark='" + remark + "' where id='" + id + "'";
                    try {
                        fileItem.write(newFile);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    sql = "update sysuser set upass='" + upass + "' ,tname='" + tname + "',sex='" + sex + "',tel='" + tel + "',ks='" + ks + "',zc='" + zc + "',idcard='" + idcard + "',remark='" + remark + "' where id='" + id + "'";
                }
            }
            commonDao.commOper(sql);
            request.setAttribute("suc", "");
            return "/jsp/admin/sysuseradd.jsp?id=" + id;
        } catch (Exception e1) {
            e1.printStackTrace();
            request.setAttribute("error", "");
            return "/jsp/admin/sysuser.jsp";
        }
    }

    /**
     * 添加医生
     *
     * @return
     */
    @RequestMapping(value = "/doctorAdd", method = RequestMethod.GET)
    public String doctorAdd() {
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
                RequestContext requestContext = new ServletRequestContext(request);
                if (FileUpload.isMultipartContent(requestContext)) {
                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(100 * 1024 * 1024);
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

                    if (fileItem.getName() != null && fileItem.getSize() != 0) {
                        File fullFile = new File(fileItem.getName());
                        filename = Info.generalFileName(fullFile.getName());
                        File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
                        try {
                            fileItem.write(newFile);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else {
                    }

                }
                String csql = "select * from h_doctor  where uname='" + uname + "'";
                if (commonDao.select(csql).size() > 0) {
                    request.setAttribute("error", "");
                    return "/jsp/admin/sysuseradd.jsp";
                } else {
                    String sql = "insert sysuser (uname,upass,tname,sex,tel,ks,zc,utype,img,delstatus,idcard,remark) values('" + uname + "','" + upass + "','" + tname + "','" + sex + "','" + tel + "','" + ks + "','" + zc + "','医生','" + filename + "','0','" + idcard + "','" + remark + "')";
                    //String sql = "insert into info (title,content,type,savetime,img) values ('"+title+"','"+mt+"','1','"+Info.getDateStr()+"','"+filename+"') ";
                    commonDao.commOper(sql);
                    request.setAttribute("suc", "");
                    return "/jsp/admin/sysuseradd.jsp";
                }
            } catch (Exception e1) {
                e1.printStackTrace();
                request.setAttribute("error", "");
                return "/jsp/admin/sysuseradd.jsp";
            }
    }

    /**
     * 添加排班
     * @param ysid
     * @param rq
     * @param rs
     * @return
     */
    @RequestMapping(value = "/pbAdd", method = RequestMethod.GET)
    public String pbAdd(String ysid,String rq,String rs){
        ArrayList cklist = (ArrayList)commonDao.select("select * from h_d_orders where hdoctor='"+ysid+"' and rq='"+rq+"'");
        if(cklist.size()>0){
            request.setAttribute("no", "");
            return "/jsp/admin/yspbadd.jsp";
        }else{
            commonDao.commOper("insert into yspb (ysid,rq,rs) values ('"+ysid+"','"+rq+"','"+rs+"') ");
            request.setAttribute("suc", "");
            return "/jsp/admin/yspbadd.jsp";
        }
    }

    /**
     * 修改排班
     * @return
     */
    @RequestMapping(value = "/pbEdit", method = RequestMethod.GET)
    public String pbEdit(String id,String rs){
        commonDao.commOper("update h_d_orders set rs='"+rs+"' where id="+id);
        request.setAttribute("suc", "");
        return "/jsp/admin/yspbedit.jsp?id="+id;
    }

    /**
     * 增加科室
     * @return
     */
    @RequestMapping(value = "/ksAdd", method = RequestMethod.GET)
    public String kbAdd(String name,String type,String remark){
        String sql = "insert into h_type (name,type,remark,delstatus) values('"+name+"','"+type+"','"+remark+"','0')";
        commonDao.commOper(sql);
        request.setAttribute("suc", "");
        return "/jsp/admin/ksadd.jsp";
    }

    /**
     * 修改科室
     * @return
     */
    @RequestMapping(value = "/ksEdit", method = RequestMethod.GET)
    public String kbEdit(String id,String name,String type,String remark){
        String sql = "update h_type set name='"+name+"',type='"+type+"',remark='"+remark+"' where id='"+id+"'";
        commonDao.commOper(sql);
        request.setAttribute("suc", "");
        request.setAttribute("id", id);
        return "/jsp/admin/ksadd.jsp";
    }


}