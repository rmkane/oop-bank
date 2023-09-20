package org.example.app.model;

public class AcountImpl extends AbstractEntity implements Account {
  private double balance;
  private AccountType type;

  public AcountImpl(String id, double balance, AccountType type) {
    super(id);
    this.balance = balance;
    this.type = type;
  }

  public double getBalance() {
    return this.balance;
  }

  public void setBalance(double balance) {
    this.balance = balance;
  }

  public AccountType getType() {
    return this.type;
  }

  public void setType(AccountType type) {
    this.type = type;
  }
}
