import type { Account, AccountType, Bank, Customer } from "../types";
import { defaultCurrencyFormatter } from "../constants";
import AbstractEntity from "./AbstractEntity";
import CustomerImpl from "./Customer";
import AccountImpl from "./Account";

export default class BankImpl extends AbstractEntity implements Bank {
  name: string;
  customers: Customer[] = [];
  currencyFormatter = defaultCurrencyFormatter;

  constructor(id: string, name: string) {
    super(id);
    this.name = name;
  }

  addCustomer(name: string): Customer {
    const customer = new CustomerImpl(
      `${this.id}-${this.customers.length + 1}`,
      name
    );
    this.customers.push(customer);
    return customer;
  }

  addAccount(
    customerId: string,
    balance: number,
    accountType: AccountType
  ): Account {
    const customer = this.customers.find(
      (customer: Customer) => customer.id === customerId
    );
    if (!customer) {
      throw new Error(`Customer with id ${customerId} not found`);
    }
    const account = new AccountImpl(
      `${customerId}-${customer.accounts.length + 1}`,
      balance,
      accountType
    );
    customer.accounts.push(account);
    return account;
  }

  getTotalBalance(): number {
    return this.customers.reduce(
      (total: number, customer: Customer) => total + customer.getTotalBalance(),
      0
    );
  }

  getSummary(): string {
    return `The balance of ${this.name} is: ${this.currencyFormatter.format(
      this.getTotalBalance()
    )}`;
  }
}
