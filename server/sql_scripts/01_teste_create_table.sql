-- ----------------------------------------------------------------------------------------------------------
-- Criando tabela de teste para verificar a integração do server com o banco de dados
-- ----------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `teste` (
  `idTeste` CHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `descricaoTeste` VARCHAR(100) NOT NULL,
  `dataTeste` DATE NOT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idTeste`)
);