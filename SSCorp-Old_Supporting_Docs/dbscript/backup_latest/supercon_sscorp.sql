-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 20, 2011 at 09:01 AM
-- Server version: 5.0.91
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `supercon_sscorp`
--

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_achievments_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_achievments_m` (
  `achievment_id` int(11) NOT NULL auto_increment,
  `achievement_name` varchar(100) NOT NULL,
  `super_desc` varchar(10000) default NULL,
  `achievment_desc` varchar(10000) NOT NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`achievment_id`),
  KEY `achievments_fk` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `sscorp_achievments_m`
--

INSERT INTO `sscorp_achievments_m` (`achievment_id`, `achievement_name`, `super_desc`, `achievment_desc`, `company_id`) VALUES
(1, 'Delhi Metro Rail Corporation', '(null)', 'Noida Station (BE-21)<br>\r\nDwarika Najafgarh Depot<br>\r\nSarita Vihar Depot *<br>\r\nVishwavidyalya to ISBT Underground Line (MC1A) <br>\r\nMandi House Underground Station. <br>\r\nIT Park<br>\r\nGurgaon Mehrauli Line (BE-22) *<br>\r\nKarkardooma (BE-19) *<br>\r\nSultanpur Depot (BD-3) *', 1),
(2, 'Delhi International Airport Limited, Delhi', '(null)', '', 1),
(3, 'Hyderabad International Airport, Hyderabad', NULL, '', 1),
(4, 'ITC Hotels', NULL, 'Kolkata<br>\r\nBangalore<br>\r\nChennai<br>', 1),
(5, 'Commonwealth Games Village, Delhi', NULL, '', 1),
(6, 'Vishnu Paryag Hydro Power Plant, Haridwar', NULL, '', 1),
(7, 'Medicity, Gurgaon', NULL, '', 1),
(8, 'Artemis Hospital, Gurgaon', NULL, '', 1),
(9, 'Pariccha Thermal Power Project, Barmer (Rajasthan)', NULL, '', 1),
(10, 'Jhajhar Thermal Power Project, Haryana', NULL, '', 1),
(11, 'Apollo Hospital, Bhubneshwar', NULL, '', 1),
(12, 'Max Healthcare Hospital – Saket, Delhi', NULL, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_address_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_address_m` (
  `address_id` int(11) NOT NULL auto_increment,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) default NULL,
  `province` varchar(50) default NULL,
  `country` varchar(50) default NULL,
  `zipcode` varchar(20) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`address_id`),
  KEY `address_m_fk` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `sscorp_address_m`
--

