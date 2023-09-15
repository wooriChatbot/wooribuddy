package com.example.demo;
import java.sql.Connection;
import java.sql.DriverManager;
 

public class DBOpen {
  public static Connection getConnection() throws Exception {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://database-2.catsg9unmalm.ap-northeast-2.rds.amazonaws.com:3306/wooridb", "root","wooridb2023");
   return con;
  }//getConnection() end
   
}//class end