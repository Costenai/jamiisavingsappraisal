-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 14, 2026 at 08:46 PM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customerdetails_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_details`
--

DROP TABLE IF EXISTS `accounts_details`;
CREATE TABLE IF NOT EXISTS `accounts_details` (
  `account_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_id` varchar(5) DEFAULT NULL,
  `account_number` varchar(20) NOT NULL,
  `status` enum('ACTIVE','DORMANT','CLOSED') NOT NULL,
  `balance` decimal(15,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'KES',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `uk_account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `accounts_details`
--

INSERT INTO `accounts_details` (`account_id`, `channel_id`, `account_number`, `status`, `balance`, `currency`, `updated_at`) VALUES
(1, '001', '035000001900', 'ACTIVE', 0.00, 'KES', '2026-10-08 16:56:21'),
(2, '001', '035000002900', 'ACTIVE', 508.00, 'KES', '2026-10-08 16:56:45'),
(3, '001', '035000003900', 'DORMANT', 100000.00, 'KES', '2026-10-08 16:56:22'),
(4, '001', '038000020400', 'ACTIVE', 0.00, 'KES', '2026-10-08 16:56:22'),
(5, '001', '038000021400', 'CLOSED', 200.00, 'KES', '2026-10-08 16:56:22');

-- --------------------------------------------------------

--
-- Table structure for table `api_audit_log`
--

DROP TABLE IF EXISTS `api_audit_log`;
CREATE TABLE IF NOT EXISTS `api_audit_log` (
  `audit_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `request_id` char(36) NOT NULL,
  `api_name` varchar(60) NOT NULL,
  `request_url` varchar(500) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `http_status` smallint DEFAULT NULL,
  `outcome` varchar(40) DEFAULT NULL,
  `response_body` text,
  `duration_ms` int DEFAULT NULL,
  `created_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`audit_id`),
  KEY `idx_audit_request_id` (`request_id`),
  KEY `idx_audit_account` (`account_number`),
  KEY `idx_audit_created` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `api_audit_log`
--

