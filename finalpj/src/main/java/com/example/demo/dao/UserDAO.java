package com.example.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.demo.DBOpen;

public class UserDAO {

	public int duplicateID(String id){
		int cnt=0;
	    try{
	    	Connection con=DBOpen.getConnection();
	        StringBuilder sql=new StringBuilder();
	        
	        //아이디 중복 확인
	        sql.append(" SELECT count(id) as cnt ");
	        sql.append(" FROM user ");
	        sql.append(" WHERE id = ? ");
	        
	        PreparedStatement pstmt=con.prepareStatement(sql.toString());
	        pstmt.setString(1, id);
	        
	        ResultSet rs=pstmt.executeQuery();
	        if(rs.next()){
	        	cnt=rs.getInt("cnt");
	        }
	        return cnt;
	    }catch(Exception e){
	     	System.out.println("아이디 중복 확인 실패 : " + e);
	     	return -1;
	    }//try end
	}
}
