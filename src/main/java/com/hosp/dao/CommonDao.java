package com.hosp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.jdbc.support.rowset.SqlRowSetMetaData;
import org.springframework.stereotype.Repository;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

/**
 * @author ZhangHang
 * @create 2018-12-02 23:20
 **/

@Repository
public class CommonDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static Connection conn = null;

    public CommonDao() {
        conn = this.getConn();
    }

    /**
     * 查询结果
     * @param sql
     * @return
     */
    public List<HashMap> select(String sql) {
        List<HashMap> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();

            while (rs.next()) {
                HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {

                        map.put(rsmd.getColumnName(j), rs.getString(j) == null ? "" : rs.getString(j));
                    } else {

                        map.put("id", rs.getString(j));
                    }
                }
                list.add(map);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println("--" + sql);
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 插入、更新
     * @param sql
     */
    public void commOper(String sql) {
        try {
            Statement st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Connection getConn() {
        try {
            Properties config = new Properties();
            InputStream in = CommDAO.class.getClassLoader().getResourceAsStream("dbconnection.properties");
            config.load(in);
            in.close();

            Class.forName("com.mysql.jdbc.Driver");
            String dburl = (String) config.get("dburl");
            conn = DriverManager.getConnection(dburl);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
