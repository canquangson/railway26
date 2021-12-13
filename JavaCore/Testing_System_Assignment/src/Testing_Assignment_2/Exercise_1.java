package Testing_Assignment_2;

import java.time.LocalDate;

import Testing_Assignment_1.Account;
import Testing_Assignment_1.Department;
import Testing_Assignment_1.Group;
import Testing_Assignment_1.PosEnum;
import Testing_Assignment_1.Position;

public class Exercise_1 {

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

		// [IF]

		// * Question 1:Kiểm tra account thứ 2

//		System.out.println("---Question 1 : Kiem tra Account 2---");
//		
//		if(acc2.department == null) {
//			System.out.println("Nhân viên này chưa có phòng ");
//		}else {
//			System.out.println("Phòng ban của nhân viên này là:" + acc2.department.name);
//		}

		// * Question 2:Kiểm tra account thứ 2

//		System.out.println("---Question2--- \n");
//
//		if (acc2.groups == null) {
//			System.out.println("Nhân viên này chưa có Group");
//		} else {
//			int countGroup = acc2.groups.length;
//			if (countGroup == 1 || countGroup == 2) {
//				System.out.println("Group của nhân viên này là:" + acc2.groups);
//			}
//			if (countGroup == 3) {
//				System.out.println("Nhân viên này là người quan trọng, tham gia nhiều ");
//			}
//			if (countGroup == 5) {
//				System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả ");
//			}
//		}

//		// *Question 3: Sử dụng toán tử ternary để làm Question 1
//		System.out.println("---Question3--- \n");
//		System.out.println(acc2.department == null ? "Nhân viên này chưa có phòng" : "Phòng ban của nhân viên này là:" + acc2.department.name);

		// *Question 4:
//		System.out.println("---Question4--- \n");
//		
//		System.out.println(acc1.position.positionName.toString() == "Dev" ? "Đây là Dev" : "Người này không phải là " );

		// [SWITCH CASE]:

		// * Question 5:
//		System.out.println("-- số lượng account trong Group 1  --  \n");
//		
//		int countAccGr = gr1.accounts.length;
//		switch(countAccGr) {
//		case 0:
//			System.out.println("Group không có thành viên nào");
//		break;
//		case 1:
//			System.out.println("Group có 1 thành viên ");
//		break;
//		case 2:
//			System.out.println("Group có 2 thành viên ");
//		break;
//		case 3:
//			System.out.println("Group có 3 thành viên ");
//		break;
//		default:
//			System.out.println("Group có nhiều thành viên");
//			break;
//		}

		// * Question 6: Sử dụng switch case để làm lại Question 2

//		if (acc2.groups == null) {
//			System.out.println("Nhân viên này chưa có Group");
//		} else {
//			int countAcc2InGr = acc2.groups.length;
//			switch (countAcc2InGr) {
//			case 2:
//				System.out.println("Group của nhân viên này : Alpha & Beta ");
//				break;
//			case 3:
//				System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
//				break;
//			default:
//				System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
//				break;
//			}
//		}

		// * Question 7: Sử dụng switch case để làm lại Question 4
//		System.out.println("---Question7--- \n");
//		String posName = acc1.position.positionName.toString();
//
//		switch (posName) {
//
//		case "Dev":
//			System.out.println("Đây là Dev");
//			break;
//		default:
//			System.out.println("Người này không phải là  ");
//			break;
//
//		}
//		

		// [FOREACH]:
		// * Question 8:In ra thông tin các account bao gồm: Email, FullName và tên
		// phòng ban của họ
//		System.out.println("--Question 8--\n");
//		
//		Account[] accArray = {acc1, acc2, acc3, acc4, acc5};
//		for (Account acc : accArray) {
//			
//			System.out.println("accountID : " + acc.id + "  email : " + acc.email + "   fullname : " + acc.fullName + "   Department : " + acc.department.name);
//		}

		// * Question 9: In ra thông tin các phòng ban bao gồm: id và name
//		System.out.println("--Question 9--\n");
//		
//		Department [] depArray = {dep1, dep2, dep3, dep4, dep5};
//		for (Department dep : depArray) {
//			System.out.println("Department ID : " + dep.id + "\n" +"Department Name" + dep.name);
//		}

		// [FOR]:
		// * Question 10:
//		System.out.println("--Question 10--\n");
//		
//		Account[] accArray = {acc1, acc2, acc3, acc4, acc5};
//		for(int i = 0; i < accArray.length; i++ ) {
//			System.out.println("Thông tin Account thứ " + (i+1)  + " là : \n");
//			
//			System.out.println("Email : " + accArray[i].email);
//			System.out.println("Full Name :" + accArray[i].fullName);
//			System.out.println("Department : " + accArray[i].department.name + "\n");
//		}

