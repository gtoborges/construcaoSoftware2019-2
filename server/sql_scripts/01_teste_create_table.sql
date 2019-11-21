-- ----------------------------------------------------------------------------------------------------------
-- Criando tabela de teste para verificar a integração do server com o banco de dados
-- ----------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `teste` (
  `idTeste` INT NOT NULL AUTO_INCREMENT,
  `descricaoTeste` VARCHAR(100) NOT NULL,
  `dataTeste` DATE NOT NULL,
  `dataCriacao` DATE NOT NULL,
  `dataAlteracao` DATE NOT NULL,
  PRIMARY KEY (`idTeste`)
);