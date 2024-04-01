package domain.dao;
 

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.dto.itemDto;

public class itemDao {
	
	private String url="jdbc:mysql://localhost:3306/bookdb";
	private String id ="root";
	private String pw = "1234";
	
	private Connection conn =null;
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	java.util.Date utilDate= new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
 
	public itemDao() throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pw);
		System.out.println("[DAO] itemDao's INIT DB Connected..");

}
	
	public void Insert(itemDto dto) throws SQLException {
		
		pstmt=conn.prepareStatement("insert into item values(?,?,?,?,?,?,?)");
		pstmt.setInt(1, dto.getItem_id());
		pstmt.setInt(2, dto.getBussinessMan_id());
		pstmt.setString(3, dto.getItem_name());
		pstmt.setString(4, dto.getItem_type());
		pstmt.setInt(5, dto.getItem_price());
		pstmt.setInt(6, dto.getItem_count());
		pstmt.setDate(7, sqlDate);
		
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		if(result>0) {
			System.out.println("인설트 성공");
		}else
			System.out.println("인설트 실패");
			
		
		
	}
	public void update(itemDto dto) throws SQLException {
		pstmt=conn.prepareStatement("update item  set BusinessMan=?,item_name=?,item_type=?,item_price=?,item_count=? ,item_manufacturing_date=? where item_id=?");
		pstmt.setInt(1, dto.getBussinessMan_id());
		pstmt.setString(2, dto.getItem_name());
		pstmt.setString(3, dto.getItem_type());
		pstmt.setInt(4, dto.getItem_price());
		pstmt.setInt(5,dto.getItem_count());
		pstmt.setDate(6,sqlDate);
		pstmt.setInt(7,dto.getItem_id());
		
		int result = pstmt.executeUpdate();
		pstmt.close();
		
		if(result>0) {
			System.out.println("업데이트 성공");
		}else
			System.out.println("업데이트 실패");
		
	}
	public void delete(int item_id) throws SQLException{
		pstmt=conn.prepareStatement("delete from item where item_id=?");
		pstmt.setInt(1, item_id);
		
		int result = pstmt.executeUpdate();
		
		if(result>0) {
			System.out.println("딜리트 성공");
		}else
			System.out.println("딜리트 실패");
	}
	
	public List<itemDto> selectAll() throws SQLException{
		List<itemDto> itemlist = new ArrayList();
		pstmt=conn.prepareStatement("select *from item");
		rs=pstmt.executeQuery();
		if(rs!=null)
		{
		while(rs.next()) {
			itemDto dto = new itemDto();
			dto.setItem_id(rs.getInt("item_id"));
			dto.setBussinessMan_id(rs.getInt("BusinessMan_id"));
			dto.setItem_name(rs.getString("item_name"));
			dto.setItem_type(rs.getString("item_type"));
			dto.setItem_price(rs.getInt("item_price"));
			dto.setItem_count(rs.getInt("item_count"));
			dto.setItem_manufacturing_date(rs.getDate("item_manufacturing_date"));
			
			itemlist.add(dto);
		}
		}
		rs.close();
		pstmt.close();
		return null;
	}
	public itemDto select(int item_id) throws SQLException {
		pstmt=conn.prepareStatement("select *from item where item_code=?");
		pstmt.setInt(1, item_id);
		rs=pstmt.executeQuery();
		
		itemDto dto= null;
		if(rs!=null) {
			rs.next();
			dto=new itemDto();
			dto.setItem_id(rs.getInt("item_id"));
			dto.setBussinessMan_id(rs.getInt("BusinessMan_id"));
			dto.setItem_name(rs.getString("item_name"));
			dto.setItem_price(rs.getInt("item_price"));
			dto.setItem_count(rs.getInt("item_count"));
			dto.setItem_manufacturing_date(rs.getDate("item_manufacturing_date"));
			
			
		}
		rs.close();
		pstmt.close();
		return dto;
	
	}
}

	

