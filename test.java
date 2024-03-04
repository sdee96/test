package ch99;

class Buyer // 구매자 클래스 생성
{
	private int myMoney;  //보유금액 속성 추가         // -(private) +(public)
	private int appleCnt; //사과개수 속성 추가
	Buyer(int money,int cnt)//구매자가 받는 인자로 금액, 개수 
	{
		this.myMoney =money;
		this.appleCnt = cnt;
	}
	public void pay(Seller seller,int money) {
		myMoney-=money;// 보유금액 속성에서 판매자에게 지불할 금액만큼 차감
		int cnt = seller.receive(money);// 판매자에게 지불금액 전달
		appleCnt+=cnt;// 구매한 사과개수 만큼 보유 사과개수에 추가
		//
		//
			
	};
	void showinfo() {
		System.out.println("보유금액 : "+ myMoney); //구매자 클래스 안의 생성자임으로 this 생략 가능
		System.out.println("사과개수 : "+ appleCnt);//   "  "  " " " 
		
	};
	
}
class Seller // 판매자 클래스 생성
{
	private int myMoney; //보유금액 속성 추가
	private int appleCnt; //보유 사과개수 속성 추가
	public  int price;		//사과 각 1개당 가격 속성 추가
	Seller(int money, int cnt, int price) // 판매자가 받는 인자로 지불금액,사과개수,사과 각1개당 가격 
	{
		this.myMoney = money;
		this.appleCnt =cnt;
		this.price = price;
	}
	
	public int  receive(int money) {
		myMoney+=money;// 구매자로부터 받은 금액 보유금액으로 합산
		int cnt=money/price; //구매자가 지불한 금액만큼의 사과를 전달하기 위해 인자로 받은 금액으로 부터 사과 1개당 가격으로 나눔
		appleCnt-=cnt;// 구매자로부터 요청받은 사과개수만큼 보유 사과에서 차감
		return cnt;// 구매자의 pay함수로 값 반환
		//
		
	
		
	};
	void showinfo(){
		System.out.println("보유금액 : " + myMoney);
		System.out.println("사과개수 : " + appleCnt);
		System.out.println("개당가격 : " + price);
	};
	
	
	
}

public class test {
	
	public static void main(String[] args) {
		Seller seller01 = new Seller(100000,100,1000);//보유금액 , 사과개수, 사과 각1개당 가격
		Buyer buyer01 = new Buyer(10000,0); // 구매자1 보유금액 1만
		Buyer buyer02 = new Buyer(20000,0); // 구매자2 보유금액 2만
		Buyer buyer03 = new Buyer(30000,0); // 구매자3 보유금액 3만
		 
		
		buyer01.pay(seller01,2000); // 구매자1 2000만큼 사과 구매
		buyer02.pay(seller01,5000); // 구매자2 5000만큼 사과 구매
		buyer03.pay(seller01,3000); // 구매자3 3000만큼 사과 구매
		System.out.println("--판매자 정보--");
		seller01.showinfo();
		System.out.println("--구매자 정보--");
		System.out.println("--구매자1--");  
		buyer01.showinfo(); 
		System.out.println("--구매자2--");
		buyer02.showinfo();
		System.out.println("--구매자3--");		
		buyer03.showinfo();
		
		
		
		
		
	}

}
