package domain.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import domain.dto.UserDto;
import domain.dto.itemDto;

public class UserDaoImpl {
	
	private String url ="jdbc:mysql://localhost:3306/userdb";
	private String id = "root";
	private String pw = "1234";
	
	private Connection conn =null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public UserDaoImpl() throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,id,pw);
		System.out.println("[DAO] UserDaoImpl's INIT DB Connected...");
	}
	//INSERT
	public boolean Insert(UserDto dto) throws Exception{
		pstmt=conn.prepareStatement("insert into user values(?,?,?,?,?,?)");
		pstmt.setInt(1, dto.getUser_id());
		pstmt.setString(2,dto.getPassword());
		pstmt.setString(3, dto.getName());
		pstmt.setString(4, dto.getPhone_number());
		pstmt.setString(5, dto.getEmail());
		pstmt.setString(6, dto.getMember());
		
		return pstmt.executeUpdate()>0;
	}
	
	//select 
	public UserDto Select(String name) throws Exception{
		pstmt=conn.prepareStatement("select *from user where  name=?");
		pstmt.setString(1, name);
		rs=pstmt.executeQuery();
		UserDto dto=null;
		
		if(rs!=null) {
			if(rs.next()) {
				dto=new UserDto();
				dto.setName(name);
				dto.setPassword(rs.getString("password"));
				dto.setPhone_number(rs.getString("phone_number"));
				dto.setEmail(rs.getString("email"));
				dto.setMember(rs.getString("member"));
			}
		}
		return dto;
	}
	//delete
	public void Delete(int user_id) throws Exception{
		pstmt=conn.prepareStatement("delete from user where user_id=?");
		pstmt.setInt(1, user_id);
		
		int result =pstmt.executeUpdate();
		
		if(result>0) {
			System.out.println("삭제성공");
		}else
		System.out.println("삭제 실패");
	}
	public List<UserDto> SelectAll() throws Exception{
		List<UserDto> userlist = new ArrayList();
		pstmt=conn.prepareStatement("select *from user");
		rs=pstmt.executeQuery();
		if(rs!=null) {
			while(rs.next()) {
				UserDto dto =new UserDto();
				dto.setUser_id(rs.getInt("user_id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setPhone_number(rs.getString("phone_number"));
				dto.setEmail(rs.getString("email"));
				dto.setMember(rs.getString("member"));
				
				userlist.add(dto);
				System.out.println(dto);
			}
		}
			else
				System.out.println("조회실패했음");
			rs.close();
			pstmt.close();
			return userlist;
		}
	//update
	public void update(UserDto dto) throws Exception{
		pstmt=conn.prepareStatement("update user set password=?,name=?,phone_number=?,email=?,member=? where user_id=? ");
		pstmt.setString(1, dto.getPassword());
		pstmt.setString(2, dto.getName());
		pstmt.setString(3, dto.getPhone_number());
		pstmt.setString(4, dto.getEmail());
		pstmt.setString(5, dto.getMember());
		pstmt.setInt(6, dto.getUser_id());
		
		int result =pstmt.executeUpdate();
		pstmt.close();
		
		if(result>0) {
			System.out.println("업뎃성공");
		}else
				System.out.println("업뎃실패");
		}
	}
	
	


