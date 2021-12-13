package Testing_Assignment_2;

import java.util.Scanner;

public class test {

	public static void main(String[] args) {
//		System.out.println("--Question 16 - Q.15--\n");
//		int i = 0;
//		while (i <= 20) {
//			if (i % 2 == 0) {
//				System.out.println("số :" + (i));
//			}
//			i++;
//		}

	Scanner scanner = new Scanner(System.in);
	
	
	System.out.println("--------Question 1--------");
	// viet lenh cho ng dung nhap vao 1 so nguyen , neu ng dung nhap khong phai so nguyen, yeu cau nhap lai
//	boolean isCorrect = false;
	System.out.println("Moi nhap vao so dau tien");
	while(true) {
		boolean shn = scanner.hasNextInt();
		String i = scanner.next();
		if(shn) {
			System.out.println("So dau tien la: " + i);
			break;
		}else {
			System.out.println("Nhap sai, yeu cau nhap lai");
		}
	}
	System.out.println("");
	System.out.println("Moi nhap vao so thu hai");
	while(true) {
		boolean shn = scanner.hasNextInt();
		String i = scanner.next();
		if(shn) {
			System.out.println("So thu hai la: " + i);
			break;
		}else {
			System.out.println("Nhap sai, yeu cau nhap lai");
		}
	}
	
			

	
	} 
}


