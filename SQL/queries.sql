--
-- Select databse `bank`
--
USE bank;

--
-- Begin transaction
--
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

--
-- Queries
--
-- Total balance of each bank
SELECT
  b.bank_id,
  b.name as `bank_name`,
  sum(a.balance) as `total_balance`
FROM
  `account` a,
  `bank` b,
  `bank_customer` bc,
  `customer` c,
  `customer_account` ca
WHERE
  b.bank_id = bc.bank_id
  AND bc.customer_id = c.customer_id
  AND c.customer_id = ca.customer_id
  AND ca.account_id = a.account_id
GROUP BY
  b.bank_id;

-- Total balance of each customer
SELECT
  b.bank_id,
  b.name as `bank_name`,
  c.customer_id,
  c.name as `customer_name`,
  sum(a.balance) as `total_balance`
FROM
  `account` a,
  `bank` b,
  `bank_customer` bc,
  `customer` c,
  `customer_account` ca
WHERE
  b.bank_id = bc.bank_id
  AND bc.customer_id = c.customer_id
  AND c.customer_id = ca.customer_id
  AND ca.account_id = a.account_id
GROUP BY
  c.customer_id;