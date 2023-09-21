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
-- Drop tables if they exist
--
DROP TABLE IF EXISTS `bank_customer`;

DROP TABLE IF EXISTS `customer_account`;

DROP TABLE IF EXISTS `bank`;

DROP TABLE IF EXISTS `account`;

DROP TABLE IF EXISTS `customer`;

DROP TABLE IF EXISTS `account_type`;

--
-- Create tables
--
CREATE TABLE
  IF NOT EXISTS `account_type` (
    `account_type_id` int (11) NOT NULL,
    `name` varchar(32) NOT NULL,
    PRIMARY KEY (`account_type_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

CREATE TABLE
  IF NOT EXISTS `account` (
    `account_id` int (11) NOT NULL AUTO_INCREMENT,
    `balance` decimal(15, 2) NOT NULL DEFAULT 0.00,
    `account_type_id` int (11) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`account_id`),
    FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`account_type_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

CREATE TABLE
  IF NOT EXISTS `customer` (
    `customer_id` int (11) NOT NULL AUTO_INCREMENT,
    `name` varchar(64) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`customer_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

CREATE TABLE
  IF NOT EXISTS `bank` (
    `bank_id` int (11) NOT NULL AUTO_INCREMENT,
    `name` varchar(64) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`bank_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

CREATE TABLE
  IF NOT EXISTS `customer_account` (
    `customer_id` int (11) NOT NULL,
    `account_id` int (11) NOT NULL,
    FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
    FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

CREATE TABLE
  IF NOT EXISTS `bank_customer` (
    `bank_id` int (11) NOT NULL,
    `customer_id` int (11) NOT NULL,
    FOREIGN KEY (`bank_id`) REFERENCES `bank` (`bank_id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

--
-- Insert data
--
INSERT INTO
  `account_type` (`account_type_id`, `name`)
VALUES
  (1, 'Checking'),
  (2, 'Savings');