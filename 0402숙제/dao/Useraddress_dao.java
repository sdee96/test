package domain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import domain.DBConn;
import domain.dto.Addressdto;

public class Useraddress_dao {

    private Connection conn;

    public Useraddress_dao() {
    }

    public int insertUseraddr(Addressdto useraddr) throws SQLException {
        conn = new DBConn().getConn();

        PreparedStatement pstmt = conn.prepareStatement("INSERT INTO USER_addr VALUES (?, ?, ?, ?, ?, ?,?,?)");
        pstmt.setInt(1, useraddr.getdelivery_id());
        pstmt.setInt(2, useraddr.getuser_id());
        pstmt.setString(3, useraddr.getDelivery_addr_name());
        pstmt.setString(4, useraddr.getName());
        pstmt.setString(5, useraddr.getPhone_number());
        pstmt.setString(6, useraddr.getAddr());
        pstmt.setString(7, useraddr.getAddrs());
        pstmt.setString(8, useraddr.getDelivery_request());


        int result = pstmt.executeUpdate();

        if (result > 0) {
            System.out.println("update 성공");
        } else {
            System.out.println("update 실패");
        }

        pstmt.close();
        conn.close();

        return result;
    }
    public void selectUser_addr() throws SQLException {
        conn = new DBConn().getConn();
        PreparedStatement pstmt =conn.prepareStatement("SELECT * FROM USER_addr");
        Addressdto useraddr;
        ResultSet resultSet = pstmt.executeQuery();
        while (resultSet.next()){
            useraddr = new Addressdto(
                    resultSet.getInt(1),
                    resultSet.getInt(2),
                    resultSet.getString(3),
                    resultSet.getString(4),
                    resultSet.getString(5),                    
                    resultSet.getString(6),
                    resultSet.getString(7),
                    resultSet.getString(8)
            );
            System.out.println(useraddr);
            System.out.println("---------------");
        }
    }
    public void updateuserAddr(Addressdto useraddr, int user_id) throws SQLException {
        conn = new DBConn().getConn();

        PreparedStatement pstmt = conn.prepareStatement("update USER_addr set delivery_id = ?, user_id = ?,delivery_addr_name = ?, name = ?, phone_number = ? ,addr=?,addrs=?,delivery_request=? where user_id = ?");

        pstmt.setInt(1, useraddr.getdelivery_id());
        pstmt.setInt(2, useraddr.getuser_id());
        pstmt.setString(3, useraddr.getDelivery_addr_name());
        pstmt.setString(4, useraddr.getName());
        pstmt.setString(5, useraddr.getPhone_number());
        pstmt.setString(6, useraddr.getAddr());
        pstmt.setString(7, useraddr.getAddrs());
        pstmt.setString(8, useraddr.getDelivery_request());
        pstmt.setInt(9, user_id);
        int result = pstmt.executeUpdate();
        if (result > 0)
            System.out.println("update 성공");
        else
            System.out.println("update 실패");
    }
    public void deleteUserAddr(int id) throws SQLException {
        conn = new DBConn().getConn();

        PreparedStatement pstmt = conn.prepareStatement("delete from user_addr where user_id =?");
        pstmt.setInt(1, id);

        int result = pstmt.executeUpdate();
        if (result>0)
            System.out.println("Delete 성공");
        else
            System.out.println("Delete 실패");

    }
}
