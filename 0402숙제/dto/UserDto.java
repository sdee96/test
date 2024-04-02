package domain.dto;

public class UserDto {
	private int user_id;
	private String password;
	private String name;
	private String phone_number;
	private String email;
	private String member;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}
	


	public UserDto(int user_id, String password, String name, String phone_number, String email, String member) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.name = name;
		this.phone_number = phone_number;
		this.email = email;
		this.member = member;
	}


	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "User2{" +
				"user_id=" + user_id +
				", password='" + password + '\'' +
				", name='" + name + '\'' +
				", phone_number='" + phone_number + '\'' +
				", email='" + email + '\'' +
				", member='" + member + '\'' +
				'}';
	}
}