		// * Question 11:
//		System.out.println("--Question 11--\n");
//		Department [] depArray = {dep1, dep2, dep3, dep4, dep5};
//		for(int i = 0; i < depArray.length; i++ ) {
//			System.out.println("Thông tin Department thứ " + (i+1)  + " là : \n");
//			
//			System.out.println("Department ID :" + depArray[i].id);
//			System.out.println("Department Name :" + depArray[i].name + "\n" );

//		}

		// * Question 12: Chỉ in ra thông tin 2 department đầu tiên theo định dạng như
		// Question 10
//			System.out.println("--Question 12--\n");
//			Department [] depArray = {dep1, dep2, dep3, dep4, dep5};
//			for(int i = 0; i <2; i++ ) {
//				System.out.println("Thông tin Department thứ " + (i+1)  + " là : \n");
//				
//				System.out.println("Department ID :" + depArray[i].id);
//				System.out.println("Department Name :" + depArray[i].name + "\n" );
//				
//			}

		// * Question 13: In ra thông tin tất cả các account ngoại trừ account thứ 2
//		System.out.println("--Question 13--\n");
//		Account[] accArray2 = { acc1, acc2, acc3, acc4, acc5 };
//		for (int i = 0; i < accArray2.length; i++) {
//			if (i != 1) {
//				System.out.println("Thông tin Account thứ " + (i + 1) + " là : \n");
//
//				System.out.println("Email : " + accArray2[i].email);
//				System.out.println("Full Name :" + accArray2[i].fullName);
//				System.out.println("Department : " + accArray2[i].department.name + "\n");
//			}
//		}

		// * Question 14: In ra thông tin tất cả các account có id < 4
//		System.out.println("--Question 14--\n");
//		Account[] accArray3 = { acc1, acc2, acc3, acc4, acc5 };
//		for (int i = 0; i < accArray3.length; i++) {
//			if (accArray3[i].id < 4) {
//				System.out.println("Thông tin Account thứ " + (i + 1) + " là : \n");
//				System.out.println("ID : " + accArray3[i].id);
//				System.out.println("Email : " + accArray3[i].email);
//				System.out.println("Full Name :" + accArray3[i].fullName);
//				System.out.println("Department : " + accArray3[i].department.name + "\n");
//			}
//
//		}

//		// * Question 15: In ra các số chẵn nhỏ hơn hoặc bằng 20
//		System.out.println("--Question 15--\n");
//		for (int i = 0; i <= 20; i++) {
//			if (i % 2 == 0) {
//				System.out.println("số :" + (i));
//			}
//
//		}

		// [WHILE]:
		// * Question 16: Làm lại các Question ở phần FOR bằng cách sử dụng WHILE kết
		// hợp với lệnh break, continue
//		System.out.println("--Question 16--\n");
		// 16 - Question 10 (FOR):
//			System.out.println("--Question 16- Q.10--\n");
//			
//			Account[] accArray = {acc1, acc2, acc3, acc4, acc5};
//			int i = 0;
//			while( i < accArray.length ) {
//				System.out.println("Thông tin Account thứ " + (i+1)  + " là : \n");
//				
//				System.out.println("Email : " + accArray[i].email);
//				System.out.println("Full Name :" + accArray[i].fullName);
//				System.out.println("Department : " + accArray[i].department.name + "\n");
//				i++;	
//			}

		// 16 - Question 11(FOR) :
//			System.out.println("--Question 16- Q.11--\n");
//			Department [] depArray = {dep1, dep2, dep3, dep4, dep5};
//			int i = 0; 
//			while(i < depArray.length ) {
//				System.out.println("Thông tin Department thứ " + (i+1)  + " là : \n");
//				
//				System.out.println("Department ID :" + depArray[i].id);
//				System.out.println("Department Name :" + depArray[i].name + "\n" );
//				i++;
//			}

		// 16 - Question 12 (FOR):
//			System.out.println("--Question 16- Q.12--\n");
//			Department [] depArray = {dep1, dep2, dep3, dep4, dep5};
//			int i = 0;
//			while( i <2 ) {
//				System.out.println("Thông tin Department thứ " + (i+1)  + " là : \n");
//				
//				System.out.println("Department ID :" + depArray[i].id);
//				System.out.println("Department Name :" + depArray[i].name + "\n" );
//				i++;
//			}

