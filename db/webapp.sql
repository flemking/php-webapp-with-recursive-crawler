-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 28, 2023 at 05:46 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `postTitle` varchar(200) NOT NULL,
  `postDesc` varchar(10000) NOT NULL,
  `postTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `postTag` varchar(40) NOT NULL,
  `postAuthor` varchar(40) NOT NULL,
  `post_img` varchar(255) NOT NULL DEFAULT '/img/news-700x435-2.jpg',
  `post_cat` varchar(255) NOT NULL DEFAULT 'business'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `postTitle`, `postDesc`, `postTime`, `postTag`, `postAuthor`, `post_img`, `post_cat`) VALUES
(1, 'News in Laravel', '<h1 class=\"mb-3 text-secondary text-uppercase font-weight-bold\">Lorem ipsum dolor sit amet elit vitae porta diam...</h1>\r\n                        <p>Sadipscing labore amet rebum est et justo gubergren. Et eirmod ipsum sit diam ut\r\n                            magna lorem. Nonumy vero labore lorem sanctus rebum et lorem magna kasd, stet\r\n                            amet magna accusam consetetur eirmod. Kasd accusam sit ipsum sadipscing et at at\r\n                            sanctus et. Ipsum sit gubergren dolores et, consetetur justo invidunt at et\r\n                            aliquyam ut et vero clita. Diam sea sea no sed dolores diam nonumy, gubergren\r\n                            sit stet no diam kasd vero.</p>\r\n<a href=\"/index.php\">Homepage</a>\r\n                        <p>Voluptua est takimata stet invidunt sed rebum nonumy stet, clita aliquyam dolores\r\n                            vero stet consetetur elitr takimata rebum sanctus. Sit sed accusam stet sit\r\n                            nonumy kasd diam dolores, sanctus lorem kasd duo dolor dolor vero sit et. Labore\r\n                            ipsum duo sanctus amet eos et. Consetetur no sed et aliquyam ipsum justo et,\r\n                            clita lorem sit vero amet amet est dolor elitr, stet et no diam sit. Dolor erat\r\n                            justo dolore sit invidunt.</p>\r\n                        <h3 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h3>\r\n                        <img class=\"img-fluid w-50 float-left mr-4 mb-2\" src=\"img/news-800x500-1.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et.</p>\r\n                        <h5 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h5>\r\n                        <img class=\"img-fluid w-50 float-right mr-4 mb-2\" src=\"img/news-800x500-2.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et. Takimata kasd diam justo est eos erat\r\n                            aliquyam et ut.</p>', '2023-08-28 15:42:56', '', 'admin', '/img/news-800x500-2.jpg', 'Dev'),
(2, 'News in PHP', '<h1 class=\"mb-3 text-secondary text-uppercase font-weight-bold\">Lorem ipsum dolor sit amet elit vitae porta diam...</h1>\r\n                        <p>Sadipscing labore amet rebum est et justo gubergren. Et eirmod ipsum sit diam ut\r\n                            magna lorem. Nonumy vero labore lorem sanctus rebum et lorem magna kasd, stet\r\n                            amet magna accusam consetetur eirmod. Kasd accusam sit ipsum sadipscing et at at\r\n                            sanctus et. Ipsum sit gubergren dolores et, consetetur justo invidunt at et\r\n                            aliquyam ut et vero clita. Diam sea sea no sed dolores diam nonumy, gubergren\r\n                            sit stet no diam kasd vero.</p>\r\n                        <p>Voluptua est takimata stet invidunt sed rebum nonumy stet, clita aliquyam dolores\r\n                            vero stet consetetur elitr takimata rebum sanctus. Sit sed accusam stet sit\r\n                            nonumy kasd diam dolores, sanctus lorem kasd duo dolor dolor vero sit et. Labore\r\n                            ipsum duo sanctus amet eos et. Consetetur no sed et aliquyam ipsum justo et,\r\n                            clita lorem sit vero amet amet est dolor elitr, stet et no diam sit. Dolor erat\r\n                            justo dolore sit invidunt.</p>\r\n                        <h3 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h3>\r\n                        <img class=\"img-fluid w-50 float-left mr-4 mb-2\" src=\"img/news-800x500-1.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et.</p>\r\n                        <h5 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h5>\r\n                        <img class=\"img-fluid w-50 float-right mr-4 mb-2\" src=\"img/news-800x500-2.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et. Takimata kasd diam justo est eos erat\r\n                            aliquyam et ut.</p>', '2023-08-24 09:54:46', '', 'admin', '/img/news-800x500-3.jpg', 'Dev'),
(3, 'Tailwind is the new CSS', '<h1 class=\"mb-3 text-secondary text-uppercase font-weight-bold\">Lorem ipsum dolor sit amet elit vitae porta diam...</h1>\r\n                        <p>Sadipscing labore amet rebum est et justo gubergren. Et eirmod ipsum sit diam ut\r\n                            magna lorem. Nonumy vero labore lorem sanctus rebum et lorem magna kasd, stet\r\n                            amet magna accusam consetetur eirmod. Kasd accusam sit ipsum sadipscing et at at\r\n                            sanctus et. Ipsum sit gubergren dolores et, consetetur justo invidunt at et\r\n                            aliquyam ut et vero clita. Diam sea sea no sed dolores diam nonumy, gubergren\r\n                            sit stet no diam kasd vero.</p>\r\n                        <p>Voluptua est takimata stet invidunt sed rebum nonumy stet, clita aliquyam dolores\r\n                            vero stet consetetur elitr takimata rebum sanctus. Sit sed accusam stet sit\r\n                            nonumy kasd diam dolores, sanctus lorem kasd duo dolor dolor vero sit et. Labore\r\n                            ipsum duo sanctus amet eos et. Consetetur no sed et aliquyam ipsum justo et,\r\n                            clita lorem sit vero amet amet est dolor elitr, stet et no diam sit. Dolor erat\r\n                            justo dolore sit invidunt.</p>\r\n                        <h3 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h3>\r\n                        <img class=\"img-fluid w-50 float-left mr-4 mb-2\" src=\"img/news-800x500-1.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et.</p>\r\n                        <h5 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h5>\r\n                        <img class=\"img-fluid w-50 float-right mr-4 mb-2\" src=\"img/news-800x500-2.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et. Takimata kasd diam justo est eos erat\r\n                            aliquyam et ut.</p>', '2023-08-24 09:51:46', '', 'admin', '/img/news-700x435-3.jpg', 'Languages'),
(4, 'What\'s new in PHP 8.3', '<h1 class=\"mb-3 text-secondary text-uppercase font-weight-bold\">Lorem ipsum dolor sit amet elit vitae porta diam...</h1>\r\n                        <p>Sadipscing labore amet rebum est et justo gubergren. Et eirmod ipsum sit diam ut\r\n                            magna lorem. Nonumy vero labore lorem sanctus rebum et lorem magna kasd, stet\r\n                            amet magna accusam consetetur eirmod. Kasd accusam sit ipsum sadipscing et at at\r\n                            sanctus et. Ipsum sit gubergren dolores et, consetetur justo invidunt at et\r\n                            aliquyam ut et vero clita. Diam sea sea no sed dolores diam nonumy, gubergren\r\n                            sit stet no diam kasd vero.</p>\r\n                        <p>Voluptua est takimata stet invidunt sed rebum nonumy stet, clita aliquyam dolores\r\n                            vero stet consetetur elitr takimata rebum sanctus. Sit sed accusam stet sit\r\n                            nonumy kasd diam dolores, sanctus lorem kasd duo dolor dolor vero sit et. Labore\r\n                            ipsum duo sanctus amet eos et. Consetetur no sed et aliquyam ipsum justo et,\r\n                            clita lorem sit vero amet amet est dolor elitr, stet et no diam sit. Dolor erat\r\n                            justo dolore sit invidunt.</p>\r\n                        <h3 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h3>\r\n                        <img class=\"img-fluid w-50 float-left mr-4 mb-2\" src=\"img/news-800x500-1.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et.</p>\r\n                        <h5 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h5>\r\n                        <img class=\"img-fluid w-50 float-right mr-4 mb-2\" src=\"img/news-800x500-2.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et. Takimata kasd diam justo est eos erat\r\n                            aliquyam et ut.</p>', '2023-08-24 10:07:46', '', 'admin', '/img/news-800x500-1.jpg', 'Languages'),
(17, 'Protect your functions.php file in WordPress', '<h1 class=\"mb-3 text-secondary text-uppercase font-weight-bold\">Lorem ipsum dolor sit amet elit vitae porta diam...</h1>\r\n                        <p>Sadipscing labore amet rebum est et justo gubergren. Et eirmod ipsum sit diam ut\r\n                            magna lorem. Nonumy vero labore lorem sanctus rebum et lorem magna kasd, stet\r\n                            amet magna accusam consetetur eirmod. Kasd accusam sit ipsum sadipscing et at at\r\n                            sanctus et. Ipsum sit gubergren dolores et, consetetur justo invidunt at et\r\n                            aliquyam ut et vero clita. Diam sea sea no sed dolores diam nonumy, gubergren\r\n                            sit stet no diam kasd vero.</p>\r\n                        <p>Voluptua est takimata stet invidunt sed rebum nonumy stet, clita aliquyam dolores\r\n                            vero stet consetetur elitr takimata rebum sanctus. Sit sed accusam stet sit\r\n                            nonumy kasd diam dolores, sanctus lorem kasd duo dolor dolor vero sit et. Labore\r\n                            ipsum duo sanctus amet eos et. Consetetur no sed et aliquyam ipsum justo et,\r\n                            clita lorem sit vero amet amet est dolor elitr, stet et no diam sit. Dolor erat\r\n                            justo dolore sit invidunt.</p>\r\n                        <h3 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h3>\r\n                        <img class=\"img-fluid w-50 float-left mr-4 mb-2\" src=\"img/news-800x500-1.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et.</p>\r\n                        <h5 class=\"text-uppercase font-weight-bold mb-3\">Lorem ipsum dolor sit amet elit</h5>\r\n                        <img class=\"img-fluid w-50 float-right mr-4 mb-2\" src=\"img/news-800x500-2.jpg\">\r\n                        <p>Diam dolor est labore duo invidunt ipsum clita et, sed et lorem voluptua tempor\r\n                            invidunt at est sanctus sanctus. Clita dolores sit kasd diam takimata justo diam\r\n                            lorem sed. Magna amet sed rebum eos. Clita no magna no dolor erat diam tempor\r\n                            rebum consetetur, sanctus labore sed nonumy diam lorem amet eirmod. No at tempor\r\n                            sea diam kasd, takimata ea nonumy elitr sadipscing gubergren erat. Gubergren at\r\n                            lorem invidunt sadipscing rebum sit amet ut ut, voluptua diam dolores at\r\n                            sadipscing stet. Clita dolor amet dolor ipsum vero ea ea eos. Invidunt sed diam\r\n                            dolores takimata dolor dolore dolore sit. Sit ipsum erat amet lorem et, magna\r\n                            sea at sed et eos. Accusam eirmod kasd lorem clita sanctus ut consetetur et. Et\r\n                            duo tempor sea kasd clita ipsum et. Takimata kasd diam justo est eos erat\r\n                            aliquyam et ut.</p>', '2023-08-24 09:58:46', '', 'admin', '/img/news-700x435-5.jpg', 'WordPress');

-- --------------------------------------------------------

--
-- Table structure for table `sitemap`
--

CREATE TABLE `sitemap` (
  `text` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitemap`
