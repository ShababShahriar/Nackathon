-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2016 at 01:55 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

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
CREATE DEFINER=`root`@`localhost` FUNCTION `findRating`(`typ` INT, `id` INT) RETURNS double
begin
	declare totCount int default 0;
    declare number int default 1;
    
	select sum(rate), count(rate) into totCount,number 
    from rating
    where (type=typ) and entityId=id;
    
    if number=0 then
    	set number=1;
    end if;
    
    return totCount/number;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`id`, `email`, `agencyName`, `password`, `description`, `rating`, `websiteLink`) VALUES
(1, NULL, 'agency1', '3bfb04fca479ac4a8d4ddd4b02868fd0', NULL, NULL, NULL),
(2, NULL, 'agency2', '7babfa807a160064a31b52c1cb25054b', NULL, NULL, NULL);

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
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`id` int(11) NOT NULL,
  `spotId` int(11) NOT NULL,
  `cat` int(11) NOT NULL COMMENT '0: mountains, 1: waterfall, 2: forest, 3: lake, 4: sea beach'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
`id` int(11) NOT NULL,
  `entityId` int(11) NOT NULL,
  `details` varchar(255) DEFAULT NULL COMMENT 'a single mode of contact (i.e. e-mail id or cellphone no)',
  `type` int(11) NOT NULL COMMENT '0: agency, 1: hotel, 2: guide, 3: food shop, 4: police number, 5: fire service number'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `description`
--

CREATE TABLE IF NOT EXISTS `description` (
`id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1: hotel, 2: guide, 3: spot',
  `entityId` int(11) NOT NULL,
  `text` varchar(1023) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `locationDesc` varchar(8192) DEFAULT NULL,
  `rating` double DEFAULT '0' COMMENT 'calculate from individual entries',
  `websiteLink` varchar(1023) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `name`, `locationId`, `locationDesc`, `rating`, `websiteLink`) VALUES
(1, 'Hotel Sundarban', NULL, NULL, 0, NULL),
(2, 'Hotel Shaban', NULL, NULL, 0, NULL);

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
  `name` varchar(4096) DEFAULT NULL,
  `roadNo` varchar(127) DEFAULT NULL,
  `district` varchar(127) DEFAULT NULL,
  `division` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
`id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0: agency, 1: hotel, 2: guide, 3: spot, 4: description, 5: estimated cost, 6: security',
  `entityId` int(11) NOT NULL,
  `rate` int(11) DEFAULT '0' COMMENT 'Rating : 0-5; Up/down : -1,+1',
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `userId`, `type`, `entityId`, `rate`, `time`) VALUES
(1, 1, 1, 2, 3, NULL),
(2, 1, 1, 1, 4, NULL),
(3, 2, 1, 2, 5, NULL);

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
  `descriptionId` int(11) DEFAULT NULL,
  `howToGo` varchar(1023) DEFAULT NULL,
  `securityId` int(11) DEFAULT NULL,
  `estimatedCostId` int(11) DEFAULT NULL,
  `food` varchar(1023) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `email`, `userName`, `password`, `district`, `country`, `contribution`) VALUES
(1, 'wasifkhan2282@gmail.com', 'wasif', 'ac9c3b9aafeb3165e642a29e5be59032', 'munshigonj', 'Bangladesh', 0),
(2, NULL, 'neamul', '7c383614904e26749b8cb82f280ea128', 'chittagong', 'bangladesh', 0);

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
 ADD PRIMARY KEY (`id`), ADD KEY `descriptionId` (`descriptionId`), ADD KEY `securityId` (`securityId`), ADD KEY `estimatedCostId` (`estimatedCostId`), ADD KEY `locationId` (`locationId`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `description`
--
ALTER TABLE `description`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `security`
--
ALTER TABLE `security`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `spot`
--
ALTER TABLE `spot`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
ADD CONSTRAINT `spot_ibfk_1` FOREIGN KEY (`descriptionId`) REFERENCES `description` (`id`),
ADD CONSTRAINT `spot_ibfk_2` FOREIGN KEY (`securityId`) REFERENCES `security` (`id`),
ADD CONSTRAINT `spot_ibfk_3` FOREIGN KEY (`estimatedCostId`) REFERENCES `estimated_cost` (`id`),
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
