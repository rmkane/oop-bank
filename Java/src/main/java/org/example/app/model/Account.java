package org.example.app.model;

public interface Account extends Entity {
  double getBalance();

  void setBalance(double balance);

  AccountType getType();

  void setType(AccountType accountType);
}
