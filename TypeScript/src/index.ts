import type { Bank } from "./types";
import { AccountTypes } from "./constants";
import BankImpl from "./model/Bank";

const main = () => {
  const { CHECKING, SAVINGS } = AccountTypes;

  const bank: Bank = new BankImpl("1234567890", "First Bank");

  const customerA = bank.addCustomer("George Washington");
  const customerB = bank.addCustomer("Thomas Jefferson");

  try {
    bank.addAccount(customerA.id, 100.0, CHECKING);
    bank.addAccount(customerA.id, 1000.0, SAVINGS);
    bank.addAccount(customerB.id, 50.0, CHECKING);
    bank.addAccount(customerB.id, 2000.0, SAVINGS);
  } catch (e: unknown) {
    if (typeof e === "string") {
      console.error(e.toUpperCase());
    } else if (e instanceof Error) {
      console.error(e.message);
    }
    console.error(e);
  }

  console.log(bank.getSummary());

  for (let customer of bank.customers) {
    console.log(customer.getSummary());
  }
};

main();
