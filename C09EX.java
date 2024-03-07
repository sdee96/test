package Ch09;

class Profile{
	String name;
	String addr;
	String job;
	String major;
	
	//생성자
	Profile(){
		
	}
	
	
public Profile(String name, String addr, String job, String major) {
		super();
		this.name = name;
		this.addr = addr;
		this.job = job;
		this.major = major;
	}



	Profile(String ...arg){
		
		
		
		String[] StrList = arg[0].split(",");  //배열 , 기준 split
		name = StrList[0];
		addr = StrList[1];
		job = StrList[2];
		major = StrList[3];
				
		
		
		
	}
	
	
	
	
		
		
		
	



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	@Override
	public String toString() {
		return "Profile [name=" + name + ", addr=" + addr + ", job=" + job + ", major=" + major + "]";
	}
	
	
	boolean isContain(String findstr) {
		findstr=findstr.trim();
		
		if(this.name.contains(findstr)) {
			return true;
		}else if(this.addr.contains(findstr)) {
			return true;
		}else if(this.job.contains(findstr)) {
			return true;
		}else if(this.major.contains(findstr)) {
			return true;
		}else			
		return false;
		
		
	}
	boolean isEquals(String str) {
		
		String[] equallist = str.split(",");
		if(name.equals(equallist[0]) && addr.equals(equallist[1]) && this.job.equals(equallist[2]) && this.major.equals(equallist[3])) {
			return true;
		}
	
		
		return false;
		
		
		
	}
	
	
	
}

public class C09EX {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Profile hong = new Profile("홍길동,대구,프로그래머,컴퓨터공학");
		System.out.println(hong.toString());
		System.out.println("길동 포함여부 : " + hong.isContain("길동"));
		System.out.println("컴퓨터 포함여부 :" + hong.isContain("컴퓨터"));
		
		System.out.println("프로필 일치여부 :" + hong.isEquals("홍길동,대구,프로그래머,컴퓨터공학"));
		System.out.println("프로필 일치여부 :" + hong.isEquals("홍길동,울산,프로그래머,컴퓨터공학"));
	}
	

}
