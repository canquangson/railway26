package Testing_Assignment_2;

import java.time.LocalDate;

import Testing_Assignment_1.Account;
import Testing_Assignment_1.Group;

public class test2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Account acc1 = new Account();
		acc1.id = 1;
		acc1.email = "an@gmail.com";
		acc1.userName = "an1";
		acc1.fullName = "Nguyen Van An";
		
		acc1.hangOutWithFriend();
		
	}

}
