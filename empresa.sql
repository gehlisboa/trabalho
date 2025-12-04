-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/12/2025 às 01:48
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
(4, 'ge123', '$2y$10$bLqmDsnM5UT8M1jk1EjawuYP4v5mX8pDRb2kzqGbMeu8MyjauJNXe', '2025-12-03 13:43:52'),
(5, 'Jp', '$2y$10$y4cXc8rGA6XB/pOYP89i/eUVaM1wfDPuPSD7ogCLR9rXuLLhFhghO', '2025-12-03 21:43:13'),
(6, 'Clara', '$2y$10$RlyVKrUaIVHiPhHdAjoV7.1tmzDkume.8CReQeg3qzaT4DfNxJvLS', '2025-12-03 21:43:38'),
(7, 'Kety ', '$2y$10$a9BuH0uUeRaPg/HjFu.VxOnQxEdmAui/GGVqnddaykIhMec2lwsoi', '2025-12-03 21:44:16'),
(8, 'matheus', '$2y$10$lZ27UaZ/HLB21LnGxrdmEeb7sw5iwUjETBIG0V7raZgY8P.0cu3BS', '2025-12-03 21:45:52'),
(9, 'victoria', '$2y$10$E/6yhynD.IUHLl3TVS736.yWnrhuT/1Giwba2Om6Brm7tAFTREe9C', '2025-12-03 21:46:25'),
(10, 'julia', '$2y$10$6K2xP10VjFciH77OSzf0MOwDPBMy7g2zlGFNEe4r5RQ.icVSvzvYi', '2025-12-03 21:46:34');

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
-- Despejando dados para a tabela `postagens`
--

INSERT INTO `postagens` (`CodPostagem`, `Titulo`, `Conteudo`, `Autor`, `Imagem`, `DataCriacao`, `DataAtualizacao`) VALUES
(8, 'Inovação que transforma', 'O diferencial da Pixelift é transformar criatividade em soluções tecnológicas reais. Cada interface é inteligente, funcional e moderna.', 'João P.', '', '2025-12-03 20:56:20', '2025-12-03 20:56:20'),
(10, 'Decisões inteligentes e fundamentadas', 'Cada escolha da Pixelift é baseada em dados e testes reais. Isso trouxe segurança e garantiu que nosso produto evoluísse de forma estratégica.', 'Clara S.', '', '2025-12-03 20:59:15', '2025-12-03 20:59:15'),
(11, 'Resultados mensuráveis', 'Cada detalhe do projeto da Pixelift foi pensado para gerar impacto real. Hoje temos métricas melhores, mais conversões e maior retenção de clientes.', 'Kety R.', '', '2025-12-03 21:05:41', '2025-12-03 21:05:41'),
(15, 'Preparados para o futuro digital', 'Graças à Pixelift, nosso produto digital está preparado para evoluir junto com o mercado. Soluções escaláveis, design moderno e tecnologia confiável — estamos prontos para crescer ainda mais.', 'Matheus V.', 'https://i.pinimg.com/originals/56/3a/b1/563ab15230f5bf4259f11125fd1f9c0e.gif', '2025-12-03 21:15:08', '2025-12-03 21:15:08'),
(16, 'Impacto real no negócio', 'O trabalho da Pixelift trouxe impacto mensurável: aumento de conversão, engajamento e satisfação do usuário. Mais do que bonito, gera resultados concretos.', 'Kety R.', '', '2025-12-03 21:18:10', '2025-12-03 21:18:10'),
(17, 'Trabalhar com eles é fácil', 'A Pixelift se integra à nossa equipe de forma natural. Sugerem melhorias, compartilham ideias e entregam resultados consistentes, como se fossem parte do time.', 'Victoria P.', '', '2025-12-03 21:19:01', '2025-12-03 21:19:01'),
(19, 'Beleza que funciona', 'O design da Pixelift não é apenas estético, ele funciona. Cada elemento tem propósito, gerando resultados reais e melhorando a percepção da marca no mercado.', 'Julia M.', 'https://images.steamusercontent.com/ugc/2438013375536940927/D370DBF7BFC83ED36F783F08A598FFF3E71A1D61/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false', '2025-12-03 21:22:55', '2025-12-03 21:22:55');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `postagens`
--
ALTER TABLE `postagens`
  MODIFY `CodPostagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
