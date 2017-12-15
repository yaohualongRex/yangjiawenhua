CREATE DATABASE yangjiawenhua;

USE yangjiawenhua;

CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `book_type` varchar(255) DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `publishing_house` varchar(255) DEFAULT NULL,
  `bill_amount` decimal(10,0) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `a-1` bigint(20) DEFAULT NULL,
  `a-2` bigint(20) DEFAULT NULL,
  `a-3` bigint(20) DEFAULT NULL,
  `a-4` bigint(20) DEFAULT NULL,
  `a-5` bigint(20) DEFAULT NULL,
  `a-6` bigint(20) DEFAULT NULL,
  `b-1` bigint(20) DEFAULT NULL,
  `b-2` bigint(20) DEFAULT NULL,
  `b-3` bigint(20) DEFAULT NULL,
  `b-4` bigint(20) DEFAULT NULL,
  `b-5` bigint(20) DEFAULT NULL,
  `b-6` bigint(20) DEFAULT NULL,
  `b-7` bigint(20) DEFAULT NULL,
  `b-8` bigint(20) DEFAULT NULL,
  `c-1` bigint(20) DEFAULT NULL,
  `c-2` bigint(20) DEFAULT NULL,
  `c-3` bigint(20) DEFAULT NULL,
  `c-4` bigint(20) DEFAULT NULL,
  `c-5` bigint(20) DEFAULT NULL,
  `c-6` bigint(20) DEFAULT NULL,
  `c-7` bigint(20) DEFAULT NULL,
  `c-8` bigint(20) DEFAULT NULL,
  `c-9` bigint(20) DEFAULT NULL,
  `c-10` bigint(20) DEFAULT NULL,
  `c-11` bigint(20) DEFAULT NULL,
  `c-12` bigint(20) DEFAULT NULL,
  `c-13` bigint(20) DEFAULT NULL,
  `c-14` bigint(20) DEFAULT NULL,
  `c-15` bigint(20) DEFAULT NULL,
  `book_info_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `book_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `public` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `eb` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `words` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `product_size` varchar(255) DEFAULT NULL,
  `volumes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custom` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(100) DEFAULT NULL,
  `phone_no` varchar(5000) DEFAULT NULL,
  `unit_name` varchar(100) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `user_id` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone_no` varchar(255) DEFAULT NULL,
  `custom_name` varchar(255) DEFAULT NULL,
  `custom_place` varchar(255) DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `words` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `contract_send_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `return_amount` decimal(10,0) DEFAULT NULL,
  `return_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(1) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `second_return_amount` decimal(10,0) DEFAULT NULL,
  `second_return_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `third_return_amount` decimal(10,0) DEFAULT NULL,
  `third_return_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `recommend` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) DEFAULT NULL,
  `phone_no` varchar(11) DEFAULT NULL,
  `custom_phone_no` varchar(11) DEFAULT NULL,
  `bcustom_phone_no` varchar(11) DEFAULT NULL,
  `custom_name` varchar(100) DEFAULT NULL,
  `bcustom_name` varchar(100) DEFAULT NULL,
  `custom_company` varchar(100) DEFAULT NULL,
  `bcustom_company` varchar(100) DEFAULT NULL,
  `bcustom_book_id` bigint(255) DEFAULT NULL,
  `bcustom_place` varchar(100) DEFAULT NULL,
  `bcustom_amount` decimal(10,0) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_no` varchar(100) DEFAULT NULL,
  `recommend_amount` decimal(10,0) DEFAULT NULL,
  `recommend_remark` varchar(500) DEFAULT NULL,
  `user_id` bigint(255) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `dto_id` varchar(100) DEFAULT NULL,
  `china_name` varchar(100) DEFAULT NULL,
  `user_no` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `yangjiawenhua`.`book_info` 
CHANGE COLUMN `public` `publicer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL AFTER `book_name`;

ALTER TABLE `yangjiawenhua`.`bill` 
CHANGE COLUMN `from` `frome` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL AFTER `id`;