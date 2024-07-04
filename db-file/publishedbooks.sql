-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 04, 2024 at 09:40 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `publishedbooks`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `authorid` int(11) NOT NULL,
  `authorname` varchar(255) NOT NULL,
  `biography` varchar(1000) DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`authorid`, `authorname`, `biography`, `birthdate`) VALUES
(1, 'Stan Lee', 'Stan Lee was an American comic book writer, editor, publisher, and producer. He was the co-creator of iconic Marvel characters such as Spider-Man, Iron Man, the Hulk, Thor, the X-Men, and many others.', '1922-12-28'),
(2, 'Jack Kirby', 'Jack Kirby was an American comic book artist, writer, and editor, widely regarded as one of the medium\'s major innovators and one of its most prolific and influential creators. Along with Stan Lee, he co-created numerous Marvel characters.', '1917-08-28'),
(3, 'Chris Claremont', 'Chris Claremont is a British-born American comic book writer and novelist, known for his 17-year stint on Marvel Comics\' Uncanny X-Men, during which he helped to create numerous iconic characters and storylines.', '1950-11-25'),
(4, 'Brian Michael Bendis', 'Brian Michael Bendis is an American comic book writer and artist. He has won five Eisner Awards for his work in the comic book industry, and is known for his work on Ultimate Spider-Man, Daredevil, and several Marvel crossover events.', '1967-08-18');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `publisheddate` date DEFAULT NULL,
  `coverimageurl` varchar(255) DEFAULT NULL,
  `authorid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookid`, `title`, `price`, `publisheddate`, `coverimageurl`, `authorid`) VALUES
(1, 'Spider-Man: The Amazing Spider-Man Vol. 1', '19.99', '2014-11-04', 'https://i.pinimg.com/originals/75/6e/92/756e9272addab7f73d334cefad1d6fe1.jpg', 1),
(2, 'Iron Man: Invincible Iron Man Vol. 1', '17.99', '2015-10-07', 'https://i.pinimg.com/564x/60/af/20/60af2077698a6a57fd819390d502da09.jpg', 2),
(3, 'Captain America: Winter Soldier Ultimate Collection', '24.99', '2009-09-09', 'https://i.pinimg.com/736x/09/fb/bd/09fbbdbf4082bc634e788023de334c5a.jpg', 3),
(4, 'Incredible Hulk: Planet Hulk', '29.99', '2007-12-26', 'https://i.pinimg.com/originals/c5/16/e0/c516e094ac78a307e867ac984b9e22c0.jpg', 4),
(5, 'X-Men: Dark Phoenix Saga', '22.99', '1980-01-10', 'https://i.pinimg.com/474x/98/dd/a4/98dda4812c715a0bd9c26f816ec4e50d.jpg', 1),
(6, 'Fantastic Four: The Galactus Trilogy', '19.99', '1966-03-10', 'https://i.pinimg.com/originals/d1/ea/e0/d1eae038067e8a6b18f94608957ec151.jpg', 2),
(7, 'Wolverine: Old Man Logan', '24.99', '2009-06-03', 'https://i.pinimg.com/736x/bb/29/31/bb2931fd3e0b333b941be32ab7644e81.jpg', 3),
(8, 'Avengers: The Kree-Skrull War', '27.99', '1971-03-10', 'https://i.pinimg.com/736x/7d/ee/4f/7dee4feababf1955d4d62eb32ad60cd0.jpg', 4),
(9, 'Daredevil: Born Again', '18.99', '1986-02-01', 'https://i.pinimg.com/736x/3e/34/9f/3e349fceb65faae86354fbaf26f7c3b0.jpg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`authorid`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `authorid` (`authorid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`authorid`) REFERENCES `authors` (`authorid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
