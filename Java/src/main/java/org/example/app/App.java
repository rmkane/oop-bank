package org.example.app;

import static org.example.app.model.AccountType.CHECKING;
import static org.example.app.model.AccountType.SAVINGS;

import java.util.NoSuchElementException;

import org.example.app.model.Bank;
import org.example.app.model.BankImpl;
import org.example.app.model.Customer;

public class App {
  public static void main(String[] args) {

    Bank bank = new BankImpl("1234567890", "First Bank");

    Customer customerA = bank.addCustomer("George Washington");
    Customer customerB = bank.addCustomer("Thomas Jefferson");

    try {
      bank.addAccount(customerA.getId(), 100.0, CHECKING);
      bank.addAccount(customerA.getId(), 1000.0, SAVINGS);
      bank.addAccount(customerB.getId(), 50.0, CHECKING);
      bank.addAccount(customerB.getId(), 2000.0, SAVINGS);
    } catch (NoSuchElementException e) {
      System.err.println(e.getMessage());
    }

    System.out.println(bank.getSummary());

    for (Customer customer : bank.getCustomers()) {
      System.out.println(customer.getSummary());
    }
  }
}