INSERT INTO `api_audit_log` (`audit_id`, `request_id`, `api_name`, `request_url`, `account_number`, `http_status`, `outcome`, `response_body`, `duration_ms`, `created_at`) VALUES
(1, '43c7a2ac-2199-454b-8baa-bfe6e8dbfbc1', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"43c7a2ac-2199-454b-8baa-bfe6e8dbfbc1\",\"timestamp\":\"2026-10-09T09:43:40+03:00\"}', 296, '2026-10-09 06:43:40.968'),
(2, 'af5bf6da-547e-4ee6-9578-7e1463f4c9da', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"af5bf6da-547e-4ee6-9578-7e1463f4c9da\",\"timestamp\":\"2026-10-09T09:43:43+03:00\"}', 6, '2026-10-09 06:43:43.203'),
(3, '56805059-c822-4727-9e2d-5399b464e078', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"56805059-c822-4727-9e2d-5399b464e078\",\"timestamp\":\"2026-10-09T09:43:44+03:00\"}', 11, '2026-10-09 06:43:44.458'),
(4, 'a3507228-82b7-4917-9a89-afa55d293a65', 'AccountBalanceAPI', '/accounts/035000003906/balance', '035000003906', 404, 'ACCOUNT_NOT_FOUND', '{\"error\":{\"code\":\"ACCOUNT_NOT_FOUND\",\"message\":\"No account exists with the given account number.\"},\"requestId\":\"a3507228-82b7-4917-9a89-afa55d293a65\",\"timestamp\":\"2026-10-09T09:44:12+03:00\"}', 10, '2026-10-09 06:44:12.425'),
(5, '657c644a-4a92-445d-9883-5c11665fc768', 'AccountBalanceAPI', '/accounts/035000003906/balance', '035000003906', 404, 'ACCOUNT_NOT_FOUND', '{\"error\":{\"code\":\"ACCOUNT_NOT_FOUND\",\"message\":\"No account exists with the given account number.\"},\"requestId\":\"657c644a-4a92-445d-9883-5c11665fc768\",\"timestamp\":\"2026-10-09T09:56:56+03:00\"}', 108, '2026-10-09 06:56:56.480'),
(6, '5f769f76-acde-4497-8b46-9eaeeed97795', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"5f769f76-acde-4497-8b46-9eaeeed97795\",\"timestamp\":\"2026-10-09T09:57:02+03:00\"}', 12, '2026-10-09 06:57:02.118'),
(7, 'c4c2ea78-5ec4-477c-97a2-b4132d2dbc4a', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"c4c2ea78-5ec4-477c-97a2-b4132d2dbc4a\",\"timestamp\":\"2026-10-10T18:59:23+03:00\"}', 167, '2026-10-10 15:59:24.131'),
(8, '2077c0d6-ac21-4332-9a1e-aba029db54a6', 'AccountBalanceAPI', '/accounts/035000001900/balance', '035000001900', 200, 'SUCCESS', '{\"accountNumber\":\"035000001900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":0.00,\"currency\":\"KES\"},\"requestId\":\"2077c0d6-ac21-4332-9a1e-aba029db54a6\",\"timestamp\":\"2026-10-10T19:25:33+03:00\"}', 48, '2026-10-10 16:25:33.668'),
(9, '4cf2fe84-eb28-4e30-90d0-09d8da82bab2', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"4cf2fe84-eb28-4e30-90d0-09d8da82bab2\",\"timestamp\":\"2026-10-10T19:43:39+03:00\"}', 38, '2026-10-10 16:43:39.431'),
(10, '6104327f-9135-43c5-b23a-2b0eff66579c', 'AccountBalanceAPI', '/accounts/035000001900/balance', '035000001900', 200, 'SUCCESS', '{\"accountNumber\":\"035000001900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":0.00,\"currency\":\"KES\"},\"requestId\":\"6104327f-9135-43c5-b23a-2b0eff66579c\",\"timestamp\":\"2026-10-10T19:47:17+03:00\"}', 72, '2026-10-10 16:47:17.806'),
(11, '70007494-e898-420b-83eb-c5cb326af63a', 'AccountBalanceAPI', '/accounts/035000001900/balance', '035000001900', 200, 'SUCCESS', '{\"accountNumber\":\"035000001900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":0.00,\"currency\":\"KES\"},\"requestId\":\"70007494-e898-420b-83eb-c5cb326af63a\",\"timestamp\":\"2026-10-10T19:48:35+03:00\"}', 52, '2026-10-10 16:48:35.520'),
(12, '24804c00-e3d5-4130-abe4-1a520372b569', 'AccountBalanceAPI', '/accounts/035000001909/balance', '035000001909', 404, 'ACCOUNT_NOT_FOUND', '{\"error\":{\"code\":\"ACCOUNT_NOT_FOUND\",\"message\":\"No account exists with the given account number.\"},\"requestId\":\"24804c00-e3d5-4130-abe4-1a520372b569\",\"timestamp\":\"2026-10-10T19:48:41+03:00\"}', 21, '2026-10-10 16:48:41.931'),
(13, 'efb27f19-39dd-45cd-b0c3-e972cb0cdbee', 'AccountBalanceAPI', '/accounts/035000001900/balance', '035000001900', 200, 'SUCCESS', '{\"accountNumber\":\"035000001900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":0.00,\"currency\":\"KES\"},\"requestId\":\"efb27f19-39dd-45cd-b0c3-e972cb0cdbee\",\"timestamp\":\"2026-10-10T19:49:16+03:00\"}', 26, '2026-10-10 16:49:16.131'),
(14, 'a5c435b4-ab86-4a92-a305-951fdfc7ba2e', 'AccountBalanceAPI', '/accounts/035000001900/balance', '035000001900', 200, 'SUCCESS', '{\"accountNumber\":\"035000001900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":0.00,\"currency\":\"KES\"},\"requestId\":\"a5c435b4-ab86-4a92-a305-951fdfc7ba2e\",\"timestamp\":\"2026-10-10T19:52:21+03:00\"}', 40, '2026-10-10 16:52:21.552'),
(15, 'f97a2bb0-4b03-4104-b4a6-74b5e69734af', 'AccountBalanceAPI', '/accounts/035000001900/balance', '035000001900', 200, 'SUCCESS', '{\"accountNumber\":\"035000001900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":0.00,\"currency\":\"KES\"},\"requestId\":\"f97a2bb0-4b03-4104-b4a6-74b5e69734af\",\"timestamp\":\"2026-10-10T19:52:27+03:00\"}', 18, '2026-10-10 16:52:27.732'),
(16, 'f1d7509e-da44-4a45-8d44-d58f35776574', 'AccountBalanceAPI', '/accounts/035000001900/balance', '035000001900', 200, 'SUCCESS', '{\"accountNumber\":\"035000001900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":0.00,\"currency\":\"KES\"},\"requestId\":\"f1d7509e-da44-4a45-8d44-d58f35776574\",\"timestamp\":\"2026-10-10T19:55:01+03:00\"}', 405, '2026-10-10 16:55:01.691'),
(17, '66745f60-b1fd-4462-8f4d-08a6796168d2', 'AccountBalanceAPI', '/accounts/035000002900/balance', '035000002900', 200, 'SUCCESS', '{\"accountNumber\":\"035000002900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":508.00,\"currency\":\"KES\"},\"requestId\":\"66745f60-b1fd-4462-8f4d-08a6796168d2\",\"timestamp\":\"2026-10-10T19:58:03+03:00\"}', 31, '2026-10-10 16:58:03.064'),
(18, '1ea14247-eb16-4473-bff6-ca79cc3b7669', 'AccountBalanceAPI', '/accounts/035000002900/balance', '035000002900', 200, 'SUCCESS', '{\"accountNumber\":\"035000002900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":508.00,\"currency\":\"KES\"},\"requestId\":\"1ea14247-eb16-4473-bff6-ca79cc3b7669\",\"timestamp\":\"2026-10-10T19:58:25+03:00\"}', 23, '2026-10-10 16:58:25.327'),
(19, '48db2ecf-b5a7-4758-be65-1b20de2a8dec', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"48db2ecf-b5a7-4758-be65-1b20de2a8dec\",\"timestamp\":\"2026-10-14T18:03:44+03:00\"}', 86, '2026-10-14 15:03:44.255'),
(20, 'fc78b8ad-98f7-4719-b113-d6352da7c357', 'AccountBalanceAPI', '/accounts/035000002900/balance', '035000002900', 200, 'SUCCESS', '{\"accountNumber\":\"035000002900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":508.00,\"currency\":\"KES\"},\"requestId\":\"fc78b8ad-98f7-4719-b113-d6352da7c357\",\"timestamp\":\"2026-10-14T19:13:42+03:00\"}', 219, '2026-10-14 16:13:42.817'),
(21, '2ce244cf-574e-44d7-9579-045bd086a257', 'AccountBalanceAPI', '/accounts/035000002901/balance', '035000002901', 404, 'ACCOUNT_NOT_FOUND', '{\"error\":{\"code\":\"ACCOUNT_NOT_FOUND\",\"message\":\"No account exists with the given account number.\"},\"requestId\":\"2ce244cf-574e-44d7-9579-045bd086a257\",\"timestamp\":\"2026-10-14T19:14:18+03:00\"}', 8, '2026-10-14 16:14:18.313'),
(22, '807677d5-ee39-4e62-8ed0-eeb817727311', 'AccountBalanceAPI', '/accounts/035000002901/balance', '035000002901', 404, 'ACCOUNT_NOT_FOUND', '{\"error\":{\"code\":\"ACCOUNT_NOT_FOUND\",\"message\":\"No account exists with the given account number.\"},\"requestId\":\"807677d5-ee39-4e62-8ed0-eeb817727311\",\"timestamp\":\"2026-10-14T19:33:48+03:00\"}', 524, '2026-10-14 16:33:49.164'),
(23, 'f9d2f1db-3478-490a-8f51-ff07c2675fc5', 'AccountBalanceAPI', '/accounts/035000002900/balance', '035000002900', 200, 'SUCCESS', '{\"accountNumber\":\"035000002900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":508.00,\"currency\":\"KES\"},\"requestId\":\"f9d2f1db-3478-490a-8f51-ff07c2675fc5\",\"timestamp\":\"2026-10-14T19:33:55+03:00\"}', 24, '2026-10-14 16:33:55.502'),
(24, '993e73c6-60de-412f-8df3-98f29ebca641', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"993e73c6-60de-412f-8df3-98f29ebca641\",\"timestamp\":\"2026-10-14T19:33:59+03:00\"}', 12, '2026-10-14 16:33:59.955'),
(25, '7be6e794-8b37-4272-9cb8-84a0b8bf31a4', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"7be6e794-8b37-4272-9cb8-84a0b8bf31a4\",\"timestamp\":\"2026-10-14T19:42:17+03:00\"}', 215, '2026-10-14 16:42:17.476'),
(26, 'a3a1fdde-041f-4500-ac49-1cab7eac1ea8', 'AccountBalanceAPI', '/accounts/035000002900/balance', '035000002900', 200, 'SUCCESS', '{\"accountNumber\":\"035000002900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":508.00,\"currency\":\"KES\"},\"requestId\":\"a3a1fdde-041f-4500-ac49-1cab7eac1ea8\",\"timestamp\":\"2026-10-14T19:53:43+03:00\"}', 273, '2026-10-14 16:53:44.328'),
(27, 'b81f1299-b25e-44e7-bdb5-43252aaae550', 'AccountBalanceAPI', '/accounts/035000002900/balance', '035000002900', 200, 'SUCCESS', '{\"accountNumber\":\"035000002900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":508.00,\"currency\":\"KES\"},\"requestId\":\"b81f1299-b25e-44e7-bdb5-43252aaae550\",\"timestamp\":\"2026-10-14T19:55:56+03:00\"}', 16, '2026-10-14 16:55:56.620'),
(28, '6d58bac6-d5e6-4645-9303-89218aa9ce86', 'AccountBalanceAPI', '/accounts/035000002900/balance', '035000002900', 200, 'SUCCESS', '{\"accountNumber\":\"035000002900\",\"status\":\"ACTIVE\",\"balance\":{\"amount\":508.00,\"currency\":\"KES\"},\"requestId\":\"6d58bac6-d5e6-4645-9303-89218aa9ce86\",\"timestamp\":\"2026-10-14T20:09:04+03:00\"}', 19, '2026-10-14 17:09:04.312'),
(29, '47af2f14-4318-42e0-bb1c-79472ab810f2', 'AccountBalanceAPI', '/accounts/035000003900/balance', '035000003900', 200, 'SUCCESS', '{\"accountNumber\":\"035000003900\",\"status\":\"DORMANT\",\"balance\":{\"amount\":100000.00,\"currency\":\"KES\"},\"requestId\":\"47af2f14-4318-42e0-bb1c-79472ab810f2\",\"timestamp\":\"2026-10-14T20:09:20+03:00\"}', 10, '2026-10-14 17:09:20.526'),
(30, 'ab161504-9d72-4de0-965a-06d82792c213', 'AccountBalanceAPI', '/accounts/038000021400/balance', '038000021400', 200, 'SUCCESS', '{\"accountNumber\":\"038000021400\",\"status\":\"CLOSED\",\"balance\":{\"amount\":200.00,\"currency\":\"KES\"},\"requestId\":\"ab161504-9d72-4de0-965a-06d82792c213\",\"timestamp\":\"2026-10-14T20:15:47+03:00\"}', 271, '2026-10-14 17:15:47.836'),
(31, '3ec955a7-5ec6-49ed-85cd-5913a7312752', 'AccountBalanceAPI', '/accounts/038000021400/balance', '038000021400', 200, 'SUCCESS', '{\"accountNumber\":\"038000021400\",\"status\":\"CLOSED\",\"balance\":{\"amount\":200.00,\"currency\":\"KES\"},\"requestId\":\"3ec955a7-5ec6-49ed-85cd-5913a7312752\",\"timestamp\":\"2026-10-14T20:54:04+03:00\"}', 35, '2026-10-14 17:54:04.642'),
(32, '8dbc7701-5cef-4dd3-9468-9712b21c353f', 'AccountBalanceAPI', '/accounts/038000021400/balance', '038000021400', 200, 'SUCCESS', '{\"accountNumber\":\"038000021400\",\"status\":\"CLOSED\",\"balance\":{\"amount\":200.00,\"currency\":\"KES\"},\"requestId\":\"8dbc7701-5cef-4dd3-9468-9712b21c353f\",\"timestamp\":\"2026-10-14T21:01:52+03:00\"}', 421, '2026-10-14 18:01:53.041'),
(33, 'e7097dbb-a01b-41db-a57a-cade64419609', 'AccountBalanceAPI', '/accounts/038000021400/balance', '038000021400', 200, 'SUCCESS', '{\"accountNumber\":\"038000021400\",\"status\":\"CLOSED\",\"balance\":{\"amount\":200.00,\"currency\":\"KES\"},\"requestId\":\"e7097dbb-a01b-41db-a57a-cade64419609\",\"timestamp\":\"2026-10-14T21:15:00+03:00\"}', 265, '2026-10-14 18:15:01.304');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
