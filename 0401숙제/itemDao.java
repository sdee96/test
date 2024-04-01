package domain.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import domain.dto.itemDto;

public class itemDao {
	
	private String url="jdbc:mysql://localhost:3306/bookdb";
	private String id ="root";
	private String pw = "1234";
	
	private Connection conn =null;
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
 
	public itemDao() throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pw);
		System.out.println("[DAO] itemDao's INIT DB Connected..");

}
	
	public void Insert(itemDto dto) throws SQLException {
		
		pstmt=conn.prepareStatement("insert into item values(?,?,?,?,?,?,?)");
		pstmt.setInt(1, dto.getItem_id());
		pstmt.setInt(2, dto.getBussinessMan());
		pstmt.setString(3, dto.getItem_name());
		pstmt.setString(4, dto.getItem_type());
		pstmt.setInt(5, dto.getItem_price());
		pstmt.setInt(6, dto.getItem_count());
		pstmt.setDate(7, dto.getItem_manufacturing_date());
		
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		if(result>0) {
			System.out.println("인설트 성공");
		}else
			System.out.println("인설트 실패");
		
		
		
		
	}
	
}
