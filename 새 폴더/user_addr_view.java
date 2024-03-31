package domain.view;

import java.sql.SQLException;

import java.util.Scanner;



import domain.dao.Useraddress_dao;
import domain.dto.Addressdto;


public class user_addr_view {

    public static void main(String[] args) throws SQLException {
        @SuppressWarnings("resource")
        Useraddress_dao useraddr = new Useraddress_dao();
        Scanner sc = new Scanner(System.in);
      
        int delivery_id;
        int user_id;
        String delivery_addr_name,name,phone_number,addr,
        addrs,delivery_request;              
        int select;
        
        while (true) {
            System.out.println("1을 입력하시면 배송지 신규등록을 합니다.");
            System.out.println("2를 입력하시면 배송지 조회를 합니다.");
            System.out.println("3을 입력하시면 배송지 업데이트를 합니다.");
            System.out.println("4를 입력하시면 배송지 삭제를 합니다.");
            System.out.println("-1을 입력하시면 종료를 합니다.");
            select = sc.nextInt();
            if (select == -1) break;
            if (select == 1) {
                while (true) {
                    System.out.print("(-1 이전페이지): ");
                    System.out.println("delivery_ID: ");
                    delivery_id = sc.nextInt();
                    if (delivery_id == -1) break;
                    System.out.print("User_id: ");
                    user_id = sc.nextInt();
                    System.out.println("delivery_addr_name :");
                    delivery_addr_name = sc.next();
                    System.out.print("name: ");
                    name = sc.next();
                    System.out.println("phone:");
                    phone_number=sc.next();
                    System.out.print("addr(주소): ");
                    addr = sc.next();
                    System.out.print("addrs(상세주소): ");
                    addrs= sc.next();
                    System.out.print("delivery_request(요청사항): ");
                    delivery_request = sc.next();

                    useraddr.insertUseraddr(new Addressdto(delivery_id, user_id, pw, name, phone, email, "USER", email));
                }
            }
            if (select == 2) {
                useraddr.selectUser_addr();
            }
            if (select == 3) {
                while (true) {
                    System.out.print("(-1 이전페이지): ");
                    System.out.println("수정될 ID를 입력하세요: ");
                    user_id = sc.nextInt();
                    if (user_id == -1) break;
                    System.out.println("수정 할 ID: ");
                    id = sc.nextInt();
                    System.out.print("수정 할 PW: ");
                    pw = sc.next();
                    System.out.print("수정 할 name: ");
                    name = sc.next();
                    System.out.print("수정 할 phone: ");
                    phone = sc.next();
                    System.out.print("수정 할 email: ");
                    email = sc.next();


                    System.out.println();
                    Useraddress_dao useraddrUpdate = new Useraddress_dao();
                    User2 user = new User2(id, pw, name, phone, email, "USER");
                    userUpdate.updateUser(user, user_id);
                }
            }
            if (select == 4) {
                while (true) {
                    System.out.print("(-1 이전페이지): ");
                    System.out.println("삭제 할 ID: ");
                    id = sc.nextInt();
                    if (id == -1) break;

                    UserDao userDelete = new UserDao();
                    userDelete.deleteUser(id);
                }
            }
        }
    }
}