		// 16 - Question 13(FOR) :
//		System.out.println("--Question 16 - Q.13 --\n");
//		Account[] accArray2 = { acc1, acc2, acc3, acc4, acc5 };
//		int i = 0;
//		while (i < accArray2.length) {
//			if (i != 1) {
//				System.out.println("Thông tin Account thứ " + (i + 1) + " là : \n");
//
//				System.out.println("Email : " + accArray2[i].email);
//				System.out.println("Full Name :" + accArray2[i].fullName);
//				System.out.println("Department : " + accArray2[i].department.name + "\n");
//			}
//			i++;
//		}

		// 16 - Question 14(FOR) :
//		System.out.println("--Question 16 - Q.14--\n");
//		Account[] accArray3 = { acc1, acc2, acc3, acc4, acc5 };
//		int i = 0;
//		while (i < accArray3.length) {
//			if (accArray3[i].id < 4) {
//				System.out.println("Thông tin Account thứ " + (i + 1) + " là : \n");
//				System.out.println("ID : " + accArray3[i].id);
//				System.out.println("Email : " + accArray3[i].email);
//				System.out.println("Full Name :" + accArray3[i].fullName);
//				System.out.println("Department : " + accArray3[i].department.name + "\n");
//			}
//			i++;
//		}

		// 16 - Question 15(FOR) :
//		System.out.println("--Question 16 - Q.15--\n");
//		int i = 0;
//		while (i <= 20) {
//			if (i % 2 == 0) {
//				System.out.println("số :" + (i));
//			}
//			i++;
//		}

		// [ DO-WHILE]:
		// * Question 17: Làm lại các Question ở phần FOR bằng cách sử dụng DO-WHILE kết
		// hợp với lệnh break, continue
//		System.out.println("--Question 17--\n");
		// 17 - Question 10(FOR) :
//		System.out.println("--Question 17- Q.10--\n");
//		Account[] accArray = { acc1, acc2, acc3, acc4, acc5 };
//		int i = 0;
//		do {
//			System.out.println("Thông tin Account thứ " + (i + 1) + " là : \n");
//
//			System.out.println("Email : " + accArray[i].email);
//			System.out.println("Full Name :" + accArray[i].fullName);
//			System.out.println("Department : " + accArray[i].department.name + "\n");
//			i++;
//		} while (i < accArray.length);

		// 17 - Question 11(FOR) :
//		System.out.println("--Question 17- Q.11--\n");
//		Department [] depArray = {dep1, dep2, dep3, dep4, dep5};
//		int i = 0; 
//		do {
//			System.out.println("Thông tin Department thứ " + (i+1)  + " là : \n");
//			
//			System.out.println("Department ID :" + depArray[i].id);
//			System.out.println("Department Name :" + depArray[i].name + "\n" );
//			i++;
//		}while(i < depArray.length ) ;

		// 17 - Question 12(FOR) :
//		System.out.println("--Question 17 - Q.12--\n");
//		Department [] depArray = {dep1, dep2, dep3, dep4, dep5};
//		int i = 0;
//		 do {
//			System.out.println("Thông tin Department thứ " + (i+1)  + " là : \n");
//			
//			System.out.println("Department ID :" + depArray[i].id);
//			System.out.println("Department Name :" + depArray[i].name + "\n" );
//			i++;
//		}while( i <2 );

		// 17 - Question 13(FOR) :
//		System.out.println("--Question 17 - Q.13 --\n");
//		Account[] accArray2 = { acc1, acc2, acc3, acc4, acc5 };
//		int i = 0;
//		do {
//			if (i != 1) {
//				System.out.println("Thông tin Account thứ " + (i + 1) + " là : \n");
//
//				System.out.println("Email : " + accArray2[i].email);
//				System.out.println("Full Name :" + accArray2[i].fullName);
//				System.out.println("Department : " + accArray2[i].department.name + "\n");
//			}
//			i++;
//		} while (i < accArray2.length);

		// 17 - Question 14(FOR) :
//		System.out.println("--Question 17 - Q.14--\n");
//		Account[] accArray3 = { acc1, acc2, acc3, acc4, acc5 };
//		int i = 0;
//		 do {
//			if (accArray3[i].id < 4) {
//				System.out.println("Thông tin Account thứ " + (i + 1) + " là : \n");
//				System.out.println("ID : " + accArray3[i].id);
//				System.out.println("Email : " + accArray3[i].email);
//				System.out.println("Full Name :" + accArray3[i].fullName);
//				System.out.println("Department : " + accArray3[i].department.name + "\n");
//			}
//			i++;
//		}while (i < accArray3.length);
		
		// 17 - Question 15(FOR) :
//		System.out.println("--Question 17 - Q.15--\n");
//		int i = 0;
//		 do{
//			if (i % 2 == 0) {
//				System.out.println("số :" + (i));
//			}
//			i++;
//		}while (i <= 20);
		 
		 
	}
}
