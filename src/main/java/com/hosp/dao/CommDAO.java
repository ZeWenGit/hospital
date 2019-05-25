package com.hosp.dao;

import java.io.InputStream;
import java.sql.*;
import java.util.*;


public class CommDAO {

    Connection conn = null;

    public CommDAO() {
        conn = this.getConn();
    }


    private static Properties config = null;

    static {
        try {

            config = new Properties();
            // InputStream in = config.getClass().getResourceAsStream("dbconnection.properties");

            InputStream in = CommDAO.class.getClassLoader().getResourceAsStream("dbconnection.properties");


            config.load(in);

            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public Connection getConn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dburl = (String) config.get("dburl");
            conn = DriverManager.getConnection(dburl);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }


    public int getInt(String sql) {
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                i = rs.getInt(1);
            }
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return i;
    }


    public double getDouble(String sql) {
        double i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                i = rs.getDouble(1);

            }
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return i;
    }

    public void commOper(String sql) {
        try {
            Statement st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void commOperSqls(ArrayList<String> sql) {

        try {
            conn.setAutoCommit(false);
            for (int i = 0; i < sql.size(); i++) {
                Statement st = conn.createStatement();

                st.execute(sql.get(i));
                st.close();
            }
            conn.commit();
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


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
            // TODO Auto-generated catch block
            System.out.println("--" + sql);
            e.printStackTrace();
        }
        return list;
    }


    public void close() {
        try {
            conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 鎵ц涓�鏉℃煡璇ql,浠� List<hashmap> 鐨勫舰寮忚繑鍥炴煡璇㈢殑璁板綍锛岃褰曟潯鏁帮紝鍜屼粠绗嚑鏉″紑濮嬶紝鐢卞弬鏁板喅瀹氾紝涓昏鐢ㄤ簬缈婚〉
     * pageno 椤电爜  rowsize 姣忛〉鐨勬潯鏁�
     */
    public List select(String sql, int pageno, int rowsize) {
        List<HashMap> list = new ArrayList<HashMap>();
        List<HashMap> mlist = new ArrayList<HashMap>();
        try {
            list = this.select(sql);
            int min = (pageno - 1) * rowsize;
            int max = pageno * rowsize;

            for (int i = 0; i < list.size(); i++) {

                if (!(i < min || i > (max - 1))) {
                    mlist.add(list.get(i));
                }
            }
        } catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }


        return mlist;
    }


    public static void main(String[] args) {
        System.out.println(new CommDAO());
    }
}
