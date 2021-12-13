package Testing_Assignment_2;

import java.time.LocalDate;
import java.util.Scanner;

import Testing_Assignment_1.Account;
import Testing_Assignment_1.Department;
import Testing_Assignment_1.Group;
import Testing_Assignment_1.PosEnum;
import Testing_Assignment_1.Position;

public class Program2 {
	
	public static void main(String[] args) {
		

		// Khoi tao thong tin Department:

		Department dep1 = new Department();
		dep1.id = 1;
		dep1.name = "Sale";

		Department dep2 = new Department();
		dep2.id = 2;
		dep2.name = "Marketing";

		Department dep3 = new Department();
		dep3.id = 3;
		dep3.name = "Management";

		Department dep4 = new Department();
		dep4.id = 4;
		dep4.name = "Training";

		Department dep5 = new Department();
		dep5.id = 5;
		dep5.name = "CSKH";

		// Khoi tao thông tin Position:

		Position pos1 = new Position();
		pos1.id = 1;
		pos1.positionName = PosEnum.Dev;

		Position pos2 = new Position();
		pos2.id = 2;
		pos2.positionName = PosEnum.Test;

		Position pos3 = new Position();
		pos3.id = 3;
		pos3.positionName = PosEnum.Scrum_Master;

		Position pos4 = new Position();
		pos4.id = 4;
		pos4.positionName = PosEnum.PM;

		// Khoi tao thong tin Group:

		Group gr1 = new Group();
		gr1.id = 1;
		gr1.name = "Alpha";
		gr1.createDate = LocalDate.of(2021, 07, 20);

		Group gr2 = new Group();
		gr2.id = 2;
		gr2.name = "Beta";
		gr2.createDate = LocalDate.of(2021, 07, 10);

		Group gr3 = new Group();
		gr3.id = 3;
		gr3.name = "Gamma";
		gr3.createDate = LocalDate.of(2021, 10, 20);

		Group gr4 = new Group();
		gr4.id = 4;
		gr4.name = "Epsilon";
		gr4.createDate = LocalDate.of(2021, 07, 25);

		Group gr5 = new Group();
		gr5.id = 5;
		gr5.name = "Zeta";
		gr5.createDate = LocalDate.of(2021, 11, 20);
		
		
		
		
		//	Khoi tao thông tin Account:			

		Account acc1 = new Account();
		acc1.id = 1;
		acc1.email = "an@gmail.com";
		acc1.userName = "an1";
		acc1.fullName = "Nguyen Van An";
		acc1.department = dep1;
		acc1.position = pos1;
		acc1.createDate = LocalDate.of(2021, 10, 15);
		Group[] grAcc = { gr1, gr2, gr3, gr4, gr5 };
		acc1.groups = grAcc;

		Account acc2 = new Account();
		acc2.id = 2;
		acc2.email = "binh@gmail.com";
		acc2.userName = "binh2";
		acc2.fullName = "Duong Van Binh";
		acc2.department = dep3;
		acc2.position = pos2;
		acc2.createDate = LocalDate.of(2021, 10, 14);
		Group[] grAcc2 = { gr1, gr2, gr3, gr4, gr5 };
		acc2.groups = grAcc2;

		Account acc3 = new Account();
		acc3.id = 3;
		acc3.email = "Huy@gmail.com";
		acc3.userName = "Hue3";
		acc3.fullName = "Pham Thi Hue";
		acc3.department = dep4;
		acc3.position = pos3;
		acc3.createDate = LocalDate.of(2021, 11, 15);
		Group[] grAcc3 = { gr1, gr2, gr3, gr4, gr5 };
		acc3.groups = grAcc3;

		Account acc4 = new Account();
		acc4.id = 4;
		acc4.email = "Longn@gmail.com";
		acc4.userName = "Long4";
		acc4.fullName = "Do Thanh Long";
		acc4.department = dep2;
		acc4.position = pos4;
		acc4.createDate = LocalDate.of(2021, 10, 25);
		Group[] grAcc4 = { gr1, gr2, gr3, gr4, gr5 };
		acc1.groups = grAcc4;

		Account acc5 = new Account();
		acc5.id = 5;
		acc5.email = "Ha@gmail.com";
		acc5.userName = "Ha5";
		acc5.fullName = "Nguyen Thanh Ha";
		acc5.department = dep5;
		acc5.position = pos1;
		acc5.createDate = LocalDate.of(2021, 12, 05);
		Group[] grAcc5 = { gr1, gr2, gr3, gr4, gr5 };
		acc1.groups = grAcc5;

		// them Group Account:
				
		gr1.accounts = new Account[] {acc1};
		gr2.accounts = new Account[] {acc3};
		gr3.accounts = new Account[] {acc4};
		gr4.accounts = new Account[] {acc2};
		
		
		
		
		
	
//		System.out.println("--Q1--");
//		Random random = new Random();
//		int rd = random.nextInt();
//		System.out.println("Random Number :" + rd);
//		
//		rd = random.nextInt (20 - 10 +1) +10 ;
//		System.out.println("Random Number2 :" + rd);
//		
//		System.out.println("--Q2--");
//		
//		float fl = random.nextFloat();
//		System.out.println("Random Number :" + fl);
//		
//		System.out.println("--Q2+--");
//		double db = random.nextDouble();
//		System.out.println("Random Number :" + db);
//		
//		Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-	1995
	
//		System.out.println("--Q4--");
//		int minDay = (int) LocalDate.of(1995, 07, 24).toEpochDay();
//		int maxDay = (int) LocalDate.of(1995, 12, 20).toEpochDay();
//		
//		long randomInt = minDay + random.nextInt(maxDay - minDay);
//		
//		LocalDate randomDay = LocalDate.ofEpochDay(randomInt);
//		System.out.println(randomDay);
//		
////		Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây
//		System.out.println("--Q5--");
//		
//		int now = (int) LocalDate.now().toEpochDay();
//		long randomDate = now - random.nextInt(365);
//		
//		LocalDate randomDay2 = LocalDate.ofEpochDay(randomDate);
//		System.out.println(randomDay2);
//		
//		System.out.println("--Q7--");
//		int z = random.nextInt(999 - 100 + 1) + 100; // Công thức: (số max - số min + 1) + số min
//		System.out.println(z);
		
		// Question 4:
		
//		String name = new String("Nguyen Van A");
//		String doing = new String("toi dang an com");
//		System.out.printf("Ten toi la : %s, %s",name,doing);
//		
////		Question 5:
//		System.out.println("-------------Question 5:-------------");
//		String pattern = "dd/MM/yyyy HH'h':mm'p':ss's'";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//		String date = simpleDateFormat.format(new java.util.Date());
//		System.out.println(date);
//		
	 
//		Question 2:
//			Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình
		
//		System.out.println("-------------Question 2:-------------");
//		
//		Scanner scanner = new Scanner(System.in);
////		
//////			System.out.println("nhap du lieu 1:");
////			float st1 = scanner.nextFloat();
////			System.out.println("nhap du lieu 2 :");
////			float st2 = scanner.nextFloat();
////			System.out.println("Nhap 1 2:" + st1 + " " + st2);
//			
//			System.out.println("Question 7:Nhập số chẵn từ console-- \n");
//			
//			System.out.println("Nhap so chan nha :");		
//			int i = scanner.nextInt();
//			if (i % 2 == 0) {
//				System.out.println("Nhap dung");
//				return ;
//			}else {
//				System.out.println("Nhap sai");
//			}
//			
			
			
		
//		float st2 = scanner.next();
//		System.out.println("Nhap 2:" + st2 + "\n");
		
	}
}