INSERT INTO `sscorp_address_m` (`address_id`, `address`, `city`, `province`, `country`, `zipcode`, `company_id`) VALUES
(1, '1993/1, Katra Lachu Singh, Indu Bazaar, Bhagirath Palace, Chandni Chowk', 'New Delhi', 'Delhi', 'India', '110006', 1),
(2, 'Any', 'New Delhi', 'Delhi', 'India', NULL, 1),
(3, 'Any', 'Delhi', 'Delhi', 'India', NULL, 1),
(4, 'Any', 'Gurgaon', 'Haryana', 'India', NULL, 1),
(5, 'Mayur Vihar & Noida', 'Delhi & UP', '', 'India', NULL, 1),
(6, 'Any', 'Hyderabad', 'Andhra Pradesh', 'India', NULL, 1),
(7, 'Any', 'Barmer', 'Rajasthan', 'India', NULL, 1),
(8, 'Any', 'Jhajhar', 'Haryana', 'India', NULL, 1),
(9, 'JP Hydro', '', 'Uttaranchal', 'India', NULL, 1),
(10, 'Any', 'Noida', 'Uttar Pradesh', 'India', NULL, 1),
(11, 'Any', 'Jaipur', 'Rajasthan', 'India', NULL, 1),
(12, 'Any', 'Chandigarh', '', 'India', NULL, 1),
(13, 'Any', 'Pune', 'Maharashtra', 'India', NULL, 1),
(14, 'Any', 'Chennai', 'Tamil Nadu', 'India', NULL, 1),
(15, 'Any', 'Kolkata', 'West Bengal', 'India', NULL, 1),
(16, 'Any', 'Bangalore', 'Karnataka', 'India', NULL, 1),
(17, 'Any', 'Ludhiana', 'Punjab', 'India', NULL, 1),
(18, 'Any', 'Bhubhaneshwar', 'Orrisa', 'India', NULL, 1),
(19, 'Any', 'Jammu', 'Jammu & Kashmir', 'India', NULL, 1),
(20, 'Any', 'Rudrapur', 'Uttarakhand', 'India', NULL, 1),
(21, 'Any', 'Indore', 'Madhya Pradesh', 'India', NULL, 1),
(22, 'Any', 'Greater Noida', 'Uttar Pradesh', 'India', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_companyProfile_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_companyProfile_m` (
  `company_id` int(11) NOT NULL auto_increment,
  `company_name` varchar(50) NOT NULL,
  `founder_name` varchar(200) NOT NULL,
  `co_founders_name` varchar(200) default NULL,
  `present_CEO` varchar(50) NOT NULL,
  `company_phone` varchar(20) default NULL,
  `email_id` varchar(50) NOT NULL,
  `company_logoAttachName` varchar(50) default NULL,
  `company_punchLine` varchar(100) default NULL,
  `about_us` varchar(10000) NOT NULL,
  `fax_number` varchar(20) default NULL,
  `infrastructure` varchar(10000) default NULL,
  `achievments_desc` text,
  `projects_desc` text,
  PRIMARY KEY  (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sscorp_companyProfile_m`
--

INSERT INTO `sscorp_companyProfile_m` (`company_id`, `company_name`, `founder_name`, `co_founders_name`, `present_CEO`, `company_phone`, `email_id`, `company_logoAttachName`, `company_punchLine`, `about_us`, `fax_number`, `infrastructure`, `achievments_desc`, `projects_desc`) VALUES
(1, 'Super Sales Corporation', 'Rakesh Kumar Jain', 'Rajesh Kumar Jain', 'Rakesh Kumar Jain', '+91-11-23860884', 'supsalcorp@gmail.com', 'logo.jpg', NULL, '</p>M/s Super Sales Corporation is one of the largest distributors and manufacturers in conduit accessories in both <strong>MS (<u>BLACK</u>)</strong> and <strong>GI (<u>GALVANISED</u>)</strong> forms.</p>\r\n\r\n<p>Super Sales Corporation was established <strong>31</strong> years ago in 1979 with one crystal clear vision in mind; to produce quality products and with in depth knowledge of our mentors Mr. RAKESH KUMAR JAIN & Mr. RAJEEV KUMAR JAIN, we have grown leaps and bounce in the industry. Experience, hard work and willingness to go out of the box have been our success mantra.</p>\r\n\r\n<p>Super Sales Corporation has diversified its product base over the years and today caters to the almost all the prestigious projects and retail counters. </p>\r\n\r\n<p>Super Sales Corporation today distributes and manufactures all sizes under 20 major product groups and has now taken its footsteps far ahead by <strong>supplying to Biggest Brands in the Industry</strong>. As an approved Vendor with capability of onsite delivery at any location. It also caters to most of the big retail counters in top 6 cities of the country and plans to expand nationwide retail distribution by end of 2010.</p>', '+91-11-23862056', '<p>Our manufacturing and distribution facilities are spread over a very wide area with all the skilled and experienced labor involved in processing and storage facilities.</p>\r\n\r\n<p>We are the only company who has the paint baking plant facility in conduit accessories industry to give products higher protection.</p>\r\n\r\n<p>Office Operations are taken care at Bhagirath Palace, Chandni Chowk.</p>', '<p>Within the short period SSC has number of certifications and approval that exhibits the heights where it has reached today. They are listed below:</p>', 'Super Sales Corporation today works as an approved vendor with all its clients and has been associated with over 100 projects till now. Though SSC entered into projects from year 1995 but major turnaround started happening from the year 2001 with the introduction of Delhi Metro Rail Corporation and major infrastructural development in Delhi/NCR.<br>');

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_customerDetails_t`
--

CREATE TABLE IF NOT EXISTS `sscorp_customerDetails_t` (
  `customer_id` int(11) NOT NULL auto_increment,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) default NULL,
  `gender` varchar(5) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `company_name` varchar(50) default NULL,
  `company_website` varchar(50) default NULL,
  `phone_no` varchar(20) default NULL,
  `mobile_no` varchar(20) default NULL,
  PRIMARY KEY  (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sscorp_customerDetails_t`
--

INSERT INTO `sscorp_customerDetails_t` (`customer_id`, `first_name`, `last_name`, `gender`, `email_id`, `company_name`, `company_website`, `phone_no`, `mobile_no`) VALUES
(4, 'Naman', 'Jain', 'Mr. ', 'namanjain@live.com', 'SSC', '', '', '9999657866'),
(5, 'RAJAT JAIN', 'jain', 'Mr. ', 'jain_rajat83@yahoo.co.in', 'R.R STEELS', '', '98711095599', ''),
(6, 'ANIL', 'MUNOT', 'Mr. ', 'munot_agencies@yahoo.co.in', 'MUNOT AGENCIES', '', '080-22262971', '080-22204058'),
(7, 'R. SHIVA KUMAR', 'kumar', 'Mr. ', 'revu_shiva@yahoo.com', '', 'R.Pandu Rangam & Sons', '040-65767286', '09246504073');

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_menu_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_menu_m` (
  `menu_id` int(11) NOT NULL auto_increment,
  `menu_name` varchar(50) NOT NULL,
  `menu_position` int(5) NOT NULL,
  `menu_url` varchar(100) default NULL,
  `company_id` int(11) default NULL,
  `additional_menu_url` varchar(200) default NULL,
  PRIMARY KEY  (`menu_id`),
  UNIQUE KEY `unique_menu_name_uk` (`menu_name`),
  KEY `menu_m_fk1` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sscorp_menu_m`
--

INSERT INTO `sscorp_menu_m` (`menu_id`, `menu_name`, `menu_position`, `menu_url`, `company_id`, `additional_menu_url`) VALUES
(1, 'Home', 1, '/home.do', 1, NULL),
(2, 'Products and Services', 2, '/fetchProductCategory.do', 1, '/fetchProductDetails.do,/showMoreImages.do,/showNextProductPage.do'),
(3, 'Profile', 4, '/companyProfile.do', 1, NULL),
(4, 'Inquiries', 3, '/showQueryPage.do', 1, '/saveQuery.do'),
(5, 'Contact Us', 6, '/contactUs.do', 1, NULL),
(6, 'Projects', 5, '/fetchProjectList.do', 1, '/showNextProjectsPage.do');

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_phone_numbers_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_phone_numbers_m` (
  `phone_id` int(11) NOT NULL auto_increment,
  `phone_owner` varchar(100) NOT NULL,
  `country_code` varchar(10) default NULL,
  `std_code` varchar(10) default NULL,
  `phone_number` varchar(20) NOT NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`phone_id`),
  KEY `phone_number_fk` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sscorp_phone_numbers_m`
--

INSERT INTO `sscorp_phone_numbers_m` (`phone_id`, `phone_owner`, `country_code`, `std_code`, `phone_number`, `company_id`) VALUES
(1, 'Rakesh Kumar Jain', '91', NULL, '9999769217', 1),
(2, 'Rajeev Kumar Jain', '91', NULL, '9999769216', 1),
(3, 'Naman Jain', '91', NULL, '9999657866', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_products_category_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_products_category_m` (
  `product_cat_id` int(11) NOT NULL auto_increment,
  `product_cat_name` varchar(200) NOT NULL,
  `prod_cat_photo_attachName` varchar(100) default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`product_cat_id`),
  KEY `products_cat_companyProfile_fk` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sscorp_products_category_m`
--

INSERT INTO `sscorp_products_category_m` (`product_cat_id`, `product_cat_name`, `prod_cat_photo_attachName`, `company_id`) VALUES
(1, 'MS Black', 'MS_Black.jpg', 1),
(2, 'Galvanised', 'Galvanized.jpg', 1),
(3, 'Accessories', 'Accessories.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_products_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_products_m` (
  `product_id` int(11) NOT NULL auto_increment,
  `product_name` varchar(100) NOT NULL,
  PRIMARY KEY  (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `sscorp_products_m`
--

INSERT INTO `sscorp_products_m` (`product_id`, `product_name`) VALUES
(1, 'Ball Socket'),
(2, 'Checknut'),
(3, 'Coupler'),
(4, 'Fan Box'),
(5, 'Flexible Pipe'),
(6, 'Flexible Pipe Coupler'),
(7, 'Lightning Chains'),
(8, 'Nipple'),
(9, 'PVC Bush'),
(10, 'PVC Sleeve (Geety)'),
(11, 'Reducer'),
(12, 'Saddle'),
(13, 'Saddle with Base'),
(14, 'Spacer'),
(15, 'Strip Saddle'),
(16, 'Wooden Screw'),
(17, 'Deep Junction Box'),
(18, 'Inspection Bend'),
(19, 'Junction Box'),
(20, 'Long Bend');

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_product_desc_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_product_desc_m` (
  `prod_desc_id` int(11) NOT NULL auto_increment,
  `prod_desc_name` varchar(200) NOT NULL,
  PRIMARY KEY  (`prod_desc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sscorp_product_desc_m`
--

INSERT INTO `sscorp_product_desc_m` (`prod_desc_id`, `prod_desc_name`) VALUES
(1, 'MS Black'),
(2, 'Hot Dip Galvanised & Electro Galvanised'),
(3, 'Electro Galvanised'),
(4, 'Galvanised'),
(5, 'PVC');

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_product_detail_t`
--

CREATE TABLE IF NOT EXISTS `sscorp_product_detail_t` (
  `prod_det_id` int(11) NOT NULL auto_increment,
  `prod_photo_attachName` varchar(100) NOT NULL,
  `product_cat_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `prod_desc_id` int(11) default NULL,
  `prod_mat_id` int(11) default NULL,
  `prod_size_id` int(11) default NULL,
  PRIMARY KEY  (`prod_det_id`),
  KEY `productCatId_prod_detail_fk` (`product_cat_id`),
  KEY `productId_prod_fk` (`product_id`),
  KEY `productDescId_prod_desc_fk` (`prod_desc_id`),
  KEY `productMatId_prod_material_fk` (`prod_mat_id`),
  KEY `productSizeId_prod_size_fk` (`prod_size_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `sscorp_product_detail_t`
--

INSERT INTO `sscorp_product_detail_t` (`prod_det_id`, `prod_photo_attachName`, `product_cat_id`, `product_id`, `prod_desc_id`, `prod_mat_id`, `prod_size_id`) VALUES
(1, 'Ball_Socket.jpg,Ball_Socket_1.jpg', 3, 1, 4, 4, 1),
(2, 'Checknut.jpg', 3, 2, 3, 2, 1),
(3, 'Coupler.jpg', 3, 3, 2, 2, 1),
(4, 'Fan_Box.jpg', 3, 4, 2, 2, 1),
(5, 'Flexible_Pipe.jpg', 3, 5, 3, 5, 1),
(6, 'Flexible_Pipe_Coupler.jpg', 3, 6, 4, 4, 1),
(7, 'Lighting_Chains.jpg', 3, 7, 4, 6, 1),
(8, 'Nipple.jpg,Nipple_1.jpg', 3, 8, 3, 2, 1),
(9, 'PVC_Bush.jpg', 3, 9, 5, 3, 1),
(10, 'Sleeve.jpg,Sleeve_1.jpg', 3, 10, 5, 3, 1),
(11, 'Reducer.jpg,Reducer_1.jpg', 3, 11, 4, 1, 1),
(12, 'Saddle.jpg,Saddle_1.jpg', 3, 12, 2, 2, 1),
(13, 'Saddle_with_Base.jpg,Saddle_with_Base_1.jpg,Saddle_with_Base_2.jpg', 3, 13, 2, 2, 1),
(14, 'Spacer.jpg,Spacer_1.jpg', 3, 14, 2, 2, 1),
(15, 'Strip_Saddle.jpg,Strip_Saddle_1.jpg', 3, 15, 2, 2, 1),
(16, 'Wooden_Screw.jpg,Wooden_Screw_1.jpg', 3, 16, 4, 2, 1),
(17, 'Deep_Junction_Box_MS_Black.jpg,IS_Deep_Junction_Box_MS_Black.jpg', 1, 17, 1, 1, 1),
(18, 'Inspection_Bend_MS_Black.jpg', 1, 18, 1, 1, 1),
(19, 'Junction_Box_MS_Black.jpg,IS_Junction_Box_MS_Black.jpg', 1, 19, 1, 1, 1),
(20, 'Long_Bend_MS_Black.jpg', 1, 20, 1, 1, 1),
(21, 'Deep_Junction_ Box_Galvanised.jpg', 2, 17, 2, 1, 1),
(22, 'Inspection_Bend_Galvanised.jpg', 2, 18, 2, 1, 1),
(23, 'Junction_Box_4_way_Galvanised.jpg,Junction_Box_3_way_Galvanised.jpg', 2, 19, 2, 1, 1),
(24, 'Hot_Dip_Galvanised_Bend.jpg,Electro_Galvanised_Bend.jpg', 2, 20, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_product_material_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_product_material_m` (
  `prod_mat_id` int(11) NOT NULL auto_increment,
  `prod_material_name` varchar(200) NOT NULL,
  PRIMARY KEY  (`prod_mat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sscorp_product_material_m`
--

INSERT INTO `sscorp_product_material_m` (`prod_mat_id`, `prod_material_name`) VALUES
(1, 'Cast Iron'),
(2, 'Metal Sheet'),
(3, 'PVC'),
(4, 'Aluminium Casting'),
(5, 'Galvanised Strip'),
(6, 'Wire');

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_product_size_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_product_size_m` (
  `prod_size_id` int(11) NOT NULL auto_increment,
  `prod_size` varchar(200) NOT NULL,
  PRIMARY KEY  (`prod_size_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sscorp_product_size_m`
--

INSERT INTO `sscorp_product_size_m` (`prod_size_id`, `prod_size`) VALUES
(1, 'Available in all sizes and types');

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_projects_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_projects_m` (
  `project_id` int(11) NOT NULL auto_increment,
  `project_name` varchar(200) NOT NULL,
  `project_cat_id` int(11) default NULL,
  `address_id` int(11) default NULL,
  PRIMARY KEY  (`project_id`),
  KEY `project_fk` (`project_cat_id`),
  KEY `project_addressId_fk` (`address_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `sscorp_projects_m`
--

INSERT INTO `sscorp_projects_m` (`project_id`, `project_name`, `project_cat_id`, `address_id`) VALUES
(1, 'DMRC Dwarika Najafgarh Depot', 1, 3),
(2, 'DMRC Underground ISBT Line', 1, 2),
(3, 'DMRC Mandi Underground Station', 1, 2),
(4, 'DMRC (Mayur Vihar to Noida Corridor)', 1, 5),
(5, 'DMRC (Yamuna Bank to Anand Vihar)', 1, 2),
(6, 'DMRC Chatarpur', 1, 2),
(7, 'DMRC Sultanpur Depot', 1, 2),
(8, 'DMRC Kirti Nagar', 1, 2),
(9, 'DMRC (ISBT to Vishwavidyalya)', 1, 2),
(10, 'DMRC Sarita Vihar Depot', 1, 2),
(11, 'DMRC Azadpur Station', 1, 2),
(12, 'DMRC Azadpur Station', 1, 2),
(13, 'DMRC Akshardham Station', 1, 2),
(14, 'DMRC Dwarika Stations (6 Stations)', 1, 2),
(15, 'Delhi International Airport', 2, 2),
(16, 'Hyderabad International', 2, 6),
(17, 'Indore Airport', 2, 21),
(18, 'Paricha Thermal Power Project', 3, 7),
(19, 'Jhajhar Thermal Power Projects', 3, 8),
(20, 'Vishnu Paryag Hydro Power Plant', 3, 9),
(21, 'HCL', 4, 10),
(22, 'Bank of America', 4, 4),
(23, 'Genpact', 4, 11),
(24, 'Genpact DMRC IT Park,  Shastri Park', 4, 2),
(25, 'Hewlett Packard, Global Business Park', 4, 4),
(26, 'Hewitt International Pvt. Ltd', 4, 4),
(27, 'Nokia', 4, 4),
(28, 'Accenture', 4, 4),
(29, 'Udaan Bhawan Building, Delhi Airport', 4, 2),
(30, 'Bharti Retail', 4, 4),
(31, 'Bharti Airtel', 4, 12),
(32, 'Welldone Tech Park', 4, 4),
(33, 'Nokia, SP Infocity', 4, 4),
(34, 'ASF Buildcon Pvt. Ltd.', 4, 22),
(35, 'Reliance Corporate Office, Ajmeri Gate', 4, 2),
(36, 'IT Park', 4, 13),
(37, 'ITC Hotel Grand Chola', 5, 14),
(38, 'DD Resort', 5, 4),
(39, 'ITC Shonar Bangla', 5, 15),
(40, 'ITC Royal Garden', 5, 16),
(41, 'Hotel Leela', 5, 2),
(42, 'Hotel Hans Plaza', 5, 4),
(43, 'Indus Hotel', 5, 2),
(44, 'Pullman Hotel', 5, 4),
(45, 'City Mart Centre', 8, 4),
(46, 'TDI Mall, Rajouri Garden', 6, 2),
(47, 'Westend Mall', 6, 17),
(48, 'Westgate Mall, Rajouri Garden', 6, 2),
(49, 'EMR MGF Mall', 6, 4),
(50, 'Max Healthcare Hospital, Saket', 7, 2),
(51, 'Artemis Hospital (Apollo Tyre Group)', 7, 4),
(52, 'Medicity', 7, 4),
(53, 'Fortis Hospital, Vasant Kunj', 7, 2),
(54, 'Apollo Hospital', 7, 18),
(55, 'Max Healthcare Hospital, Parparganj', 7, 2),
(56, 'BPTP Central Park', 8, 4),
(57, 'Mahendra Gesco Residential Complex', 8, 4),
(58, 'Vatika Group Residential', 8, 4),
(59, 'Indraprastha Gas Line', 8, 2),
(60, 'Mata Vashno Devi Building Project', 8, 19),
(61, 'Greater Noida Expo Center Project', 8, 22),
(62, 'Jaypee Greens', 8, 22),
(63, 'PCI', 8, 4),
(64, 'OIDB', 8, 10),
(65, 'Commonwealth Games Village', 8, 2),
(66, 'Talkatora Stadium', 8, 2),
(67, 'Ashok Leyland Factory', 8, 20),
(68, 'DMRC Green Park to Sikandarpur', 1, 2),
(69, 'DMRC Housing Project', 1, 2),
(70, 'DMRC IT Park, Shastri Park', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_project_category_m`
--

CREATE TABLE IF NOT EXISTS `sscorp_project_category_m` (
  `project_cat_id` int(11) NOT NULL auto_increment,
  `project_category` varchar(200) NOT NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`project_cat_id`),
  KEY `project_cat_fk` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sscorp_project_category_m`
--

INSERT INTO `sscorp_project_category_m` (`project_cat_id`, `project_category`, `company_id`) VALUES
(1, 'Metro Rail', 1),
(2, 'Airports', 1),
(3, 'Power Projects', 1),
(4, 'Business Centre', 1),
(5, 'Hotels & Resorts', 1),
(6, 'Malls', 1),
(7, 'Hospitals', 1),
(8, 'Miscellaneous', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sscorp_queryDetails_t`
--

CREATE TABLE IF NOT EXISTS `sscorp_queryDetails_t` (
  `query_id` int(11) NOT NULL auto_increment,
  `query` varchar(3000) NOT NULL,
  `query_subject` varchar(100) default NULL,
  `query_date` datetime NOT NULL,
  `hear_about_us` varchar(1000) default NULL,
  `company_id` int(11) default NULL,
  `customer_id` int(11) default NULL,
  PRIMARY KEY  (`query_id`),
  KEY `customerDetails_fk` (`customer_id`),
  KEY `queryDetails_company_fk` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sscorp_queryDetails_t`
--

INSERT INTO `sscorp_queryDetails_t` (`query_id`, `query`, `query_subject`, `query_date`, `hear_about_us`, `company_id`, `customer_id`) VALUES
(4, 'to know about conduits', '', '2010-03-11 11:47:53', 'trade directory.', 1, 4),
(5, 'We don''t have any knowledge about your products. So please send description of your all products.', 'lack of knowledge ', '2010-03-11 23:35:00', 'In my sasural', 1, 5),
(6, 'sir/madam, i received a call from you that you deal with all conduit pipes & accessories. so please provide the price list and discount .so we can check and issue you the order.\r\n', 'price list of all items', '2010-07-14 14:05:51', 'from you company member', 1, 6),
(7, 'WE REQUIRE 2000NOS DEEP JUNCTION BOXES PG TYPE 500NOS MS FAN-HOOK BOX FOR OUR PROJECT AT HYDERABAD. PL SEND YOURS LOWEST QUOTATION IMMEDIATE WITH DELIVERY PERIOD & CONDITION   ', 'INQUIRER', '2010-10-13 16:10:12', '', 1, 7);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sscorp_achievments_m`
--
ALTER TABLE `sscorp_achievments_m`
  ADD CONSTRAINT `achievments_fk` FOREIGN KEY (`company_id`) REFERENCES `sscorp_companyProfile_m` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sscorp_address_m`
--
ALTER TABLE `sscorp_address_m`
  ADD CONSTRAINT `address_m_fk` FOREIGN KEY (`company_id`) REFERENCES `sscorp_companyProfile_m` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sscorp_menu_m`
--
ALTER TABLE `sscorp_menu_m`
  ADD CONSTRAINT `menu_m_fk1` FOREIGN KEY (`company_id`) REFERENCES `sscorp_companyProfile_m` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sscorp_phone_numbers_m`
--
ALTER TABLE `sscorp_phone_numbers_m`
  ADD CONSTRAINT `phone_number_fk` FOREIGN KEY (`company_id`) REFERENCES `sscorp_companyProfile_m` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sscorp_products_category_m`
--
ALTER TABLE `sscorp_products_category_m`
  ADD CONSTRAINT `products_cat_companyProfile_fk` FOREIGN KEY (`company_id`) REFERENCES `sscorp_companyProfile_m` (`company_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sscorp_product_detail_t`
--
ALTER TABLE `sscorp_product_detail_t`
  ADD CONSTRAINT `productCatId_prod_detail_fk` FOREIGN KEY (`product_cat_id`) REFERENCES `sscorp_products_category_m` (`product_cat_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productDescId_prod_desc_fk` FOREIGN KEY (`prod_desc_id`) REFERENCES `sscorp_product_desc_m` (`prod_desc_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productId_prod_fk` FOREIGN KEY (`product_id`) REFERENCES `sscorp_products_m` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productMatId_prod_material_fk` FOREIGN KEY (`prod_mat_id`) REFERENCES `sscorp_product_material_m` (`prod_mat_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `productSizeId_prod_size_fk` FOREIGN KEY (`prod_size_id`) REFERENCES `sscorp_product_size_m` (`prod_size_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sscorp_projects_m`
--
ALTER TABLE `sscorp_projects_m`
  ADD CONSTRAINT `project_addressId_fk` FOREIGN KEY (`address_id`) REFERENCES `sscorp_address_m` (`address_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_fk` FOREIGN KEY (`project_cat_id`) REFERENCES `sscorp_project_category_m` (`project_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sscorp_project_category_m`
--
ALTER TABLE `sscorp_project_category_m`
  ADD CONSTRAINT `project_cat_fk` FOREIGN KEY (`company_id`) REFERENCES `sscorp_companyProfile_m` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sscorp_queryDetails_t`
--
ALTER TABLE `sscorp_queryDetails_t`
  ADD CONSTRAINT `customerDetails_fk` FOREIGN KEY (`customer_id`) REFERENCES `sscorp_customerDetails_t` (`customer_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `queryDetails_company_fk` FOREIGN KEY (`company_id`) REFERENCES `sscorp_companyProfile_m` (`company_id`) ON DELETE SET NULL;
