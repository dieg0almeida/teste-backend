-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Fev-2020 às 08:40
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ioasys`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `enterprise`
--

CREATE TABLE `enterprise` (
  `enterprise_id` int(11) NOT NULL,
  `email_enterprise` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `linkedin` text DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `own_enterprise` tinyint(1) DEFAULT NULL,
  `enterprise_name` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `shares` int(11) DEFAULT NULL,
  `share_price` decimal(16,1) DEFAULT NULL,
  `own_shares` int(11) DEFAULT NULL,
  `enterprise_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `enterprise`
--

INSERT INTO `enterprise` (`enterprise_id`, `email_enterprise`, `facebook`, `twitter`, `linkedin`, `phone`, `own_enterprise`, `enterprise_name`, `photo`, `description`, `city`, `country`, `value`, `shares`, `share_price`, `own_shares`, `enterprise_type_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 0, 'AllRide', '/uploads/enterprise/photo/1/wood_trees_gloomy_fog_haze_darkness_50175_1920x1080.jpg', 'Urbanatika is a socio-environmental company with economic impact, creator of the agro-urban industry. We want to involve people in the processes of healthy eating, recycling and reuse of organic waste and the creation of citizen green areas. With this we are creating smarter cities from the people and at the same time the forest city.  Urbanatika, Agro-Urban Industry', 'Santiago', 'Chile', 0, 100, '10000.0', 0, 21),
(4, NULL, NULL, NULL, NULL, NULL, 0, 'AQM S.A.', NULL, 'Cold Killer was discovered by chance in the ´90 s and developed by Mrs. Inés Artozon Sylvester while she was 70 years old. Ending in a U.S. patent granted and a new company, AQM S.A. Diluted in water and applied to any vegetable leaves, stimulate increase glucose (sugar) up to 30% therefore help plants resists cold weather.', 'Maule', 'Chile', 0, NULL, '5000.0', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `enterprise_type`
--

CREATE TABLE `enterprise_type` (
  `enterprise_type_id` int(11) NOT NULL,
  `enterprise_type_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `enterprise_type`
--

INSERT INTO `enterprise_type` (`enterprise_type_id`, `enterprise_type_name`) VALUES
(1, 'Agro'),
(2, 'Aviation'),
(3, 'Biotech'),
(4, 'Eco'),
(5, 'Ecommerce'),
(6, 'Education'),
(7, 'Fashion'),
(8, 'Fintech'),
(9, 'Food'),
(10, 'Games'),
(11, 'Health'),
(12, 'IOT'),
(13, 'Logistics'),
(14, 'Media'),
(15, 'Mining'),
(16, 'Products'),
(17, 'Real Estate'),
(18, 'Service'),
(19, 'Smart City'),
(20, 'Social'),
(21, 'Software'),
(22, 'Technology'),
(23, 'Tourism'),
(24, 'Transport');

-- --------------------------------------------------------

--
-- Estrutura da tabela `investor`
--

CREATE TABLE `investor` (
  `investor_id` int(11) NOT NULL,
  `investor_name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `balance` decimal(16,2) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `portfolio_value` decimal(16,2) DEFAULT NULL,
  `first_access` tinyint(1) DEFAULT NULL,
  `super_angel` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `investor`
--

INSERT INTO `investor` (`investor_id`, `investor_name`, `email`, `password`, `city`, `country`, `balance`, `photo`, `portfolio_value`, `first_access`, `super_angel`) VALUES
(1, 'Teste Apple', 'testeapple@ioasys.com.br', '12341234', 'BH', 'Brasil', '350000.00', '/uploads/investor/photo/1/cropped4991818370070749122.jpg', '350000.00', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `investor_enterprise`
--

CREATE TABLE `investor_enterprise` (
  `investor_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `investor_enterprise`
--

INSERT INTO `investor_enterprise` (`investor_id`, `enterprise_id`) VALUES
(1, 1),
(1, 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `enterprise`
--
ALTER TABLE `enterprise`
  ADD PRIMARY KEY (`enterprise_id`),
  ADD KEY `enterprise_type_id` (`enterprise_type_id`);

--
-- Índices para tabela `enterprise_type`
--
ALTER TABLE `enterprise_type`
  ADD PRIMARY KEY (`enterprise_type_id`);

--
-- Índices para tabela `investor`
--
ALTER TABLE `investor`
  ADD PRIMARY KEY (`investor_id`);

--
-- Índices para tabela `investor_enterprise`
--
ALTER TABLE `investor_enterprise`
  ADD KEY `investor_id` (`investor_id`),
  ADD KEY `enterprise_id` (`enterprise_id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `enterprise`
--
ALTER TABLE `enterprise`
  ADD CONSTRAINT `enterprise_ibfk_1` FOREIGN KEY (`enterprise_type_id`) REFERENCES `enterprise_type` (`enterprise_type_id`);

--
-- Limitadores para a tabela `investor_enterprise`
--
ALTER TABLE `investor_enterprise`
  ADD CONSTRAINT `investor_enterprise_ibfk_1` FOREIGN KEY (`investor_id`) REFERENCES `investor` (`investor_id`),
  ADD CONSTRAINT `investor_enterprise_ibfk_2` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise` (`enterprise_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
