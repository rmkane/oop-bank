package org.example.app.model;

import java.util.List;

public interface Customer extends Entity, HasBalance, HasSummary {
  String getName();

  void setName(String name);

  List<Account> getAccounts();

  void setAccounts(List<Account> accounts);
}
