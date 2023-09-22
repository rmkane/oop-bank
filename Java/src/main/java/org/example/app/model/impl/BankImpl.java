package org.example.app.model.impl;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.example.app.model.Account;
import org.example.app.model.AccountType;
import org.example.app.model.Bank;
import org.example.app.model.Customer;

public class BankImpl extends AbstractEntity implements Bank {
  private String name;
  private List<Customer> customers = new ArrayList<>();
  private NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();

  public BankImpl(String id, String name) {
    super(id);
    this.name = name;
  }

  public Customer addCustomer(String name) {
    String customerId = String.format("%s-%d", this.getId(), this.customers.size());
    Customer customer = new CustomerImpl(customerId, name);
    this.customers.add(customer);
    return customer;
  }

  public Account addAccount(String customerId, double balance, AccountType type) throws NoSuchElementException {
    Optional<Customer> customer = this.customers.stream().filter(c -> c.getId().equals(customerId)).findFirst();
    if (!customer.isPresent()) {
      throw new NoSuchElementException(String.format("Customer with id %s not found",
          customerId));
    }
    String accountId = String.format("%s-%d", customerId, customer.get().getAccounts().size());
    Account account = new AcountImpl(accountId, balance, type);
    customer.get().getAccounts().add(account);
    return account;
  }

  public double getTotalBalance() {
    return this.customers.stream().mapToDouble(Customer::getTotalBalance).sum();
  }

  public String getSummary() {
    return String.format("Bank %s has a total balance of %s", this.name,
        this.currencyFormatter.format(this.getTotalBalance()));
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public List<Customer> getCustomers() {
    return customers;
  }

  public void setCustomers(List<Customer> customers) {
    this.customers = customers;
  }
}
