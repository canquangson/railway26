package Testing_Assignment_2;

import java.time.LocalDate;
import java.util.Scanner;

import Testing_Assignment_1.Account;
import Testing_Assignment_1.Department;
import Testing_Assignment_1.Exam;
import Testing_Assignment_1.Group;
import Testing_Assignment_1.PosEnum;
import Testing_Assignment_1.Position;

public class Exercise_5 {
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

		// Khoi tao thông tin Exam:

		Exam ex1 = new Exam();
		ex1.id = 1;
		ex1.code = "Jp_Test";
		ex1.title = "Japanese";
		ex1.createDate = LocalDate.of(2021, 02, 20);

		Exam ex2 = new Exam();
		ex2.id = 2;
		ex2.code = "Kor_Test";
		ex2.title = "Korea";
		ex2.createDate = LocalDate.of(2021, 04, 25);

		Exam ex3 = new Exam();
		ex3.id = 3;
		ex3.code = "Vie_Test";
		ex3.title = "Vietnamese";
		ex3.createDate = LocalDate.of(2021, 05, 10);

		Exam ex4 = new Exam();
		ex4.id = 4;
		ex4.code = "El_Test";
		ex4.title = "English";
		ex4.createDate = LocalDate.of(2021, 10, 26);

		Exam ex5 = new Exam();
		ex5.id = 5;
		ex5.code = "Ger_Test";
		ex5.title = "Germany";
		ex5.createDate = LocalDate.of(2021, 07, 10);

//		Scanner scanner = new Scanner(System.in);

//		Question1();
//		Question2();
//		Question3();
//		Question4();
//		Question5();
//		Quesion6();
//		Question7();
//		Quetion8();
		
	}

	public static void Question1() {    

		Scanner scanner = new Scanner(System.in);

		System.out.println("Question 1:\n" + "Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình\n");

		System.out.println("Bạn hãy nhập 3 số nguyên bất kỳ \n");

		while (true) {
			boolean sn = scanner.hasNextInt();
			String i = scanner.next();
			if (sn) {
				System.out.println("Nhập đúng, Số thứ nhất là : " + i);
				break;
			} else {
				System.out.println("Nhập sai, Vui lòng nhập lại ! ");
			}

		}

		while (true) {
			boolean sn = scanner.hasNextInt();
			String i2 = scanner.next();
			if (sn) {
				System.out.println("Nhập đúng, Số thứ hai là : " + i2);
				break;
			} else {
				System.out.println("Nhập sai, Vui lòng nhập lại ! ");
			}

		}

		while (true) {
			boolean sn = scanner.hasNextInt();
			String i3 = scanner.next();
			if (sn) {
				System.out.println("Nhập đúng, Số thứ ba là : " + i3);
				break;
			} else {
				System.out.println("Nhập sai, Vui lòng nhập lại ! ");
			}
			scanner.close();
		}
	}

	public static void Question2() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Question 2:\n" + "Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình \n");

		System.out.println("Bạn hãy nhập 2 số thực bất kỳ \n");

		while (true) {
			boolean sn = scanner.hasNextFloat();
			String a = scanner.next();
			if (sn) {
				System.out.println("Nhập đúng, Số thứ nhất là : " + a);
				break;
			} else {
				System.out.println("Nhập sai, Vui lòng nhập lại ! ");
			}

		}
		while (true) {
			boolean sn = scanner.hasNextFloat();
			String b = scanner.next();
			if (sn) {
				System.out.println("Nhập đúng, Số thứ hai là : " + b);
				break;
			} else {
				System.out.println("Nhập sai, Vui lòng nhập lại ! ");
			}
			scanner.close();
		}
	}

	public static void Question3() {

		Scanner scanner = new Scanner(System.in);
		System.out.println("Question 3:\n" + "Viết lệnh cho phép người dùng nhập họ và tên\n");

		System.out.println("Bạn hãy nhập họ và tên :\n");

		while (true) {
			boolean name = scanner.hasNextInt();
			String a = scanner.next();
			if (!name) {
				System.out.println("Nhập đúng, Họ là : " + a);
				break;
			} else {
				System.out.println("Nhập sai, Vui lòng nhập lại ! ");
			}
		}

		while (true) {
			boolean name = scanner.hasNextInt();
			String b = scanner.next();
			if (!name) {
				System.out.println("Nhập đúng, Tên là : " + b);
				break;
			} else {
				System.out.println("Nhập sai, Vui lòng nhập lại ! ");
			}
			scanner.close();
		}
	}

	public static void Question4() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Question 4:\n" + "Viết lệnh cho phép người dùng nhập vào ngày sinh nhật của họ\n");
		System.out.println("Bạn hãy nhập ngày sinh nhật của mình \n");

		System.out.println("Mời bạn nhập năm sinh của mình :");
		int year = scanner.nextInt();
		System.out.println("Mời bạn nhập tháng sinh của mình :");
		int month = scanner.nextInt();
		System.out.println("Mời bạn nhập ngày sinh của mình :");
		int day = scanner.nextInt();

		LocalDate SN = LocalDate.of(year, month, day);
		System.out.println("Ngày sinh nhật của bạn là : " + SN);
		scanner.close();
	}

	public static void Question5() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Question 5:\n" + "Viết lệnh cho phép người dùng tạo account (viết thành method)");

		System.out.println("Mời bạn nhập thông tin Account của mình \n");

		Account acc = new Account();
		System.out.println("Mời bạn nhập Account ID :");
		acc.id = scanner.nextInt();

		System.out.println("Mời bạn nhập Email :");
		acc.email = scanner.next();

		System.out.println("Mời bạn nhập User Name :");
		acc.userName = scanner.next();

		System.out.println("Mời bạn nhập Full Name :");
		acc.fullName = scanner.next();

		System.out.println("Thông tin Account bạn vừa nhập là : \n");
		System.out.printf("|%15s|%20s|%20s|%20s|\n", "Account ID", "Email", "User Name", "Full Name", "\n");
		System.out.printf("|%15s|%20s|%20s|%20s|\n", acc.id, acc.email, acc.userName, acc.fullName, "\n");

		scanner.close();
	}

	public static void Quesion6() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Question 6:\n" + "Viết lệnh cho phép người dùng tạo department (viết thành method) \n");
		System.out.println("Mời bạn nhập thông tin Department của mình \n");

		Department dep = new Department();

		System.out.println("Mời bạn nhập Department ID :");
		dep.id = scanner.nextInt();

		System.out.println("Mời bạn nhập Departmen Name :");
		dep.name = scanner.next();

		System.out.println("Thông tin Department bạn vừa nhập là : \n" + "DepartmentID : " + dep.id
				+ "\nDepartment Name :" + dep.name);

		System.out.printf("|%15s|%20s|\n", "DepartmentID", "DepartmenName", "\n");
		System.out.printf("|%15s|%20s|\n", dep.id, dep.name, "\n");
		
		scanner.close();
	}

	public static void Question7() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Question 7:\n" + "Nhập số chẵn từ console \n");

		System.out.println("Nhap so chan nha : \n");
		int i = scanner.nextInt();
		if (i % 2 == 0) {
			System.out.println("Nhap dung");
		} else {
			System.out.println("Nhap sai");
		}
		scanner.close();
	}

	public static void Quetion8() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("--- Question 8: Viết chương trình thực hiện theo flow sau: ----\n");

		System.out.println("Mời bạn nhập vào chức năng muốn sử dụng\n");

		boolean isCorrect = false;
		while (!isCorrect) {
			String i = scanner.next();
			switch (i) {
			case "1":
				Question5();
				isCorrect = true;
				break;

			case "2":
				Quesion6();
				isCorrect = true;
				break;
			default:
				System.out.println("Nhập sai ! Mời bạn nhập lại ");

			}

		}
		scanner.close();
	}
	
}