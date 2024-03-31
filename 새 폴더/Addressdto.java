package domain.dto;

public class Addressdto {
	private int delivery_id;
	private int user_id;
	private String delivery_addr_name;
	private String name;
	private String phone_number;
	private String addr;
	private String addrs;
	private String delivery_request;
	
	public Addressdto() {
		// TODO Auto-generated constructor stub
	}
	


	public Addressdto(int delivery_id, int user_id,String name, String delivery_addr_name,String addr,String addrs,String phone_number,String delivery_request) {
		super();
		this.delivery_id = delivery_id;
		this.user_id = user_id;
		this.delivery_addr_name=delivery_addr_name;
		this.name = name;
		this.phone_number = phone_number;
		this.addr = addr;
		this.addrs = addrs;
		this.delivery_request=delivery_request;
	}

	public int getdelivery_id() {
		return delivery_id;
	}
	public void setdelivery_id(int delivery_id) {
		this.delivery_id=delivery_id;
		
	}
	public int getuser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getDelivery_addr_name() {
		return delivery_addr_name;
		
	}
	public void setdelivery_addr_name(String delivery_addr_name) {
		this.delivery_addr_name=delivery_addr_name;
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

	public String getAddr() {
		return addr;
	}

	public void setEmail(String addr) {
		this.addr = addr;
	}

	public String getAddrs() {
		return addrs;
	}

	public void setAddrs(String addrs) {
		this.addrs = addrs;
	}
	public String  getDelivery_request() {
		return delivery_request;
	}
	public void setdelivery_request(String delivery_request) {
		this.delivery_request=delivery_request;
	}
	
	

	@Override
	public String toString() {
		return "Address [delivery_id=" + delivery_id + ", user_id=" + user_id + ", delivery_addr_name="
				+ delivery_addr_name + ", name=" + name + ", phone_number=" + phone_number + ", addr=" + addr
				+ ", addrs=" + addrs + ", delivery_request=" + delivery_request + "]";
	}
}
