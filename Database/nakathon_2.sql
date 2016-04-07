-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2016 at 04:58 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nakathon_2`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `findDowncount`(`typ` INT, `id` INT) RETURNS double
begin
	declare totCount int default 0;
    
	select count(rate) into totCount
    from rating
    where (type=typ) and entityId=id and rate=-1;
    
    if totCount is null then
    	set totCount=0;
    end if;
    
    return totCount;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `findRating`(`typ` INT, `id` INT) RETURNS double
begin
	declare totCount int default 0;
    declare number int default 1;
    
	select sum(rate), count(rate) into totCount,number 
    from rating
    where (type=typ) and entityId=id;
    
    if number=0 then
    	set totCount=0;
    	set number=1;
    end if;
    
    return totCount/number;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `findUpcount`(`typ` INT, `id` INT) RETURNS double
begin
	declare totCount int default 0;
    
	select sum(rate) into totCount 
    from rating
    where (type=typ) and entityId=id and rate=1;
    
    if totCount is null then
    	set totCount=0;
    end if;
    
    return totCount;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `userName` varchar(127) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `userName`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE IF NOT EXISTS `agency` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `agencyName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `description` varchar(8192) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `websiteLink` varchar(1023) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`id`, `email`, `agencyName`, `password`, `description`, `rating`, `websiteLink`) VALUES
(1, NULL, 'agency1', '3bfb04fca479ac4a8d4ddd4b02868fd0', NULL, NULL, NULL),
(2, NULL, 'agency2', '7babfa807a160064a31b52c1cb25054b', NULL, NULL, NULL),
(3, 'agency1@gmail.com', 'agent33', 'ed8c4916ef24b3ddb91912df5b7ea835', 'Dummy Data ', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agency_hotel`
--

CREATE TABLE IF NOT EXISTS `agency_hotel` (
  `id` int(11) NOT NULL,
  `agencyId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agency_offer`
--

CREATE TABLE IF NOT EXISTS `agency_offer` (
  `id` int(11) NOT NULL,
  `agencyId` int(11) NOT NULL,
  `description` varchar(1023) DEFAULT NULL,
  `startingDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agency_post`
--

CREATE TABLE IF NOT EXISTS `agency_post` (
  `id` int(11) NOT NULL,
  `agencyId` int(11) NOT NULL,
  `text` varchar(1023) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agency_spot`
--

CREATE TABLE IF NOT EXISTS `agency_spot` (
  `id` int(11) NOT NULL,
  `agencyId` int(11) NOT NULL,
  `spotId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE IF NOT EXISTS `alert` (
  `id` int(11) NOT NULL,
  `lat` double NOT NULL,
  `long` double NOT NULL,
  `seen` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`id`, `lat`, `long`, `seen`) VALUES
(1, 23.7257364, 90.390614, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `cat` varchar(512) DEFAULT NULL COMMENT '0: mountains, 1: waterfall, 2: forest, 3: lake, 4: sea beach'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cat`) VALUES
(1, 'Mountain'),
(2, 'Waterfall'),
(3, 'Sea Beach'),
(4, 'Zoo'),
(5, 'Park'),
(6, 'Forest');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL,
  `entityId` int(11) NOT NULL,
  `details` varchar(255) DEFAULT NULL COMMENT 'a single mode of contact (i.e. e-mail id or cellphone no)',
  `type` int(11) NOT NULL COMMENT '0: agency, 1: hotel, 2: guide, 3: food shop, 4: police number, 5: fire service number'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `entityId`, `details`, `type`) VALUES
