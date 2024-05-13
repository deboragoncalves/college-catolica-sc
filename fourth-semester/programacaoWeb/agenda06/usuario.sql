-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/05/2024 às 05:43
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbusuario`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `nascimento` date NOT NULL,
  `estado` varchar(150) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `interesses` varchar(300) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `login` varchar(150) NOT NULL,
  `senha` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `foto` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `nascimento`, `estado`, `endereco`, `interesses`, `sexo`, `login`, `senha`, `email`, `foto`) VALUES
(5, 'teste', '1993-09-11', 'Santa Catarina', 'teste end', '', 'F', 'teste@teste.com', 'teste', 'teste@teste.com', ''),
(6, 'teste ultimo', '1990-09-11', 'Santa Catarina', 'teste end', '', 'F', 'teste@teste.com', 'teste', 'teste@teste.com', ''),
(17, 'teste foto', '1993-09-11', 'Santa Catarina', 'teste', '', 'F', 'teste@teste.com', 'teste', 'teste@teste.com', 'motivacao.jpg');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
