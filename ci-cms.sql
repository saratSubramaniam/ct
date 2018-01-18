-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2018 at 02:53 PM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci-cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_admins`
--

DROP TABLE IF EXISTS `ci_admins`;
CREATE TABLE IF NOT EXISTS `ci_admins` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT '',
  `module` varchar(100) DEFAULT '',
  `level` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_admins`
--

INSERT INTO `ci_admins` (`id`, `username`, `module`, `level`) VALUES
(1, 'admin', 'admin', 4),
(2, 'admin', 'page', 3),
(3, 'admin', 'module', 4),
(4, 'admin', 'news', 4),
(5, 'admin', 'member', 4),
(6, 'admin', 'language', 4),
(7, 'admin', 'campaigns', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ci_campaigns`
--

DROP TABLE IF EXISTS `ci_campaigns`;
CREATE TABLE IF NOT EXISTS `ci_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `quantity` decimal(5,0) NOT NULL DEFAULT '0',
  `unit` varchar(50) DEFAULT NULL,
  `institute` text,
  `enddate` date DEFAULT NULL,
  `contact` text,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `comments` int(4) NOT NULL DEFAULT '0',
  `status` int(3) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notify` tinyint(4) NOT NULL,
  `hit` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_campaigns`
--

INSERT INTO `ci_campaigns` (`id`, `cat`, `title`, `uri`, `lang`, `body`, `quantity`, `unit`, `institute`, `enddate`, `contact`, `allow_comments`, `comments`, `status`, `date`, `author`, `email`, `notify`, `hit`, `ordering`) VALUES
(1, 1, 'Plastic Chair', 'plastic-chair-1', 'en', '<p><span style="font-family: ">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>', '35', '1', ' Children''s Home for Boys', '2018-12-12', '<p><span style="color: #333333; font-family: ">Children''s Home for Boys</span></p>', 1, 0, 1, 0, 'admin', 'qweqwe@ssefw.com', 1, 0, 0),
(2, 1, 'KURUVA RICE', 'kuruva-rice', 'en', '<p><span style="font-family: ">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</span></p>', '6000', '1', ' Government Mental Health Centre', '2008-12-12', '', 1, 0, 1, 0, 'admin', 'qweqwe@ssefw.com', 1, 0, 0),
(3, 1, 'BERMUDA SHORTS', 'bermuda-shorts-1', 'en', '<h2 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;" id="ContentPlaceHolder1_lbl_head">BERMUDA SHORTS</span></h2>', '200', '1', ' Government Mental Health Centre', '2009-12-12', '<p><span style="color: #333333; font-family: ">Government Mental Health Centre</span></p>', 1, 0, 1, 0, 'admin', 'qweqwe@ssefw.com', 1, 0, 0),
(4, 1, 'T-SHIRT', 't-shirt-1', 'en', '', '200', '1', ' Government Mental Health Centre', '2009-12-12', '<p><span style="color: #333333; font-family: ">Government Mental Health Centre</span></p>', 1, 0, 1, 0, 'admin', 'qweqwe@ssefw.com', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_campaigns_cat`
--

DROP TABLE IF EXISTS `ci_campaigns_cat`;
CREATE TABLE IF NOT EXISTS `ci_campaigns_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `lang` char(5) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `status` int(5) NOT NULL DEFAULT '1',
  `access` varchar(20) NOT NULL DEFAULT '0',
  `uri` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_campaigns_cat`
--

INSERT INTO `ci_campaigns_cat` (`id`, `pid`, `title`, `icon`, `desc`, `date`, `username`, `lang`, `weight`, `status`, `access`, `uri`) VALUES
(1, 0, 'campaign 1', '0', '<p>campaign 1</p>', 0, '0', 'en', 0, 1, '0', 'campaign-1'),
(2, 0, 'test', '0', '<p>test</p>', 1515513118, 'admin', 'en', 0, 1, '0', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `ci_campaigns_comments`
--

DROP TABLE IF EXISTS `ci_campaigns_comments`;
CREATE TABLE IF NOT EXISTS `ci_campaigns_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaigns_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(150) NOT NULL,
  `body` text NOT NULL,
  `ip` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_id` (`campaigns_id`),
  KEY `date` (`date`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_campaigns_tags`
--

DROP TABLE IF EXISTS `ci_campaigns_tags`;
CREATE TABLE IF NOT EXISTS `ci_campaigns_tags` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `campaigns_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_campaigns_tags`
--

INSERT INTO `ci_campaigns_tags` (`id`, `tag`, `uri`, `campaigns_id`) VALUES
(4, 'test', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_captcha`
--

DROP TABLE IF EXISTS `ci_captcha`;
CREATE TABLE IF NOT EXISTS `ci_captcha` (
  `captcha_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(20) DEFAULT '',
  `word` varchar(25) DEFAULT '',
  `captcha_time` int(11) DEFAULT '0',
  PRIMARY KEY (`captcha_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_download_cat`
--

DROP TABLE IF EXISTS `ci_download_cat`;
CREATE TABLE IF NOT EXISTS `ci_download_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `lang` char(5) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `status` int(5) NOT NULL DEFAULT '1',
  `acces` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_download_doc`
--

DROP TABLE IF EXISTS `ci_download_doc`;
CREATE TABLE IF NOT EXISTS `ci_download_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  `file_link` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'link',
  `lang` varchar(10) NOT NULL DEFAULT '',
  `pic` tinytext NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `keywords` text NOT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `hit` mediumint(9) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `acces` varchar(20) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cat` (`cat`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_download_files`
--

DROP TABLE IF EXISTS `ci_download_files`;
CREATE TABLE IF NOT EXISTS `ci_download_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `date` int(11) NOT NULL,
  `size` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_download_settings`
--

DROP TABLE IF EXISTS `ci_download_settings`;
CREATE TABLE IF NOT EXISTS `ci_download_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_download_settings`
--

INSERT INTO `ci_download_settings` (`id`, `name`, `value`) VALUES
(1, 'allowed_file_types', 'gif|jpg|png|bmp|doc|docx|xls|mp3|swf|exe|pdf|wav|zip'),
(2, 'upload_path', './media/files/');

-- --------------------------------------------------------

--
-- Table structure for table `ci_forum_admins`
--

DROP TABLE IF EXISTS `ci_forum_admins`;
CREATE TABLE IF NOT EXISTS `ci_forum_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` varchar(20) NOT NULL,
  `date` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `level` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_forum_messages`
--

DROP TABLE IF EXISTS `ci_forum_messages`;
CREATE TABLE IF NOT EXISTS `ci_forum_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pid` varchar(20) NOT NULL,
  `tid` varchar(20) NOT NULL,
  `date` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `last_date` int(11) NOT NULL,
  `replies` int(11) NOT NULL,
  `last_username` varchar(100) NOT NULL,
  `last_mid` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL,
  `notify` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `mid` (`mid`),
  KEY `pid` (`pid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_forum_settings`
--

DROP TABLE IF EXISTS `ci_forum_settings`;
CREATE TABLE IF NOT EXISTS `ci_forum_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_forum_settings`
--

INSERT INTO `ci_forum_settings` (`id`, `name`, `value`) VALUES
(1, 'style', 'blue');

-- --------------------------------------------------------

--
-- Table structure for table `ci_forum_topics`
--

DROP TABLE IF EXISTS `ci_forum_topics`;
CREATE TABLE IF NOT EXISTS `ci_forum_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `date` int(11) NOT NULL,
  `gid` varchar(20) NOT NULL,
  `last_date` int(11) NOT NULL,
  `messages` int(11) NOT NULL,
  `last_username` varchar(100) NOT NULL,
  `last_mid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_freeback`
--

DROP TABLE IF EXISTS `ci_freeback`;
CREATE TABLE IF NOT EXISTS `ci_freeback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `lang` char(5) DEFAULT 'en',
  `status` tinyint(1) DEFAULT '1',
  `email` varchar(255) DEFAULT '',
  `weight` int(3) DEFAULT '0',
  `hit` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_groups`
--

DROP TABLE IF EXISTS `ci_groups`;
CREATE TABLE IF NOT EXISTS `ci_groups` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `g_id` varchar(50) DEFAULT '',
  `g_owner` varchar(50) DEFAULT '',
  `g_name` varchar(255) DEFAULT '',
  `g_date` int(11) DEFAULT '0',
  `g_desc` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `g_id_g_name` (`g_id`,`g_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_groups`
--

INSERT INTO `ci_groups` (`id`, `g_id`, `g_owner`, `g_name`, `g_date`, `g_desc`) VALUES
(1, '0', '', 'Everybody', 0, 'This is everybody who visits the site including non members'),
(2, '1', '', 'Members Only', 0, 'This is everybody who is member of the site'),
(3, 'g5a4e38935d50d', 'admin', 'Owners', 1515075731, '<p>Site Owners</p>');

-- --------------------------------------------------------

--
-- Table structure for table `ci_group_members`
--

DROP TABLE IF EXISTS `ci_group_members`;
CREATE TABLE IF NOT EXISTS `ci_group_members` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `g_id` varchar(50) DEFAULT '',
  `g_user` varchar(50) DEFAULT '',
  `g_to` int(11) DEFAULT '0',
  `g_from` int(11) DEFAULT '0',
  `g_date` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `g_member_g_id` (`g_user`,`g_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_guestbook_posts`
--

DROP TABLE IF EXISTS `ci_guestbook_posts`;
CREATE TABLE IF NOT EXISTS `ci_guestbook_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(255) NOT NULL DEFAULT '',
  `g_site` varchar(255) NOT NULL DEFAULT '',
  `g_email` varchar(255) NOT NULL DEFAULT '',
  `g_ip` varchar(255) NOT NULL DEFAULT '',
  `g_msg` text NOT NULL,
  `g_date` int(11) NOT NULL DEFAULT '0',
  `g_country` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `g_name` (`g_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_guestbook_settings`
--

DROP TABLE IF EXISTS `ci_guestbook_settings`;
CREATE TABLE IF NOT EXISTS `ci_guestbook_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_images`
--

DROP TABLE IF EXISTS `ci_images`;
CREATE TABLE IF NOT EXISTS `ci_images` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` varchar(100) DEFAULT '',
  `file` varchar(255) DEFAULT '',
  `info` text,
  `src_id` int(11) DEFAULT '0',
  `ordering` int(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_images`
--

INSERT INTO `ci_images` (`id`, `module`, `file`, `info`, `src_id`, `ordering`) VALUES
(1, 'news', 'Chrysanthemum.jpg', NULL, 5, 0),
(2, 'news', 'Jellyfish.jpg', NULL, 5, 0),
(3, 'news', '01_home_04.jpg', NULL, 1, 0),
(4, 'news', '01_home_04_4.jpg', NULL, 2, 0),
(5, 'news', '01_home_04_3.jpg', NULL, 3, 0),
(6, 'campaigns', '01_home_04_41.jpg', NULL, 4, 0),
(7, 'campaigns', 'Chrysanthemum1.jpg', NULL, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_languages`
--

DROP TABLE IF EXISTS `ci_languages`;
CREATE TABLE IF NOT EXISTS `ci_languages` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` char(5) DEFAULT NULL,
  `name` varchar(100) DEFAULT '',
  `ordering` int(5) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `default` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_languages`
--

INSERT INTO `ci_languages` (`id`, `code`, `name`, `ordering`, `active`, `default`) VALUES
(1, 'en', 'English', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_modules`
--

DROP TABLE IF EXISTS `ci_modules`;
CREATE TABLE IF NOT EXISTS `ci_modules` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `with_admin` tinyint(1) DEFAULT '0',
  `version` varchar(50) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `ordering` int(4) DEFAULT '0',
  `info` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_modules`
--

INSERT INTO `ci_modules` (`id`, `name`, `with_admin`, `version`, `status`, `ordering`, `info`, `description`) VALUES
(1, 'admin', 0, '1.2.0', 1, 5, '', 'Admin core module'),
(2, 'module', 0, '1.0.0', 1, 20, '', 'Module core module'),
(3, 'page', 1, '2.1.0', 1, 60, '', 'Page core module'),
(4, 'language', 1, '1.1.0', 1, 10, '', 'Language core module'),
(5, 'member', 1, '1.0.0', 1, 30, '', 'Member core module'),
(6, 'search', 0, '1.0.0', 1, 50, '', 'Search core module'),
(7, 'news', 1, '2.1.0', 1, 101, '', 'News module'),
(8, 'welcome', 0, '1.0.0', 1, 1000, 'a:5:{s:4:"date";s:10:"12/02/2011";s:6:"author";s:7:"rmorgan";s:5:"email";s:31:"rmorgan@bitterrootwebdesign.com";s:3:"url";s:34:"http://www.bitterrootwebdesign.com";s:9:"copyright";s:15:"GNU/GPL License";}', 'Module for testing installation'),
(9, 'freeback', 1, '1.0.0', 1, 1000, 'a:5:{s:4:"date";s:10:"10/09/2009";s:6:"author";s:11:"Michail1982";s:5:"email";s:21:"michail1982@gmail.com";s:3:"url";s:24:"http://michail1982.pp.ua";s:9:"copyright";s:15:"GNU/GPL License";}', 'Freeback module'),
(16, 'campaigns', 1, '1.0.0', 1, 1000, 'a:5:{s:4:"date";s:10:"04/01/2018";s:6:"author";s:6:"Sajeev";s:5:"email";s:21:"sajeevsalim@gmail.com";s:3:"url";s:0:"";s:9:"copyright";s:15:"GNU/GPL License";}', 'Campaigns module');

-- --------------------------------------------------------

--
-- Table structure for table `ci_navigation`
--

DROP TABLE IF EXISTS `ci_navigation`;
CREATE TABLE IF NOT EXISTS `ci_navigation` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `weight` int(3) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `g_id` varchar(20) DEFAULT '0',
  `uri` varchar(255) DEFAULT '',
  `lang` char(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `weight` (`weight`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_navigation`
--

INSERT INTO `ci_navigation` (`id`, `parent_id`, `active`, `weight`, `title`, `g_id`, `uri`, `lang`) VALUES
(1, 19, 1, 0, 'Menu', '0', '', 'en'),
(2, 0, 1, 0, 'Home', '0', '/', 'en'),
(3, 1, 1, 0, 'About', '0', 'about', 'en'),
(20, 0, 1, 0, 'leftmenu', '0', '', 'fr'),
(4, 20, 1, 0, 'Menu', '0', '', 'fr'),
(5, 4, 1, 0, 'Accueil', '0', 'home', 'fr'),
(6, 4, 1, 0, 'A propos', '0', 'about', 'fr'),
(21, 0, 1, 0, 'leftmenu', '0', '', 'it'),
(7, 21, 1, 0, 'Menu', '0', '', 'it'),
(8, 7, 1, 0, 'Home', '0', 'home', 'it'),
(9, 7, 1, 0, 'About', '0', 'about', 'it'),
(10, 0, 1, 2, 'About Us', '0', 'about', 'en'),
(11, 0, 1, 1, 'Contact us', '0', 'contact-us', 'en'),
(12, 0, 1, 3, 'Donate', '0', 'campaigns', 'en'),
(13, 0, 1, 0, 'topmenu', '0', '', 'fr'),
(14, 13, 1, 0, 'Contact us', '0', 'contact-us', 'fr'),
(15, 13, 1, 0, 'Google', '0', 'http://google.com', 'fr'),
(16, 0, 1, 0, 'topmenu', '0', '', 'it'),
(17, 16, 1, 0, 'Contact us', '0', 'contact-us', 'it'),
(18, 16, 1, 0, 'Google', '0', 'http://google.com', 'it');

-- --------------------------------------------------------

--
-- Table structure for table `ci_news`
--

DROP TABLE IF EXISTS `ci_news`;
CREATE TABLE IF NOT EXISTS `ci_news` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `uri` varchar(255) DEFAULT '',
  `lang` varchar(10) DEFAULT '',
  `author` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `body` text,
  `cat` int(11) DEFAULT '0',
  `allow_comments` int(11) DEFAULT '0',
  `comments` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `date` int(11) DEFAULT '0',
  `hit` int(11) DEFAULT '0',
  `notify` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat` (`cat`),
  KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_news`
--

INSERT INTO `ci_news` (`id`, `title`, `uri`, `lang`, `author`, `email`, `body`, `cat`, `allow_comments`, `comments`, `status`, `date`, `hit`, `notify`, `ordering`) VALUES
(1, 'Who We Are', 'who-we-are', 'en', 'admin', 'qweqwe@ssefw.com', '<div class="subtitle" style="box-sizing: border-box; margin: 23px 0px 0px; padding: 0px; font-size: 18px; font-weight: 600; color: #82888d;"><span style="font-family: arial;">Vision</span></div>\r\n\n<div class="description" style="box-sizing: border-box; margin: 20px 0px 30px; padding: 0px; color: #82888d; font-size: 15px;"><span style="font-family: arial;">Our vision is nothing less than realizing the full potential of the Internet - universal access to research and education, full participation in culture - to drive a new era of development, growth, and productivity. To implement sustainable programs that improve access worldwide to investment, opportunity, and lifesaving services now and for future generations.</span></div>', 0, 1, 0, 1, 1515513404, 0, 1, 0),
(2, 'Our Foundation', 'our-foundation', 'en', 'admin', 'qweqwe@ssefw.com', '<p><span style="color: #222222; font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap;">We are transparent in all our charity activities. If you want to be a part of us, want to ask for help for yourself or other people, or any question that you want to ask, let us kn​ow...</span></p>', 0, 1, 0, 1, 1515513504, 0, 1, 0),
(3, 'Ways to Give', 'ways-to-give', 'en', 'admin', 'qweqwe@ssefw.com', '<p><span style="color: #222222; font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; white-space: pre-wrap;">There are many causes that need help, you can raise your funds for a cause that you care or give your donations by participating directly in our charity events...</span></p>', 0, 1, 0, 1, 1515513543, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_news_cat`
--

DROP TABLE IF EXISTS `ci_news_cat`;
CREATE TABLE IF NOT EXISTS `ci_news_cat` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `lang` varchar(255) DEFAULT '',
  `uri` varchar(255) DEFAULT '',
  `username` varchar(100) DEFAULT '',
  `access` varchar(100) DEFAULT '0',
  `icon` varchar(100) DEFAULT '',
  `desc` text,
  `weight` int(11) DEFAULT '0',
  `date` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `uri` (`uri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_news_comments`
--

DROP TABLE IF EXISTS `ci_news_comments`;
CREATE TABLE IF NOT EXISTS `ci_news_comments` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `website` varchar(255) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `author` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `body` text,
  `status` int(11) DEFAULT '0',
  `date` int(11) DEFAULT '0',
  `news_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `author` (`author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_news_tags`
--

DROP TABLE IF EXISTS `ci_news_tags`;
CREATE TABLE IF NOT EXISTS `ci_news_tags` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `news_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_pages`
--

DROP TABLE IF EXISTS `ci_pages`;
CREATE TABLE IF NOT EXISTS `ci_pages` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `weight` int(3) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `uri` varchar(255) NOT NULL,
  `lang` char(5) DEFAULT 'en',
  `meta_keywords` varchar(255) DEFAULT '',
  `meta_description` text,
  `body` longtext,
  `hit` int(11) DEFAULT '0',
  `options` text,
  `email` varchar(255) DEFAULT '',
  `date` int(11) DEFAULT '1512291828',
  `username` varchar(255) DEFAULT '',
  `g_id` varchar(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `active` (`active`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_pages`
--

INSERT INTO `ci_pages` (`id`, `parent_id`, `active`, `weight`, `title`, `uri`, `lang`, `meta_keywords`, `meta_description`, `body`, `hit`, `options`, `email`, `date`, `username`, `g_id`) VALUES
(1, 0, 1, 0, 'This is just a test', 'home', 'en', '', NULL, '<p>This is how it looks in <b>English</b>. To modify this text go to  <i>admin/pages</i>', 7, 'a:4:{s:13:"show_subpages";s:1:"1";s:15:"show_navigation";s:1:"1";s:14:"allow_comments";s:1:"0";s:6:"notify";s:1:"0";}', '', 1512291828, '', '0'),
(2, 0, 1, 0, 'About page', 'about', 'en', '', NULL, '<p>About this site..</p>', 3, 'a:4:{s:13:"show_subpages";s:1:"1";s:15:"show_navigation";s:1:"1";s:14:"allow_comments";s:1:"0";s:6:"notify";s:1:"0";}', '', 1512291828, '', '0'),
(3, 0, 1, 0, 'This is just a test', 'home', 'fr', '', NULL, '<p>This is how it looks in <b>French</b>. To modify this text go to  <i>admin/pages</i>', 0, 'a:4:{s:13:"show_subpages";s:1:"1";s:15:"show_navigation";s:1:"1";s:14:"allow_comments";s:1:"0";s:6:"notify";s:1:"0";}', '', 1512291828, '', '0'),
(4, 0, 1, 0, 'About page', 'about', 'fr', '', NULL, '<p>About this site..</p>', 0, 'a:4:{s:13:"show_subpages";s:1:"1";s:15:"show_navigation";s:1:"1";s:14:"allow_comments";s:1:"0";s:6:"notify";s:1:"0";}', '', 1512291828, '', '0'),
(5, 0, 1, 0, 'This is just a test', 'home', 'it', '', NULL, '<p>This is how it looks in <b>Italian</b>. To modify this text go to  <i>admin/pages</i>', 0, 'a:4:{s:13:"show_subpages";s:1:"1";s:15:"show_navigation";s:1:"1";s:14:"allow_comments";s:1:"0";s:6:"notify";s:1:"0";}', '', 1512291828, '', '0'),
(6, 0, 1, 0, 'About page', 'about', 'it', '', NULL, '<p>About this site..</p>', 0, 'a:4:{s:13:"show_subpages";s:1:"1";s:15:"show_navigation";s:1:"1";s:14:"allow_comments";s:1:"0";s:6:"notify";s:1:"0";}', '', 1512291828, '', '0'),
(7, 0, 1, 0, 'test', 'test', 'en', '', '', '', 0, 'a:4:{s:13:"show_subpages";s:1:"0";s:15:"show_navigation";s:1:"0";s:14:"allow_comments";s:1:"0";s:6:"notify";s:1:"0";}', '', 1515511982, '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `ci_page_comments`
--

DROP TABLE IF EXISTS `ci_page_comments`;
CREATE TABLE IF NOT EXISTS `ci_page_comments` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `weight` int(3) DEFAULT '0',
  `author` varchar(255) DEFAULT '',
  `website` varchar(255) DEFAULT '',
  `body` text,
  `email` varchar(255) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `date` int(11) DEFAULT '1512291828',
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_search_results`
--

DROP TABLE IF EXISTS `ci_search_results`;
CREATE TABLE IF NOT EXISTS `ci_search_results` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `s_tosearch` varchar(255) DEFAULT '',
  `s_rows` text,
  `s_date` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `s_tosearch` (`s_tosearch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) DEFAULT '0',
  `user_agent` varchar(50) DEFAULT '',
  `last_activity` int(10) DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_settings`
--

DROP TABLE IF EXISTS `ci_settings`;
CREATE TABLE IF NOT EXISTS `ci_settings` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '0',
  `value` text,
  `base_url` varchar(100) DEFAULT 'http://localhost:8000/ci-cms-master/',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `base_url` (`base_url`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_settings`
--

INSERT INTO `ci_settings` (`id`, `name`, `value`, `base_url`) VALUES
(1, 'site_name', 'Compassionate Trivandrum', 'http://localhost:8000/ci-cms-master/'),
(2, 'meta_keywords', 'Compassionate, Trivandrum', 'http://localhost:8000/ci-cms-master/'),
(3, 'meta_description', 'Compassionate Trivandrum', 'http://localhost:8000/ci-cms-master/'),
(4, 'cache', '0', 'http://localhost:8000/ci-cms-master/'),
(5, 'cache_time', '300', 'http://localhost:8000/ci-cms-master/'),
(6, 'theme_dir', 'themes/', 'http://localhost:8000/ci-cms-master/'),
(7, 'theme', 'aamada', 'http://localhost:8000/ci-cms-master/'),
(8, 'template', 'index', 'http://localhost:8000/ci-cms-master/'),
(9, 'page_home', 'home', 'http://localhost:8000/ci-cms-master/'),
(10, 'debug', '0', 'http://localhost:8000/ci-cms-master/'),
(11, 'version', '2.1.0.1', 'http://localhost:8000/ci-cms-master/'),
(12, 'page_approve_comments', '1', 'http://localhost:8000/ci-cms-master/'),
(13, 'page_notify_admin', '1', 'http://localhost:8000/ci-cms-master/'),
(14, 'news_settings', 'a:2:{s:14:"allow_comments";i:1;s:16:"approve_comments";i:1;}', 'http://localhost:8000/ci-cms-master/'),
(15, 'admin_email', '', 'http://localhost:8000/ci-cms-master/'),
(16, 'campaigns_settings', 'a:4:{s:14:"use_alt_header";s:1:"0";s:14:"allow_comments";s:1:"1";s:16:"approve_comments";s:1:"1";s:12:"notify_admin";s:1:"0";}', 'http://localhost:8000/ci-cms-master/');

-- --------------------------------------------------------

--
-- Table structure for table `ci_tag_items`
--

DROP TABLE IF EXISTS `ci_tag_items`;
CREATE TABLE IF NOT EXISTS `ci_tag_items` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `lang` char(5) DEFAULT NULL,
  `srcid` int(11) DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `summary` text,
  `hit` int(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_users`
--

DROP TABLE IF EXISTS `ci_users`;
CREATE TABLE IF NOT EXISTS `ci_users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '',
  `password` varchar(50) DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `status` varchar(10) DEFAULT 'active',
  `lastvisit` int(11) DEFAULT '0',
  `registered` int(11) DEFAULT '0',
  `online` int(1) DEFAULT '0',
  `activation` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_users`
--

INSERT INTO `ci_users` (`id`, `username`, `password`, `email`, `status`, `lastvisit`, `registered`, `online`, `activation`) VALUES
(1, 'admin', '4afa0a5f21c77a50203e126aead155fa6642e5d8', 'qweqwe@ssefw.com', 'active', 1516282962, 1512291932, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `ci_user_persistence`
--

DROP TABLE IF EXISTS `ci_user_persistence`;
CREATE TABLE IF NOT EXISTS `ci_user_persistence` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(50) DEFAULT '0',
  `token` varchar(255) DEFAULT '',
  `series` varchar(255) DEFAULT '',
  `date` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
