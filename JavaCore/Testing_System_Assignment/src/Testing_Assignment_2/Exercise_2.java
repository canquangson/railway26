package Testing_Assignment_2;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import Testing_Assignment_1.Account;
import Testing_Assignment_1.Department;
import Testing_Assignment_1.Group;
import Testing_Assignment_1.PosEnum;
import Testing_Assignment_1.Position;

public class Exercise_2 {
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

		// Khoi tao thông tin Account:

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
		Group[] grAcc2 = { gr1, gr2 };
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
		Group[] grAcc5 = { gr1, gr2, gr3, gr5 };
		acc1.groups = grAcc5;

		// them Group Account:

		gr1.accounts = new Account[] { acc1, acc3, acc4 };
		gr2.accounts = new Account[] { acc3 };
		gr3.accounts = new Account[] { acc4 };
		gr4.accounts = new Account[] { acc2 };
		
		
		
		
//		System.out.println("Question 1:\n"
//				+ "Khai báo 1 số nguyên = 5 và sử dụng lệnh System out printf để in ra số\n"
//				+ "nguyên đó \n");
//		int i1 = 5;
//		System.out.printf("Số nguyên =  %d" , i1);
		
		
//		System.out.println("Question 2:\n"
//				+ "Khai báo 1 số nguyên = 100 000 000 và sử dụng lệnh System out printf để in\n"
//				+ "ra số nguyên đó thành định dạng như sau: 100,000,000 \n ");
//		
//		int i2 = 1000000000;
//		System.out.printf("Số nguyên =  %,d" , i2);
		
//		System.out.println("Question 3:\n"
//				+ "Khai báo 1 số thực = 5,567098 và sử dụng lệnh System out printf để in ra số\n"
//				+ "thực đó chỉ bao gồm 4 số đằng sau \n");
//		float i3 = (float) 5.567098;
//		System.out.printf("Số thực : %5.4f%n", i3);
		
//		System.out.println("Question 4:\n"
//				+ "Khai báo Họ và tên của 1 học sinh và in ra họ và tên học sinh đó theo định\n"
//				+ "dạng như sau:\n"
//				+ "Họ và tên: \"Nguyễn Văn A\" thì sẽ in ra trên console như sau:\n"
//				+ "Tên tôi là \"Nguyễn Văn A\" và tôi đang độc thân.\n");
//		
//		String name = new String("Nguyễn Văn A");
//		String doing = new String("tôi đang độc thân");
//		System.out.printf("Tên tôi là : %s, %s",name,doing);
		
		
//		System.out.println("Question 5:\n"
//				+ "Lấy thời gian bây giờ và in ra theo định dạng sau:\n"
//				+ "24/04/2020 11h:16p:20s \n");
//		
//		String pattern = "dd/MM/yyyy HH'h':mm'p':ss's'";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//		String date = simpleDateFormat.format(new java.util.Date());
//		System.out.println(date);
		
//		System.out.println("Question 6:\n"
//				+ "In ra thông tin account (như Question 8 phần FOREACH) theo định dạng\n"
//				+ "table (giống trong Database)\n");
//		
//		Account[] accArray = {acc1, acc2, acc3, acc4, acc5};
//		System.out.printf("|%15s|%20s|%20s|%20s|\n" , "accountID"  ,"Email", "FullName" , "Department" , "\n","\n");
//		for (Account acc : accArray) {
//			
//			System.out.printf("|%15s|%20s|%20s|%20s|\n" ,  acc.id , acc.email,acc.fullName, acc.department.name, "\n" );
//			
//		}
		
		
	}

}
