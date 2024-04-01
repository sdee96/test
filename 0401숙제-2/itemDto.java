package domain.dto;


import java.util.Date;

public class itemDto {
	int item_id;
	int BussinessMan_id;
	String item_name;
	String item_type;
	int item_price;
	int item_count;
	Date item_manufacturing_date;
	
	
	
	@Override
	public String toString() {
		return "itemDto [item_id=" + item_id + ", BussinessMan_id=" + BussinessMan_id + ", item_name=" + item_name
				+ ", item_type=" + item_type + ", item_price=" + item_price + ", item_count=" + item_count
				+ ", item_manufacturing_date=" + item_manufacturing_date + "]";
	}
	//getter setter
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getBussinessMan_id() {
		return BussinessMan_id;
	}
	public void setBussinessMan_id(int bussinessMan_id) {
		this.BussinessMan_id = bussinessMan_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public Date getItem_manufacturing_date() {
		return item_manufacturing_date;
	}
	public void setItem_manufacturing_date(Date item_manufacturing_date) {
		this.item_manufacturing_date = item_manufacturing_date;
	}
	
	public itemDto(){}
	public itemDto(int item_id, int bussinessMan_id, String item_name, String item_type, int item_price, int item_count,
			Date item_manufacturing_date) {
		super();
		this.item_id = item_id;
		BussinessMan_id = bussinessMan_id;
		this.item_name = item_name;
		this.item_type = item_type;
		this.item_price = item_price;
		this.item_count = item_count;
		this.item_manufacturing_date = item_manufacturing_date;
	}

	
	
	
	

}
