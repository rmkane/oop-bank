import { AccountTypes } from "./constants";

export type AccountType = keyof typeof AccountTypes;

export interface Entity {
  id: string;
}

export interface Account extends Entity {
  balance: number;
  type: AccountType;
}

export interface HasBalance {
  getTotalBalance(): number;
}

export interface HasSummary {
  getSummary(): string;
}

export interface Customer extends Entity, HasBalance, HasSummary {
  name: string;
  accounts: Account[];
}

export interface Bank extends Entity, HasBalance, HasSummary {
  name: string;
  customers: Customer[];
  addCustomer(name: string): Customer;
  addAccount(
    customerId: string,
    balance: number,
    accountType: AccountType
  ): Account | null;
}
