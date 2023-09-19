import type { Account, Customer } from "../types";
import { defaultCurrencyFormatter } from "../constants";
import AbstractEntity from "./AbstractEntity";

export default class CustomerImpl extends AbstractEntity implements Customer {
  name: string;
  accounts: Account[] = [];
  currencyFormatter = defaultCurrencyFormatter;

  constructor(id: string, name: string) {
    super(id);
    this.name = name;
  }

  getTotalBalance(): number {
    return this.accounts.reduce(
      (total: number, account: Account) => total + account.balance,
      0
    );
  }

  getSummary(): string {
    return `The balance of ${this.name} is: ${this.currencyFormatter.format(
      this.getTotalBalance()
    )}`;
  }
}
