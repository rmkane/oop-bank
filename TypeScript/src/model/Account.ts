import type { Account, AccountType } from "../types";
import AbstractEntity from "./AbstractEntity";

export default class AccountImpl extends AbstractEntity implements Account {
  balance: number;
  type: AccountType;

  constructor(id: string, balance: number, type: AccountType) {
    super(id);
    this.balance = balance;
    this.type = type;
  }
}
