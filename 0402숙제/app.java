import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import domain.service.UserServiceImpl;



public class app {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		String str_date = "2024-04-02";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date =formatter.parse(str_date);
		
//		itemDao dao = new itemDao();

//		dao.Insert(new itemDto(1111,1111,"로지텍마우스","전자제품",3000,1,date));
//		dao.Insert(new itemDto(2222,1111,"abko마우스","전자제품",3000,1,date));
//		dao.delete(1111);
//		dao.update(new itemDto(1111,2222,"삼성마우스","컴퓨터주변기기",4000,2,date));
//		List<itemDto> list = dao.selectAll();
//		list.forEach(dto->{
//		System.out.println(dto);
//		});
//		itemDto dto=dao.select(1111);
//		System.out.println(dto);
		
//		UserDaoImpl dao = new UserDaoImpl();
//		dao.Insert(new UserDto(1111,"1234","하상훈","1234","1234@com","회원"));
//		dao.Insert(new UserDto(2222,"2222","하상훈","1234","1234@com","회원"));
//		dao.Delete(1111);
		
//		dao.SelectAll();
//		UserDto dto = dao.Select("하상훈");
		
//		System.out.println(dto);
//		dao.update(new UserDto(1111,"2222","하상훈하","1234","4321@com","회원"));
		UserServiceImpl service = new UserServiceImpl();
		//로그인 실패 : 계정이 존재하지 않는 경우
		Map<String,Object> islogin1= service.login("user5","1234", 0);
		System.out.println("islogin1 : " + islogin1);
		// 로그인 실패 : 계정은 존재하지만 패스워드 틀린 경우
		Map<String,Object>  islogin2= service.login("user2","1235", 0);
		System.out.println("islogin2 : " + islogin2);
		//로그인성공 : 계정은 존재하지만 패스워드 불일치한 경우
		Map<String,Object>  islogin3= service.login("user2","1234", 0);
		System.out.println("islogin3 : " + islogin3);
		Integer mySessionId = (Integer)islogin3.get("sessionId");
		// 로그인 실퍠 : 기존 로그인 된 계정이 존재하는 경우
		Map<String,Object>  islogin4= service.login("user2","1234", mySessionId);
		System.out.println("islogin4 : " + islogin4);
	}
}

	
	
	