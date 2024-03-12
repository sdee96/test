package Ch13Ex;

import java.util.Scanner;
abstract class Converter{
	abstract protected double convert(double src);//추상메서드
	abstract protected String getSrcString(); // 추상메서드
	abstract protected String getDestString(); // 추상메서드
	protected double ratio;//비율
	
	public void run() {
		Scanner sc = new Scanner(System.in);
		System.out.println(getSrcString()+"dmf"+getDestString()+"로 바꿈");
		System.out.println(getDestString()+"을 입력하라");
		double vol = sc.nextDouble();
		double res = convert(vol);
		System.out.println("변환 결과  " + res+getDestString()+"입니다");
	}
	class Won2Dollor extends Converter {
		public Won2Dollor(double ratio) {this.ratio=ratio;}
		protected double convert(double src) {return src/ratio;}
		protected String getSrcString() {return }
		
		
	}
}

public class C00EX0503 {

	public static void main(String[] args) {
		

	}

}
