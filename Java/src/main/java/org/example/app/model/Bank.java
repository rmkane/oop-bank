package org.example.app.model;

import java.util.List;

public interface Bank extends Entity, HasBalance, HasSummary {
  String getName();

  void setName(String name);

  List<Customer> getCustomers();

  void setCustomers(List<Customer> customers);

  Customer addCustomer(String name);

  Account addAccount(String customerId, double balance, AccountType accountType);
}
