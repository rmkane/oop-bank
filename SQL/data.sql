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
-- Insert data
--
INSERT INTO
  `bank` (`name`)
VALUES
  ('First Bank');

INSERT INTO
  `customer` (`name`)
VALUES
  ('George Washington'),
  ('Thomas Jefferson');

INSERT INTO
  `account` (`balance`, `account_type_id`)
VALUES
  (100.00, 1),
  (1000.00, 2),
  (50.00, 1),
  (2000.00, 2);

INSERT INTO
  `customer_account` (`customer_id`, `account_id`)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4);

INSERT INTO
  `bank_customer` (`bank_id`, `customer_id`)
VALUES
  (1, 1),
  (1, 2);