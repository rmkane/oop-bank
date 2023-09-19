export const defaultCurrencyFormatter = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
});

export const AccountTypes = {
  CHECKING: "CHECKING",
  SAVINGS: "SAVINGS",
} as const;
