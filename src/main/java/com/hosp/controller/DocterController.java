package com.hosp.controller;

import com.hosp.dao.CommDAO;
import com.hosp.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author ZhangHang
 * @create 2018-12-02 1:57
 **/
@Controller
@RequestMapping("/doctor")
public class DocterController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private HttpServletRequest request; //自动注入request

    @Autowired
    private DoctorService doctorService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addDoctor(String uname, String upass, String tname, String sex, String age, String tel, String idcard) {
        CommDAO dao = new CommDAO();
        String csql = "select * from h_user where uname='" + uname + "'";
        jdbcTemplate.execute(csql);
        if (dao.select(csql).size() > 0) {
            request.setAttribute("no", "");
        } else {
            String sql = "insert into br (uname,upass,tname,sex,age,tel,isblack,delstatus,idcard) values('" + uname + "','" + upass + "','" + tname + "','" + sex + "','" + age + "','" + tel + "','no','0','" + idcard + "')";
            dao.commOper(sql);
            request.setAttribute("suc", "");
        }
        return "reg";
    }

}
