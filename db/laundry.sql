-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 17, 2019 at 05:34 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` text NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) DEFAULT NULL,
  `thumbnail_path` varchar(1024) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `article_attachment`
--

CREATE TABLE `article_attachment` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE `article_category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` text,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`id`, `slug`, `title`, `body`, `parent_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'news', 'News', NULL, NULL, 1, 1576583935, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_storage_item`
--

CREATE TABLE `file_storage_item` (
  `id` int(11) NOT NULL,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `i18n_message`
--

CREATE TABLE `i18n_message` (
  `id` int(11) NOT NULL,
  `language` varchar(16) NOT NULL,
  `translation` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `i18n_source_message`
--

CREATE TABLE `i18n_source_message` (
  `id` int(11) NOT NULL,
  `category` varchar(32) DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `key_storage_item`
--

CREATE TABLE `key_storage_item` (
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `comment` text,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `key_storage_item`
--

INSERT INTO `key_storage_item` (`key`, `value`, `comment`, `updated_at`, `created_at`) VALUES
('backend.layout-boxed', '0', NULL, NULL, NULL),
('backend.layout-collapsed-sidebar', '0', NULL, NULL, NULL),
('backend.layout-fixed', '0', NULL, NULL, NULL),
('backend.theme-skin', 'skin-blue', 'skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow', NULL, NULL),
('frontend.maintenance', 'disabled', 'Set it to \"enabled\" to turn on maintenance mode', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `slug` varchar(2048) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` text NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `slug`, `title`, `body`, `view`, `status`, `created_at`, `updated_at`) VALUES
(1, 'about', 'About', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', NULL, 1, 1576583935, 1576583935);

-- --------------------------------------------------------

--
-- Table structure for table `rbac_auth_assignment`
--

CREATE TABLE `rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rbac_auth_assignment`
--

INSERT INTO `rbac_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrator', '1', 1569580679),
('manager', '2', 1569580679),
('user', '3', 1569580679);

-- --------------------------------------------------------

--
-- Table structure for table `rbac_auth_item`
--

CREATE TABLE `rbac_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rbac_auth_item`
--

INSERT INTO `rbac_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1568968832, 1568968832),
('/admin/*', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/admin/assignment/*', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/assignment/assign', 2, NULL, NULL, NULL, 1568968816, 1568968816),
('/admin/assignment/index', 2, NULL, NULL, NULL, 1568968816, 1568968816),
('/admin/assignment/revoke', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/assignment/view', 2, NULL, NULL, NULL, 1568968816, 1568968816),
('/admin/default/*', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/default/index', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/menu/*', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/menu/create', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/menu/delete', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/menu/index', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/menu/update', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/menu/view', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/admin/permission/*', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/permission/assign', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/permission/create', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/permission/delete', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/permission/index', 2, NULL, NULL, NULL, 1568968820, 1568968820),
('/admin/permission/remove', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/permission/update', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/permission/view', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/role/*', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/role/assign', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/role/create', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/role/delete', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/role/index', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/role/remove', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/role/update', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/role/view', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/route/*', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/route/assign', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/route/create', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/route/index', 2, NULL, NULL, NULL, 1568968822, 1568968822),
('/admin/route/refresh', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/route/remove', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/rule/*', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/rule/create', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/rule/delete', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/rule/index', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/rule/update', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/rule/view', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/user/*', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/admin/user/activate', 2, NULL, NULL, NULL, 1568968827, 1568968827),
('/admin/user/change-password', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/user/delete', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/user/index', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/user/login', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/user/logout', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/user/request-password-reset', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/user/reset-password', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/user/signup', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/admin/user/view', 2, NULL, NULL, NULL, 1568968825, 1568968825),
('/content/*', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/article/*', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/article/create', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/article/delete', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/article/index', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/article/update', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/category/*', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/category/delete', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/category/index', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/category/update', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/page/*', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/page/create', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/page/delete', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/page/index', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/content/page/update', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/debug/*', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/debug/default/*', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/debug/default/db-explain', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/debug/default/download-mail', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/debug/default/index', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/debug/default/toolbar', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/debug/default/view', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/debug/user/*', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/debug/user/reset-identity', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/debug/user/set-identity', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/file/*', 2, NULL, NULL, NULL, 1568968813, 1568968813),
('/file/manager/*', 2, NULL, NULL, NULL, 1568968805, 1568968805),
('/file/manager/connector', 2, NULL, NULL, NULL, 1568968805, 1568968805),
('/file/manager/index', 2, NULL, NULL, NULL, 1568968805, 1568968805),
('/file/storage/*', 2, NULL, NULL, NULL, 1568968812, 1568968812),
('/file/storage/delete', 2, NULL, NULL, NULL, 1568968812, 1568968812),
('/file/storage/index', 2, NULL, NULL, NULL, 1568968812, 1568968812),
('/file/storage/upload', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/file/storage/upload-delete', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/file/storage/upload-imperavi', 2, NULL, NULL, NULL, 1568968812, 1568968812),
('/file/storage/view', 2, NULL, NULL, NULL, 1568968812, 1568968812),
('/gii/*', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/gii/default/*', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/gii/default/action', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/gii/default/diff', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/gii/default/index', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/gii/default/preview', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/gii/default/view', 2, NULL, NULL, NULL, 1568968796, 1568968796),
('/rbac/*', 2, NULL, NULL, NULL, 1568968816, 1568968816),
('/rbac/rbac-auth-assignment/*', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/rbac/rbac-auth-assignment/create', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/rbac/rbac-auth-assignment/delete', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/rbac/rbac-auth-assignment/index', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/rbac/rbac-auth-assignment/update', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/rbac/rbac-auth-assignment/view', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/rbac/rbac-auth-item-child/*', 2, NULL, NULL, NULL, 1568968813, 1568968813),
('/rbac/rbac-auth-item-child/create', 2, NULL, NULL, NULL, 1568968813, 1568968813),
('/rbac/rbac-auth-item-child/delete', 2, NULL, NULL, NULL, 1568968813, 1568968813),
('/rbac/rbac-auth-item-child/index', 2, NULL, NULL, NULL, 1568968813, 1568968813),
('/rbac/rbac-auth-item-child/update', 2, NULL, NULL, NULL, 1568968813, 1568968813),
('/rbac/rbac-auth-item-child/view', 2, NULL, NULL, NULL, 1568968813, 1568968813),
('/rbac/rbac-auth-item/*', 2, NULL, NULL, NULL, 1568968815, 1568968815),
('/rbac/rbac-auth-item/create', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/rbac/rbac-auth-item/delete', 2, NULL, NULL, NULL, 1568968815, 1568968815),
('/rbac/rbac-auth-item/index', 2, NULL, NULL, NULL, 1568968813, 1568968813),
('/rbac/rbac-auth-item/update', 2, NULL, NULL, NULL, 1568968819, 1568968819),
('/rbac/rbac-auth-item/view', 2, NULL, NULL, NULL, 1568968813, 1568968813),
('/rbac/rbac-auth-rule/*', 2, NULL, NULL, NULL, 1568968815, 1568968815),
('/rbac/rbac-auth-rule/create', 2, NULL, NULL, NULL, 1568968815, 1568968815),
('/rbac/rbac-auth-rule/delete', 2, NULL, NULL, NULL, 1568968815, 1568968815),
('/rbac/rbac-auth-rule/index', 2, NULL, NULL, NULL, 1568968815, 1568968815),
('/rbac/rbac-auth-rule/update', 2, NULL, NULL, NULL, 1568968815, 1568968815),
('/rbac/rbac-auth-rule/view', 2, NULL, NULL, NULL, 1568968815, 1568968815),
('/sign-in/*', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/sign-in/account', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/sign-in/avatar-delete', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/sign-in/avatar-upload', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/sign-in/login', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/sign-in/logout', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/sign-in/profile', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/site/*', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/site/error', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/system/*', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/system/cache/*', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/system/cache/flush-cache', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/system/cache/flush-cache-key', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/system/cache/flush-cache-tag', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/system/cache/index', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/system/information/*', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/system/information/index', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/system/key-storage/*', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/system/key-storage/delete', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/system/key-storage/index', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/system/key-storage/update', 2, NULL, NULL, NULL, 1568968808, 1568968808),
('/system/log/*', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/system/log/delete', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/system/log/index', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/system/log/view', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/system/settings/*', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/system/settings/index', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/timeline-event/*', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/timeline-event/index', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/translation/*', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/translation/default/*', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/translation/default/delete', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/translation/default/index', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/translation/default/update', 2, NULL, NULL, NULL, 1568968793, 1568968793),
('/user/*', 2, NULL, NULL, NULL, 1568968832, 1568968832),
('/user/create', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/user/delete', 2, NULL, NULL, NULL, 1568968832, 1568968832),
('/user/index', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/user/login', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/user/update', 2, NULL, NULL, NULL, 1568968833, 1568968833),
('/user/view', 2, NULL, NULL, NULL, 1568968828, 1568968828),
('/widget/*', 2, NULL, NULL, NULL, 1568968805, 1568968805),
('/widget/carousel-item/*', 2, NULL, NULL, NULL, 1568968804, 1568968804),
('/widget/carousel-item/create', 2, NULL, NULL, NULL, 1568968804, 1568968804),
('/widget/carousel-item/delete', 2, NULL, NULL, NULL, 1568968804, 1568968804),
('/widget/carousel-item/update', 2, NULL, NULL, NULL, 1568968804, 1568968804),
('/widget/carousel/*', 2, NULL, NULL, NULL, 1568968804, 1568968804),
('/widget/carousel/delete', 2, NULL, NULL, NULL, 1568968804, 1568968804),
('/widget/carousel/index', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/widget/carousel/update', 2, NULL, NULL, NULL, 1568968799, 1568968799),
('/widget/menu/*', 2, NULL, NULL, NULL, 1568968805, 1568968805),
('/widget/menu/delete', 2, NULL, NULL, NULL, 1568968804, 1568968804),
('/widget/menu/index', 2, NULL, NULL, NULL, 1568968804, 1568968804),
('/widget/menu/update', 2, NULL, NULL, NULL, 1568968804, 1568968804),
('/widget/text/*', 2, NULL, NULL, NULL, 1568968805, 1568968805),
('/widget/text/delete', 2, NULL, NULL, NULL, 1568968805, 1568968805),
('/widget/text/index', 2, NULL, NULL, NULL, 1568968805, 1568968805),
('/widget/text/update', 2, NULL, NULL, NULL, 1568968805, 1568968805),
('administrator', 1, NULL, NULL, NULL, 1568968775, 1568979646),
('loginToBackend', 2, NULL, NULL, NULL, 1568969111, 1568969111),
('manager', 1, NULL, NULL, NULL, 1568980023, 1568980023),
('user', 1, NULL, NULL, NULL, 1568980040, 1568980040);

-- --------------------------------------------------------

--
-- Table structure for table `rbac_auth_item_child`
--

CREATE TABLE `rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rbac_auth_item_child`
--

INSERT INTO `rbac_auth_item_child` (`parent`, `child`) VALUES
('administrator', '/*'),
('administrator', '/admin/*'),
('administrator', '/admin/assignment/*'),
('administrator', '/admin/assignment/assign'),
('administrator', '/admin/assignment/index'),
('administrator', '/admin/assignment/revoke'),
('administrator', '/admin/assignment/view'),
('administrator', '/admin/default/*'),
('administrator', '/admin/default/index'),
('administrator', '/admin/menu/*'),
('administrator', '/admin/menu/create'),
('administrator', '/admin/menu/delete'),
('administrator', '/admin/menu/index'),
('administrator', '/admin/menu/update'),
('administrator', '/admin/menu/view'),
('administrator', '/admin/permission/*'),
('administrator', '/admin/permission/assign'),
('administrator', '/admin/permission/create'),
('administrator', '/admin/permission/delete'),
('administrator', '/admin/permission/index'),
('administrator', '/admin/permission/remove'),
('administrator', '/admin/permission/update'),
('administrator', '/admin/permission/view'),
('administrator', '/admin/role/*'),
('administrator', '/admin/role/assign'),
('administrator', '/admin/role/create'),
('administrator', '/admin/role/delete'),
('administrator', '/admin/role/index'),
('administrator', '/admin/role/remove'),
('administrator', '/admin/role/update'),
('administrator', '/admin/role/view'),
('administrator', '/admin/route/*'),
('administrator', '/admin/route/assign'),
('administrator', '/admin/route/create'),
('administrator', '/admin/route/index'),
('administrator', '/admin/route/refresh'),
('administrator', '/admin/route/remove'),
('administrator', '/admin/rule/*'),
('administrator', '/admin/rule/create'),
('administrator', '/admin/rule/delete'),
('administrator', '/admin/rule/index'),
('administrator', '/admin/rule/update'),
('administrator', '/admin/rule/view'),
('administrator', '/admin/user/*'),
('administrator', '/admin/user/activate'),
('administrator', '/admin/user/change-password'),
('administrator', '/admin/user/delete'),
('administrator', '/admin/user/index'),
('administrator', '/admin/user/login'),
('administrator', '/admin/user/logout'),
('administrator', '/admin/user/request-password-reset'),
('administrator', '/admin/user/reset-password'),
('administrator', '/admin/user/signup'),
('administrator', '/admin/user/view'),
('administrator', '/content/*'),
('administrator', '/content/article/*'),
('administrator', '/content/article/create'),
('administrator', '/content/article/delete'),
('administrator', '/content/article/index'),
('administrator', '/content/article/update'),
('administrator', '/content/category/*'),
('administrator', '/content/category/delete'),
('administrator', '/content/category/index'),
('administrator', '/content/category/update'),
('administrator', '/content/page/*'),
('administrator', '/content/page/create'),
('administrator', '/content/page/delete'),
('administrator', '/content/page/index'),
('administrator', '/content/page/update'),
('administrator', '/debug/*'),
('administrator', '/debug/default/*'),
('administrator', '/debug/default/db-explain'),
('administrator', '/debug/default/download-mail'),
('administrator', '/debug/default/index'),
('administrator', '/debug/default/toolbar'),
('administrator', '/debug/default/view'),
('administrator', '/debug/user/*'),
('administrator', '/debug/user/reset-identity'),
('administrator', '/debug/user/set-identity'),
('administrator', '/file/*'),
('administrator', '/file/manager/*'),
('administrator', '/file/manager/connector'),
('administrator', '/file/manager/index'),
('administrator', '/file/storage/*'),
('administrator', '/file/storage/delete'),
('administrator', '/file/storage/index'),
('administrator', '/file/storage/upload'),
('administrator', '/file/storage/upload-delete'),
('administrator', '/file/storage/upload-imperavi'),
('administrator', '/file/storage/view'),
('administrator', '/gii/*'),
('administrator', '/gii/default/*'),
('administrator', '/gii/default/action'),
('administrator', '/gii/default/diff'),
('administrator', '/gii/default/index'),
('administrator', '/gii/default/preview'),
('administrator', '/gii/default/view'),
('administrator', '/rbac/*'),
('administrator', '/rbac/rbac-auth-assignment/*'),
('administrator', '/rbac/rbac-auth-assignment/create'),
('administrator', '/rbac/rbac-auth-assignment/delete'),
('administrator', '/rbac/rbac-auth-assignment/index'),
('administrator', '/rbac/rbac-auth-assignment/update'),
('administrator', '/rbac/rbac-auth-assignment/view'),
('administrator', '/rbac/rbac-auth-item-child/*'),
('administrator', '/rbac/rbac-auth-item-child/create'),
('administrator', '/rbac/rbac-auth-item-child/delete'),
('administrator', '/rbac/rbac-auth-item-child/index'),
('administrator', '/rbac/rbac-auth-item-child/update'),
('administrator', '/rbac/rbac-auth-item-child/view'),
('administrator', '/rbac/rbac-auth-item/*'),
('administrator', '/rbac/rbac-auth-item/create'),
('administrator', '/rbac/rbac-auth-item/delete'),
('administrator', '/rbac/rbac-auth-item/index'),
('administrator', '/rbac/rbac-auth-item/update'),
('administrator', '/rbac/rbac-auth-item/view'),
('administrator', '/rbac/rbac-auth-rule/*'),
('administrator', '/rbac/rbac-auth-rule/create'),
('administrator', '/rbac/rbac-auth-rule/delete'),
('administrator', '/rbac/rbac-auth-rule/index'),
('administrator', '/rbac/rbac-auth-rule/update'),
('administrator', '/rbac/rbac-auth-rule/view'),
('administrator', '/sign-in/*'),
('administrator', '/sign-in/account'),
('administrator', '/sign-in/avatar-delete'),
('administrator', '/sign-in/avatar-upload'),
('administrator', '/sign-in/login'),
('administrator', '/sign-in/logout'),
('administrator', '/sign-in/profile'),
('administrator', '/site/*'),
('administrator', '/site/error'),
('administrator', '/system/*'),
('administrator', '/system/cache/*'),
('administrator', '/system/cache/flush-cache'),
('administrator', '/system/cache/flush-cache-key'),
('administrator', '/system/cache/flush-cache-tag'),
('administrator', '/system/cache/index'),
('administrator', '/system/information/*'),
('administrator', '/system/information/index'),
('administrator', '/system/key-storage/*'),
('administrator', '/system/key-storage/delete'),
('administrator', '/system/key-storage/index'),
('administrator', '/system/key-storage/update'),
('administrator', '/system/log/*'),
('administrator', '/system/log/delete'),
('administrator', '/system/log/index'),
('administrator', '/system/log/view'),
('administrator', '/system/settings/*'),
('administrator', '/system/settings/index'),
('administrator', '/timeline-event/*'),
('administrator', '/timeline-event/index'),
('administrator', '/translation/*'),
('administrator', '/translation/default/*'),
('administrator', '/translation/default/delete'),
('administrator', '/translation/default/index'),
('administrator', '/translation/default/update'),
('administrator', '/user/*'),
('administrator', '/user/create'),
('administrator', '/user/delete'),
('administrator', '/user/index'),
('administrator', '/user/login'),
('administrator', '/user/update'),
('administrator', '/user/view'),
('administrator', '/widget/*'),
('administrator', '/widget/carousel-item/*'),
('administrator', '/widget/carousel-item/create'),
('administrator', '/widget/carousel-item/delete'),
('administrator', '/widget/carousel-item/update'),
('administrator', '/widget/carousel/*'),
('administrator', '/widget/carousel/delete'),
('administrator', '/widget/carousel/index'),
('administrator', '/widget/carousel/update'),
('administrator', '/widget/menu/*'),
('administrator', '/widget/menu/delete'),
('administrator', '/widget/menu/index'),
('administrator', '/widget/menu/update'),
('administrator', '/widget/text/*'),
('administrator', '/widget/text/delete'),
('administrator', '/widget/text/index'),
('administrator', '/widget/text/update'),
('administrator', 'loginToBackend');

-- --------------------------------------------------------

--
-- Table structure for table `rbac_auth_rule`
--

CREATE TABLE `rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_db_migration`
--

CREATE TABLE `system_db_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_db_migration`
--

INSERT INTO `system_db_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1576583908),
('m140703_123000_user', 1576583915),
('m140703_123055_log', 1576583916),
('m140703_123104_page', 1576583917),
('m140703_123803_article', 1576583923),
('m140703_123813_rbac', 1576583925),
('m140709_173306_widget_menu', 1576583926),
('m140709_173333_widget_text', 1576583927),
('m140712_123329_widget_carousel', 1576583929),
('m140805_084745_key_storage_item', 1576583930),
('m141012_101932_i18n_tables', 1576583932),
('m150318_213934_file_storage_item', 1576583933),
('m150414_195800_timeline_event', 1576583933),
('m150725_192740_seed_data', 1576583935),
('m150929_074021_article_attachment_order', 1576583936),
('m160203_095604_user_token', 1576583936),
('m190130_155645_add_article_slug_index', 1576583939);

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timeline_event`
--

CREATE TABLE `timeline_event` (
  `id` int(11) NOT NULL,
  `application` varchar(64) NOT NULL,
  `category` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeline_event`
--

INSERT INTO `timeline_event` (`id`, `application`, `category`, `event`, `data`, `created_at`) VALUES
(1, 'frontend', 'user', 'signup', '{\"public_identity\":\"webmaster\",\"user_id\":1,\"created_at\":1576583933}', 1576583933),
(2, 'frontend', 'user', 'signup', '{\"public_identity\":\"manager\",\"user_id\":2,\"created_at\":1576583933}', 1576583933),
(3, 'frontend', 'user', 'signup', '{\"public_identity\":\"user\",\"user_id\":3,\"created_at\":1576583933}', 1576583933);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `auth_key` varchar(32) NOT NULL,
  `access_token` varchar(40) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `oauth_client` varchar(255) DEFAULT NULL,
  `oauth_client_user_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `logged_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `access_token`, `password_hash`, `oauth_client`, `oauth_client_user_id`, `email`, `status`, `created_at`, `updated_at`, `logged_at`) VALUES
(1, 'webmaster', 'PMNjVwmRYcYXIgvrX8_ygNeEoTX3Z00B', 'IBgThT_9xkaPkyn7r2yospoudCrfz0VpNMozji3x', '$2y$13$Rt88b8lWosYbbiQHBpKUHuvIryYUZLEr2DckxRrEwH.EQK8p4TiVu', NULL, NULL, 'webmaster@example.com', 2, 1576583934, 1576583934, 1576584179),
(2, 'manager', 'VcGAm2GYUpw0MK27maRlgs-V2uIaHz9D', 'OPhJ_CJ4d0e60yxUBg4pyweD37iN7wwg2s-SOG4w', '$2y$13$ydexNZihuS3kaOAsn.RPr.IiO9WjCmdKhO2gp684/ZxhTiqlC1P9i', NULL, NULL, 'manager@example.com', 2, 1576583934, 1576583934, NULL),
(3, 'user', 'WzVthAH5AvKnukglcGg6khxY7ezzvbiy', 'DVfNtfS0yY-kt15sghF0gZeV0am1VsGNcJgLEvkx', '$2y$13$9yh055cbIn9lFTszDrxleOoyttciZXfD6hbgoOx0X/17hBmVSI0Qq', NULL, NULL, 'user@example.com', 2, 1576583935, 1576583935, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `avatar_base_url` varchar(255) DEFAULT NULL,
  `locale` varchar(32) NOT NULL,
  `gender` smallint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`user_id`, `firstname`, `middlename`, `lastname`, `avatar_path`, `avatar_base_url`, `locale`, `gender`) VALUES
(1, 'John', NULL, 'Doe', NULL, NULL, 'en-US', NULL),
(2, NULL, NULL, NULL, NULL, NULL, 'en-US', NULL),
(3, NULL, NULL, NULL, NULL, NULL, 'en-US', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(40) NOT NULL,
  `expire_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `widget_carousel`
--

CREATE TABLE `widget_carousel` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `status` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `widget_carousel`
--

INSERT INTO `widget_carousel` (`id`, `key`, `status`) VALUES
(1, 'index', 1);

-- --------------------------------------------------------

--
-- Table structure for table `widget_carousel_item`
--

CREATE TABLE `widget_carousel_item` (
  `id` int(11) NOT NULL,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `asset_url` varchar(1024) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `caption` varchar(1024) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `widget_carousel_item`
--

INSERT INTO `widget_carousel_item` (`id`, `carousel_id`, `base_url`, `path`, `asset_url`, `type`, `url`, `caption`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'http://192.168.1.13/laundry', 'img/yii2-starter-kit.gif', 'http://192.168.1.13/laundry/img/yii2-starter-kit.gif', 'image/gif', '/', NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `widget_menu`
--

CREATE TABLE `widget_menu` (
  `id` int(11) NOT NULL,
  `key` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `items` text NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `widget_menu`
--

INSERT INTO `widget_menu` (`id`, `key`, `title`, `items`, `status`) VALUES
(1, 'frontend-index', 'Frontend index menu', '[\n    {\n        \"label\": \"Get started with Yii2\",\n        \"url\": \"http://www.yiiframework.com\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-success\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Yii2 Starter Kit on GitHub\",\n        \"url\": \"https://github.com/yii2-starter-kit/yii2-starter-kit\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-primary\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Find a bug?\",\n        \"url\": \"https://github.com/yii2-starter-kit/yii2-starter-kit/issues\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-danger\\\">{label}</a>\"\n    }\n]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `widget_text`
--

CREATE TABLE `widget_text` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `widget_text`
--

INSERT INTO `widget_text` (`id`, `key`, `title`, `body`, `status`, `created_at`, `updated_at`) VALUES
(1, 'backend_welcome', 'Welcome to backend', '<p>Welcome to Yii2 Starter Kit Dashboard</p>', 1, 1576583935, 1576583935),
(2, 'ads-example', 'Google Ads Example Block', '<div class=\"lead\">\n                <script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\n                <ins class=\"adsbygoogle\"\n                     style=\"display:block\"\n                     data-ad-client=\"ca-pub-9505937224921657\"\n                     data-ad-slot=\"2264361777\"\n                     data-ad-format=\"auto\"></ins>\n                <script>\n                (adsbygoogle = window.adsbygoogle || []).push({});\n                </script>\n            </div>', 0, 1576583935, 1576583935);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_article_slug` (`slug`),
  ADD KEY `fk_article_author` (`created_by`),
  ADD KEY `fk_article_updater` (`updated_by`),
  ADD KEY `fk_article_category` (`category_id`);

--
-- Indexes for table `article_attachment`
--
ALTER TABLE `article_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_attachment_article` (`article_id`);

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_article_category_slug` (`slug`),
  ADD KEY `fk_article_category_section` (`parent_id`);

--
-- Indexes for table `file_storage_item`
--
ALTER TABLE `file_storage_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `i18n_message`
--
ALTER TABLE `i18n_message`
  ADD PRIMARY KEY (`id`,`language`);

--
-- Indexes for table `i18n_source_message`
--
ALTER TABLE `i18n_source_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `key_storage_item`
--
ALTER TABLE `key_storage_item`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `idx_key_storage_item_key` (`key`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rbac_auth_assignment`
--
ALTER TABLE `rbac_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `rbac_auth_item`
--
ALTER TABLE `rbac_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `rbac_auth_item_child`
--
ALTER TABLE `rbac_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `rbac_auth_rule`
--
ALTER TABLE `rbac_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `system_db_migration`
--
ALTER TABLE `system_db_migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_level` (`level`),
  ADD KEY `idx_log_category` (`category`);

--
-- Indexes for table `timeline_event`
--
ALTER TABLE `timeline_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widget_carousel`
--
ALTER TABLE `widget_carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widget_carousel_item`
--
ALTER TABLE `widget_carousel_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_carousel` (`carousel_id`);

--
-- Indexes for table `widget_menu`
--
ALTER TABLE `widget_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widget_text`
--
ALTER TABLE `widget_text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_widget_text_key` (`key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `article_attachment`
--
ALTER TABLE `article_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `file_storage_item`
--
ALTER TABLE `file_storage_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `i18n_source_message`
--
ALTER TABLE `i18n_source_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `system_log`
--
ALTER TABLE `system_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timeline_event`
--
ALTER TABLE `timeline_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `widget_carousel`
--
ALTER TABLE `widget_carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `widget_carousel_item`
--
ALTER TABLE `widget_carousel_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `widget_menu`
--
ALTER TABLE `widget_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `widget_text`
--
ALTER TABLE `widget_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_author` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_article_updater` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `article_attachment`
--
ALTER TABLE `article_attachment`
  ADD CONSTRAINT `fk_article_attachment_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `article_category`
--
ALTER TABLE `article_category`
  ADD CONSTRAINT `fk_article_category_section` FOREIGN KEY (`parent_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `i18n_message`
--
ALTER TABLE `i18n_message`
  ADD CONSTRAINT `fk_i18n_message_source_message` FOREIGN KEY (`id`) REFERENCES `i18n_source_message` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rbac_auth_assignment`
--
ALTER TABLE `rbac_auth_assignment`
  ADD CONSTRAINT `rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rbac_auth_item`
--
ALTER TABLE `rbac_auth_item`
  ADD CONSTRAINT `rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `rbac_auth_item_child`
--
ALTER TABLE `rbac_auth_item_child`
  ADD CONSTRAINT `rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_carousel_item`
--
ALTER TABLE `widget_carousel_item`
  ADD CONSTRAINT `fk_item_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `widget_carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