--

INSERT INTO `sitemap` (`text`, `url`, `added_time`) VALUES
('a:4:{s:11:\"contact.php\";a:0:{}s:9:\"login.php\";a:0:{}s:9:\"index.php\";a:0:{}s:15:\"single.php?id=1\";a:0:{}}', 'contact.php', '2023-08-28 17:35:03'),
('a:4:{s:11:\"contact.php\";a:0:{}s:9:\"login.php\";a:0:{}s:9:\"index.php\";a:0:{}s:15:\"single.php?id=1\";a:0:{}}', 'login.php', '2023-08-28 17:35:03'),
('a:8:{s:11:\"contact.php\";a:0:{}s:9:\"login.php\";a:0:{}s:9:\"index.php\";a:0:{}s:15:\"single.php?id=1\";a:0:{}s:15:\"single.php?id=4\";a:0:{}s:16:\"single.php?id=17\";a:0:{}s:15:\"single.php?id=2\";a:0:{}s:15:\"single.php?id=3\";a:0:{}}', 'index.php', '2023-08-28 17:35:03'),
('a:4:{s:11:\"contact.php\";a:0:{}s:9:\"login.php\";a:0:{}s:9:\"index.php\";a:0:{}s:10:\"/index.php\";a:0:{}}', 'single.php?id=1', '2023-08-28 17:35:03'),
('a:4:{s:11:\"contact.php\";a:0:{}s:9:\"login.php\";a:0:{}s:9:\"index.php\";a:0:{}s:15:\"single.php?id=1\";a:0:{}}', 'single.php?id=4', '2023-08-28 17:35:03'),
('a:4:{s:11:\"contact.php\";a:0:{}s:9:\"login.php\";a:0:{}s:9:\"index.php\";a:0:{}s:15:\"single.php?id=1\";a:0:{}}', 'single.php?id=17', '2023-08-28 17:35:03'),
('a:4:{s:11:\"contact.php\";a:0:{}s:9:\"login.php\";a:0:{}s:9:\"index.php\";a:0:{}s:15:\"single.php?id=1\";a:0:{}}', 'single.php?id=2', '2023-08-28 17:35:03'),
('a:4:{s:11:\"contact.php\";a:0:{}s:9:\"login.php\";a:0:{}s:9:\"index.php\";a:0:{}s:15:\"single.php?id=1\";a:0:{}}', 'single.php?id=3', '2023-08-28 17:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `emailid` varchar(40) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usertype` varchar(50) NOT NULL DEFAULT 'normal'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `password`, `emailid`, `createdon`, `usertype`) VALUES
(6, 'admin', 'admin', 'admino', 'admin@admin.com', '2023-08-23 13:34:00', 'admin'),
(14, 'administrator', 'admin', 'admini', 'admin@admin.com', '2023-08-25 23:34:00', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`),
  ADD UNIQUE KEY `postTitle` (`postTitle`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
