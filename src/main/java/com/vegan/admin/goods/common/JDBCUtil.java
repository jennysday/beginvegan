package com.vegan.admin.goods.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil { 

	public static Connection getConnection() { 
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger"); 
		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	public static void close(PreparedStatement pstmt, Connection conn) {
		
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {e.printStackTrace();
			} finally {pstmt=null;}
		}
		
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {e.printStackTrace();
			} finally {conn=null;}
		}
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {e.printStackTrace();
			} finally {rs=null;}
		}
		
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {e.printStackTrace();
			} finally {pstmt=null;}
		}
		
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {e.printStackTrace();
			} finally {conn=null;}
		}

	}
}


