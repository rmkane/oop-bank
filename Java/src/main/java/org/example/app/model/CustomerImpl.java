package org.example.app.model;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomerImpl extends AbstractEntity implements Customer {
  private String name;
  private List<Account> accounts = new ArrayList<>();
  private NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();

  public CustomerImpl(String id, String name) {
    super(id);
    this.name = name;
  }

  public double getTotalBalance() {
    return this.accounts.stream().mapToDouble(Account::getBalance).sum();
  }

  public String getSummary() {
    return String.format("Customer %s has a total balance of %s", this.name,
        this.currencyFormatter.format(this.getTotalBalance()));
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public List<Account> getAccounts() {
    return accounts;
  }

  public void setAccounts(List<Account> accounts) {
    this.accounts = accounts;
  }
}
