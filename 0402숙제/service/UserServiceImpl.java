package domain.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import domain.dao.SessionDaoImpl;
import domain.dao.UserDaoImpl;
import domain.dto.SessionDto;
import domain.dto.UserDto;

public class UserServiceImpl {
	
	private List<Integer> SessionIdList;
	private BCryptPasswordEncoder bCtryptPasswordEncoder;
	private UserDaoImpl userDao;
	private SessionDaoImpl sessionDao;
	
	public UserServiceImpl() throws Exception{
		System.out.println("UserServiceImpl's UserServiceImpl()");
		bCtryptPasswordEncoder = new BCryptPasswordEncoder();
		
		userDao = new UserDaoImpl();
		sessionDao = new SessionDaoImpl();
		SessionIdList=new ArrayList();
	}
	//회원가입
	public boolean UserJoin(UserDto dto) throws Exception{
		String encrypt = bCtryptPasswordEncoder.encode(dto.getPassword());
		dto.setPassword(encrypt);
		
		return userDao.Insert(dto);
	}
	//로그인
	
	public Map<String,Object> login(String username,String password,int SessionId) throws Exception{
		Map<String,Object> result = new HashMap();
		
		//1세션 리스트에 동일한 세션정보 있는가 확인
		for(int id:SessionIdList) {
			if(SessionId==id) {
				result.put("response", false);
				result.put("msg", "해당 계정은 로그인 된 상태입니다");
				return result;
			}
		}
		
		//2 로그인 한게 아니라면 user테이블로부터 동일한 이름 user 정보 가져오기(존재하는 아이디 인지 구별)(get User())
		UserDto savedUser = getUser(username);
		if(savedUser==null) {
			result.put("response",false);
			result.put("msg","계정이 존재하지 않습니다");
			return result;
		}
		//3 pw 일치여부 확인
		if(!bCtryptPasswordEncoder.matches(password, savedUser.getPassword())) {
			result.put("response", false);
			result.put("msg", "password가 일치하지않음");
			return result;
		}
		//4pw 일치하다면 session 테이블에 세션정보 저장
		SessionDto sessionDto = new SessionDto();
		sessionDto.setusersname(savedUser.getName());
		sessionDto.setRole(savedUser.getMember());
		boolean isSessionSaved=sessionDao.Insert(sessionDto);
		if(!isSessionSaved) {
			result.put("response", false);
			result.put("msg", "로그인 처리 중 오류 발생");
			return result;
		}
		//5 pw일치한다면 sessionList에 sessionId값 저장
		Integer id = sessionDao.Select(sessionDto.getusersname()).getSessionId();
		result.put("response", true);
		result.put("msg", "로그인 성공!");
		result.put("sessionId", id);
		return result;
		
	}
	//로그아웃
	public boolean logout(int SessionId) {
		return false;
	}
	
	//유저정보 따오기
	private UserDto getUser(String username)throws Exception {
		// TODO Auto-generated method stub
		return userDao.Select(username);
	}
	//현재 접속중인 세션 id list 리턴
	public List<Integer> getSessionIdList(){
		return SessionIdList;
	}
 
}
