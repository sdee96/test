package domain.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import domain.dto.SessionDto;

public class SessionDaoImpl {
	
	private String url ="jdbc:mysql://localhost:3306/item";
	private String id = "root";
	private String pw = "1234";
	
	private Connection conn =null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public SessionDaoImpl() throws Exception{	
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,id,pw);
		System.out.println("[DAO] SessionDaoImpl's INIT DB Connected...");
	}
	//session 전용
	public boolean Insert(SessionDto sessionDto) throws Exception{
		pstmt=conn.prepareStatement("insert into session values(null,?,?)");
		pstmt.setString(1, sessionDto.getusersname());
		pstmt.setString(2, sessionDto.getRole());
		return pstmt.executeUpdate()>0;	
	
}
	public SessionDto Select(int sessionId) throws Exception{
		pstmt=conn.prepareStatement("select *from session where id=?");
		pstmt.setInt(1, sessionId);
		rs=pstmt.executeQuery();
		SessionDto dto =null;
		if(rs!=null) {
			rs.next();
			dto=new SessionDto();
			dto.setusersname(rs.getString("username"));
			dto.setRole(rs.getString("role"));
			dto.setSessionId(rs.getInt("id"));
		}
		return dto;
	}
	
	public SessionDto Select(String username) throws Exception{
		pstmt=conn.prepareStatement("select *from session where username=?");
		pstmt.setString(1, username);
		rs=pstmt.executeQuery();
		SessionDto dto=null;
		if(rs!=null) {
			rs.next();
			dto=new SessionDto();
			dto.setusersname(rs.getString("username"));
			dto.setRole(rs.getString("role"));
			dto.setSessionId(rs.getInt("id"));
		}
		return dto;
	}
}

		
	


