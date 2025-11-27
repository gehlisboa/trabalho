-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/11/2025 às 17:45
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `empresa`
--
CREATE DATABASE IF NOT EXISTS `empresa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `empresa`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `dataCadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `login`
--

INSERT INTO `login` (`id`, `usuario`, `senha`, `dataCadastro`) VALUES
(3, 'ge', '$2y$10$ywPGkvIRKq1HlYuCScxcPunQ1VO1xDIW9qXz88AotqxvkE15rU3yC', '2025-11-27 13:35:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `postagens`
--

CREATE TABLE `postagens` (
  `CodPostagem` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Conteudo` text NOT NULL,
  `Autor` varchar(150) NOT NULL,
  `Imagem` varchar(500) DEFAULT NULL,
  `DataCriacao` datetime DEFAULT current_timestamp(),
  `DataAtualizacao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Índices de tabela `postagens`
--
ALTER TABLE `postagens`
  ADD PRIMARY KEY (`CodPostagem`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `postagens`
--
ALTER TABLE `postagens`
  MODIFY `CodPostagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
