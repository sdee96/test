package ch99;

import java.util.Scanner;

public class test2 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int n=sc.nextInt();		//높이 > 입력받은 값을 높이로 받기 위해 scanner 사용
		int i=0;	//행
		int j=0;	//공백
		int k=0;	//별표
		
		while(i<n)
		{
			//공백
			j=0;
			while(j<=(n-2)-i)
			{
				System.out.print(" ");
				j++;
			}		
			//별
			k=0;
			while(k<=2*i)
			{
				System.out.print("*");
				k++;
			}
			System.out.println();
			i++;
		}		
		

	}

}