(1, 1, '+880 31-713311', 1),
(2, 2, '+880 2-9552229', 1),
(3, 1, '+880 31-713311', 1),
(4, 4, ' ', 1),
(5, 5, ' ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `description`
--

CREATE TABLE IF NOT EXISTS `description` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0: agency, 1: hotel, 2: guide, 3: spot',
  `entityId` int(11) NOT NULL,
  `text` varchar(1023) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `description`
--

INSERT INTO `description` (`id`, `userId`, `type`, `entityId`, `text`, `time`) VALUES
(1, 1, 3, 5, '', '2016-04-06 21:43:11'),
(2, 1, 3, 18, '', '2016-04-07 02:14:49'),
(3, 1, 1, 1, '15000 taka per day', '2016-04-07 08:14:04'),
(4, 1, 1, 2, '1320 taka', '2016-04-07 08:22:20'),
(5, 1, 1, 1, '12000 taka per day', '2016-04-07 08:24:22'),
(6, 1, 1, 4, '9000', '2016-04-07 08:25:23'),
(7, 1, 1, 5, '1200', '2016-04-07 08:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `estimated_cost`
--

CREATE TABLE IF NOT EXISTS `estimated_cost` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0: spot, 1: guide',
  `spotId` int(11) DEFAULT NULL COMMENT 'if cost is for guide then add the spot id for which the guide is charging this amount',
  `cost` varchar(127) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guide`
--

CREATE TABLE IF NOT EXISTS `guide` (
  `id` int(11) NOT NULL,
  `name` varchar(127) DEFAULT NULL,
  `costId` int(11) DEFAULT NULL,
  `descriptionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guide_language`
--

CREATE TABLE IF NOT EXISTS `guide_language` (
  `id` int(11) NOT NULL,
  `guideId` int(11) NOT NULL,
  `language` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guide_spot`
--

CREATE TABLE IF NOT EXISTS `guide_spot` (
  `id` int(11) NOT NULL,
  `guideId` int(11) NOT NULL,
  `spotId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `locationId` int(11) DEFAULT NULL,
  `locationDesc` varchar(4192) DEFAULT NULL,
  `rating` double DEFAULT '0' COMMENT 'calculate from individual entries',
  `websiteLink` varchar(1023) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `name`, `locationId`, `locationDesc`, `rating`, `websiteLink`) VALUES
(2, 'Hotel Purbani International Ltd.', 25, NULL, 0, 'http://www.hotelpurbaniltd.com/'),
(3, 'Hotel Agrabad', 24, NULL, 0, 'http://www.agrabadhotel.com/'),
(4, 'Hotel Peninsula', 26, NULL, 0, ' '),
(5, 'Panshi Hotel & Restaurant', 27, NULL, 0, ' ');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_offer`
--

CREATE TABLE IF NOT EXISTS `hotel_offer` (
  `id` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `description` varchar(1023) DEFAULT NULL,
  `startingDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL,
  `entityId` int(11) NOT NULL COMMENT 'hotel, spot or agency post id',
  `img` blob,
  `time` datetime DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '0: hotel, 1: spot, 2: agency post'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL,
  `googleId` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `name` varchar(4096) DEFAULT NULL COMMENT 'unused',
  `roadNo` varchar(127) DEFAULT NULL,
  `district` varchar(127) DEFAULT NULL,
  `division` varchar(127) DEFAULT NULL COMMENT 'unused'
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `googleId`, `latitude`, `longitude`, `name`, `roadNo`, `district`, `division`) VALUES
(1, 'ChIJY8yqpzG_VTcRy5OfS98ReQE', 23.7299355, 90.3685048, NULL, 'H.H STATE', ' Hazaribugh Bai Ln', NULL),
(2, 'ChIJOxBMud64VTcRdKknoAgo-f4', 23.7199564, 90.38983449999999, NULL, 'Lalbagh Rd', ' Dhaka', NULL),
(3, 'EjBIYXRraG9sYSBSb2FkLCBEaGFrYSwgRGhha2EgRGl2aXNpb24sIEJhbmdsYWRlc2g', 23.7188138, 90.42040940000001, NULL, 'Hatkhola Rd', ' Dhaka', NULL),
(4, 'ChIJ-b1Hei2_VTcROQ4Kg4sa3r8', 23.726523099999998, 90.3728539, NULL, 'Badda Nagar', ' Dhaka', 'Dhaka'),
(5, 'ChIJDU9Aw4PHVTcR34G82i4NrnY', 23.769423999999997, 90.41428529999999, NULL, 'Hatir Jheel', 'Dhaka', 'Dhaka'),
(6, 'ChIJIZXkbNu4VTcR1kjR3S-vLsQ', 23.725052599999998, 90.38793199999999, NULL, 'Azimpur', ' Dhaka', 'Dhaka'),
(7, 'ChIJxbdC3jm_VTcR-SmCwKK0aiE', 23.734727900000003, 90.3652042, NULL, 'Hazaribagh', ' Dhaka', 'Dhaka'),
(8, 'ChIJLV9kaki_VTcRr9QQ9334-BY', 23.7360834, 90.363067, NULL, 'Hazaribag', 'Dhaka', 'Dhaka'),
(9, 'ChIJv5X_CyXfrDARDqnced54OSU', 22.3100611, 91.80044889999999, NULL, 'Port Internal Rd', ' Chittagong', 'Chittagong'),
(10, 'ChIJD6T8ES_frDARJAewvqeNa5o', 22.313454000000004, 91.79961899999999, NULL, 'Purbo Nimtala', 'Chittagong', 'Chittagong'),
(11, 'ChIJ1ZdqFm55sjAR5oIH8pCiRSs', 21.7075759, 92.5259006, NULL, 'Bandarban', 'Bandarban', 'Chittagong'),
(12, 'ChIJK_Z8gC2HUTcREK9vKQ2S190', 24.1675729, 91.9115218, NULL, 'Hum Hum Waterfall', ' Islampur', 'Sylhet'),
(13, 'ChIJlQUFI0qzVTcRA8df4b3kLek', 23.646094799999997, 90.5991042, NULL, 'Sonargaon', 'Narayangonj', 'Dhaka'),
(14, 'ChIJc7WDb4NiqjARcWSRhOx_HgM', 21.8031005, 90.1822792, NULL, 'Kuakata Sea Beach', ' Barisal', 'Barisal'),
(15, 'ChIJwyi5KurHrTAREAiXaAqeUzs', 21.439463599999996, 92.0077316, NULL, 'Cox''s Bazar', ' Cox''s Bazar', 'Chittagong'),
(16, 'ChIJ12azfWMR_DkR08aUGW7I9gE', 24.420115600000003, 88.9911879, NULL, 'Natore', 'Natore', 'Rajshahi'),
(17, 'ChIJKWAwGkS4VTcRWbNuv9-3S1w', 23.732019100000002, 90.4259218, NULL, 'Kamlapur', ' Dhaka', NULL),
(18, 'ChIJj5VI6LC4VTcRzqPGgDEubtU', 23.749423099999998, 90.3830754, NULL, 'Kalabagan', ' Dhaka', NULL),
(19, 'ChIJJ_p5P5i4VTcRL7w40HP92u0', 23.7516264, 90.394261, NULL, 'Karwan Bazar', ' Dhaka', NULL),
(20, 'ChIJbcTe_ca4VTcRoHNdyQMNk1Y', 23.7367689, 90.3871961, NULL, 'Katabon', ' Dhaka', NULL),
(21, 'ChIJ-wDSYr-4VTcR15Ckg4OXF50', 23.7392698, 90.3909492, NULL, 'Ramna', ' Dhaka', NULL),
(22, 'ChIJv6p7MIoZ6zkR6rGN8Rt8E7U', 27.717245300000002, 85.3239605, NULL, 'Kathmandu 44600', ' Nepal', NULL),
(23, 'ChIJ0X86v0i_VTcRLDYgGbHmJNs', 23.743791899999998, 90.3665236, NULL, 'Rd No 8A', ' Dhaka 1209', NULL),
(24, 'ChIJjTZzY7TYrDARs-U4QZulCn8', 22.326918, 91.816217, NULL, 'Agrabad Commercial Area, Chittagong, Bangladesh', NULL, NULL),
(25, 'ChIJxZwi-1m4VTcRMuy_ErmaVpM', 23.7276743, 90.4167155, NULL, '1 Dilkusha Rd, Dhaka 1000, Bangladesh', NULL, NULL),
(26, 'ChIJFcjKdJDYrDARxxVuvXjmwW8', 22.3578998, 91.8218744, NULL, 'GEC Circle, Chittagong, Bangladesh', NULL, NULL),
(27, 'ChIJP-f9NZHHVTcRR6HR9DfQAho', 23.7801831, 90.42546, NULL, 'Badda, Dhaka, Bangladesh', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0: agency, 1: hotel, 2: guide, 3: spot, 4: description, 5: estimated cost, 6: security',
  `entityId` int(11) NOT NULL,
  `rating` int(11) DEFAULT '0' COMMENT 'Rating : 0-5; Up/down : -1,+1',
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `security`
--

CREATE TABLE IF NOT EXISTS `security` (
  `id` int(11) NOT NULL,
  `spotId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `text` varchar(1023) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `spot`
--

CREATE TABLE IF NOT EXISTS `spot` (
  `id` int(11) NOT NULL,
  `name` varchar(127) DEFAULT NULL,
  `locationId` int(11) NOT NULL,
  `howToGo` varchar(1023) DEFAULT NULL,
  `security` varchar(8192) DEFAULT NULL,
  `estimatedCost` varchar(8192) DEFAULT NULL,
  `food` varchar(1023) DEFAULT NULL,
  `policeContact` varchar(2048) DEFAULT NULL,
  `fireContact` varchar(2048) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT '0' COMMENT 'The spot is entered by user. Did admin check?'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spot`
--

INSERT INTO `spot` (`id`, `name`, `locationId`, `howToGo`, `security`, `estimatedCost`, `food`, `policeContact`, `fireContact`, `categoryId`, `checked`) VALUES
(1, 'Hazaribagh Gym', 4, 'Take a rickshaw.', 'Beware of pick pockets. Some cases had been reported where unsuspecting people were robbed of their belongings.', '30', 'Beauty''r lacchi, Nanna''r biryani', '017777777777', '018888888888', NULL, 0),
(2, 'Azimpur Girls'' School and College', 6, 'Take a bus to New Market. Then take a rickshaw from there. Some buses may also go directly to Azimpur bus stand.', 'Mugging on the rise.', '10', '', '01989898989', '01876543210', NULL, 0),
(3, 'Hazaribag Thana', 7, 'Take a rickshaw.', '', '', 'Some local biryani houses are located in the vicinity. However they do charge more than the fair price so be sure to check the menu before ordering a dish.', '01768273423', '01657236874', NULL, 0),
(4, 'Hatir Jheel', 5, 'Buses are available going up and down Pragati Sarani. ', 'Usually safe at daytime and evening. However don''t stay late into the night.', '20', '', '01983718288', '01988099399', NULL, 0),
(5, 'Hazaribag', 8, '', '', '', '', '', '', NULL, 0),
(6, 'Chittagong Port', 9, 'Take Bus No. 10 which stops just in front of the port gate ', '', '10', '', '0167890765', '0197865432', NULL, 0),
(7, 'Chittagong Port Authority', 10, '', '', '', '', '', '', NULL, 0),
(8, 'Nafakhum Falls', 11, '', '', '', '', '', '', NULL, 0),
(9, 'Hum Hum Waterfall', 12, 'Hire a jeep to take you directly to the entrance of Rajkandi Reserve Forest', 'Get out of the forest before night falls!', '2000 per person', 'There is a single shop at the waterfall location. Take enough drinking water with you.', '0176543876', '0176589789', NULL, 0),
(10, 'Sonargaon', 13, '', '', '', '', '', '', NULL, 0),
(11, 'Kuakata Sea Beach', 14, '', '', '', '', '', '', NULL, 0),
(12, 'Cox''s Bazar', 15, '', '', '', '', '', '', NULL, 0),
(13, 'Natore Royal Palace', 16, '', '', '', '', '', '', NULL, 0),
(14, 'Kamalapur Railway Station', 17, '', '', '', '', '', '', 1, 0),
(15, 'Katabon', 20, '', '', '', '', '', '', 1, 0),
(16, 'Kataban Fashion Market', 21, '', '', '', '', '', '', 1, 0),
(17, 'Kathmandu', 22, '', '', '', '', '', '', 1, 0),
(18, 'Rayer Bazar High School', 23, '', '', '', '', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `userName` varchar(127) NOT NULL,
  `password` varchar(255) NOT NULL,
  `district` varchar(127) DEFAULT NULL,
  `country` varchar(127) DEFAULT NULL,
  `contribution` double DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `email`, `userName`, `password`, `district`, `country`, `contribution`) VALUES
(1, 'onix@gmail.com', 'Onix', '6c352e3a82ce2ef8b293529a9e5ad96c', 'Dhaka', 'Bangladesh', 0);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `spotId` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `vid` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `visited_spots`
--

CREATE TABLE IF NOT EXISTS `visited_spots` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `spotId` int(11) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`), ADD KEY `descriptionId` (`description`(767)), ADD KEY `rating` (`rating`);

--
-- Indexes for table `agency_hotel`
--
ALTER TABLE `agency_hotel`
  ADD PRIMARY KEY (`id`), ADD KEY `agencyId` (`agencyId`), ADD KEY `hotelId` (`hotelId`);

--
-- Indexes for table `agency_offer`
--
ALTER TABLE `agency_offer`
  ADD PRIMARY KEY (`id`), ADD KEY `agencyId` (`agencyId`);

--
-- Indexes for table `agency_post`
--
ALTER TABLE `agency_post`
  ADD PRIMARY KEY (`id`), ADD KEY `agencyId` (`agencyId`);

--
-- Indexes for table `agency_spot`
--
ALTER TABLE `agency_spot`
  ADD PRIMARY KEY (`id`), ADD KEY `agencyId` (`agencyId`), ADD KEY `spotId` (`spotId`);

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `description`
--
ALTER TABLE `description`
  ADD PRIMARY KEY (`id`), ADD KEY `userId` (`userId`);

--
-- Indexes for table `estimated_cost`
--
ALTER TABLE `estimated_cost`
  ADD PRIMARY KEY (`id`), ADD KEY `userId` (`userId`), ADD KEY `spotId` (`spotId`);

--
-- Indexes for table `guide`
--
ALTER TABLE `guide`
  ADD PRIMARY KEY (`id`), ADD KEY `costId` (`costId`), ADD KEY `descriptionId` (`descriptionId`);

--
-- Indexes for table `guide_language`
--
ALTER TABLE `guide_language`
  ADD PRIMARY KEY (`id`), ADD KEY `guideId` (`guideId`);

--
-- Indexes for table `guide_spot`
--
ALTER TABLE `guide_spot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_offer`
--
ALTER TABLE `hotel_offer`
  ADD PRIMARY KEY (`id`), ADD KEY `hotelId` (`hotelId`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`), ADD KEY `userId` (`userId`);

--
-- Indexes for table `security`
--
ALTER TABLE `security`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spot`
--
ALTER TABLE `spot`
  ADD PRIMARY KEY (`id`), ADD KEY `securityId` (`security`(767)), ADD KEY `estimatedCostId` (`estimatedCost`(767)), ADD KEY `locationId` (`locationId`), ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`), ADD KEY `userId` (`userId`), ADD KEY `spotId` (`spotId`);

--
-- Indexes for table `visited_spots`
--
ALTER TABLE `visited_spots`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `agency_hotel`
--
ALTER TABLE `agency_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agency_offer`
--
ALTER TABLE `agency_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agency_post`
--
ALTER TABLE `agency_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agency_spot`
--
ALTER TABLE `agency_spot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `description`
--
ALTER TABLE `description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `estimated_cost`
--
ALTER TABLE `estimated_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guide`
--
ALTER TABLE `guide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guide_language`
--
ALTER TABLE `guide_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guide_spot`
--
ALTER TABLE `guide_spot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hotel_offer`
--
ALTER TABLE `hotel_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `security`
--
ALTER TABLE `security`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `spot`
--
ALTER TABLE `spot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visited_spots`
--
ALTER TABLE `visited_spots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `agency_hotel`
--
ALTER TABLE `agency_hotel`
ADD CONSTRAINT `agency_hotel_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`id`),
ADD CONSTRAINT `agency_hotel_ibfk_2` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`id`);

--
-- Constraints for table `agency_offer`
--
ALTER TABLE `agency_offer`
ADD CONSTRAINT `agency_offer_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`id`);

--
-- Constraints for table `agency_post`
--
ALTER TABLE `agency_post`
ADD CONSTRAINT `agency_post_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`id`);

--
-- Constraints for table `agency_spot`
--
ALTER TABLE `agency_spot`
ADD CONSTRAINT `agency_spot_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`id`),
ADD CONSTRAINT `agency_spot_ibfk_2` FOREIGN KEY (`spotId`) REFERENCES `spot` (`id`);

--
-- Constraints for table `description`
--
ALTER TABLE `description`
ADD CONSTRAINT `description_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `estimated_cost`
--
ALTER TABLE `estimated_cost`
ADD CONSTRAINT `estimated_cost_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
ADD CONSTRAINT `estimated_cost_ibfk_2` FOREIGN KEY (`spotId`) REFERENCES `spot` (`id`);

--
-- Constraints for table `guide`
--
ALTER TABLE `guide`
ADD CONSTRAINT `guide_ibfk_2` FOREIGN KEY (`costId`) REFERENCES `estimated_cost` (`id`),
ADD CONSTRAINT `guide_ibfk_3` FOREIGN KEY (`descriptionId`) REFERENCES `description` (`id`);

--
-- Constraints for table `guide_language`
--
ALTER TABLE `guide_language`
ADD CONSTRAINT `guide_language_ibfk_1` FOREIGN KEY (`guideId`) REFERENCES `guide` (`id`);

--
-- Constraints for table `hotel_offer`
--
ALTER TABLE `hotel_offer`
ADD CONSTRAINT `hotel_offer_ibfk_1` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `spot`
--
ALTER TABLE `spot`
ADD CONSTRAINT `cat_fk1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
ADD CONSTRAINT `spot_ibfk_4` FOREIGN KEY (`locationId`) REFERENCES `location` (`id`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
ADD CONSTRAINT `video_ibfk_2` FOREIGN KEY (`spotId`) REFERENCES `spot` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
