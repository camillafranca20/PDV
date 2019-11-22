-- Banco de dados: `pdv`
--

CREATE DATABASE PDV;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `CODCLI` int(11) NOT NULL,
  `NOME` varchar(35) NOT NULL,
  `BONUS` int(11) NOT NULL,
  `PERFIL` varchar(1) NOT NULL,
  `STATUS` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desconto`
--

CREATE TABLE `desconto` (
  `ID_DESCONTO` int(11) NOT NULL,
  `CODPROD` int(11) NOT NULL,
  `PERCENTUAL` int(11) NOT NULL,
  `QTD_MIN` int(11) NOT NULL,
  `QTD_MAX` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `localidade`
--

CREATE TABLE `localidade` (
  `CODLOCAL` int(11) NOT NULL,
  `NOME` varchar(35) NOT NULL,
  `ENRERECO` varchar(80) NOT NULL,
  `TELEFONE` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `CODPROD` int(11) NOT NULL,
  `CODLOCAL` int(11) NOT NULL,
  `DESCRICAO` varchar(35) NOT NULL,
  `QTD_ESTOQUE` int(11) NOT NULL,
  `PRECO_UNITARIO` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `CODCLI` int(11) NOT NULL,
  `CODPROD` int(11) NOT NULL,
  `CODLOCAL` int(11) NOT NULL,
  `QTD_VENDA` int(11) NOT NULL,
  `VALOR_TOTAL` double NOT NULL,
  `DATA_VENDA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CODCLI`);

--
-- Índices para tabela `desconto`
--
ALTER TABLE `desconto`
  ADD PRIMARY KEY (`ID_DESCONTO`),
  ADD KEY `FK_CODPRODDESCONTO` (`CODPROD`);

--
-- Índices para tabela `localidade`
--
ALTER TABLE `localidade`
  ADD PRIMARY KEY (`CODLOCAL`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`CODPROD`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD KEY `FK_CODCLI` (`CODCLI`),
  ADD KEY `FK_CODLOCAL` (`CODLOCAL`),
  ADD KEY `FK_CODPROD` (`CODPROD`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CODCLI` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `desconto`
--
ALTER TABLE `desconto`
  MODIFY `ID_DESCONTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `localidade`
--
ALTER TABLE `localidade`
  MODIFY `CODLOCAL` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `CODPROD` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `desconto`
--
ALTER TABLE `desconto`
  ADD CONSTRAINT `FK_CODPRODDESCONTO` FOREIGN KEY (`CODPROD`) REFERENCES `produto` (`CODPROD`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `FK_CODCLI` FOREIGN KEY (`CODCLI`) REFERENCES `cliente` (`CODCLI`),
  ADD CONSTRAINT `FK_CODLOCAL` FOREIGN KEY (`CODLOCAL`) REFERENCES `localidade` (`CODLOCAL`),
  ADD CONSTRAINT `FK_CODPROD` FOREIGN KEY (`CODPROD`) REFERENCES `produto` (`CODPROD`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
