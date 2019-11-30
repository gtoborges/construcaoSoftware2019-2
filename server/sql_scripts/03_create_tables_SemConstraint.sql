-- ----------------------------------------------------------------------------------------------------------
-- tabela nacionalidade
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `paises` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `pais` VARCHAR(50) NOT NULL,
  `nacionalidade` VARCHAR(50) NULL,
  `sigla` VARCHAR(3) NULL,
  PRIMARY KEY (`idPais`)
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela equipe
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `tag` VARCHAR(10) NOT NULL,
  `paisDeOrigemFK` INT NOT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idEquipe`),
  FOREIGN KEY (`paisDeOrigemFK`) REFERENCES `paises` (`idPais`)
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela jogador
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `jogador` (
  `idJogador` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `sobrenome` VARCHAR(100) NULL,
  `apelido` VARCHAR(30) NOT NULL,
  `dataNascimento` DATE NULL,
  `paisDeOrigemFK` INT NULL,
  `equipeFK` INT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idJogador`),
  FOREIGN KEY (`paisDeOrigemFK`) REFERENCES `paises` (`idPais`),
  FOREIGN KEY (`equipeFK`) REFERENCES `equipe` (`idEquipe`)
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela historicoJogador
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `historicoJogador` (
  `idHistoricoJogador` INT NOT NULL AUTO_INCREMENT,
  `idJogadorFK` INT NOT NULL,
  `idEquipeFK` INT NOT NULL,
  `dataEntrada` DATE NOT NULL,
  `dataSaida` DATE NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idHistoricoJogador`),
  FOREIGN KEY (`idJogadorFK`) REFERENCES `jogador` (`idJogador`),
  FOREIGN KEY (`idEquipeFK`) REFERENCES `equipe` (`idEquipe`)
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela campeonato
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonato` (
  `idCampeonato` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `dataInicial` DATE NOT NULL,
  `dataFinal` DATE NOT NULL,
  `qntdTimesParticipantes` INT NOT NULL,
  `premiacaoTotal` DECIMAL(10,2) NULL,
  `paisFK` INT NULL,
  `local` VARCHAR(50) NULL,
  `descricao` VARCHAR(100) NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idCampeonato`),
  FOREIGN KEY (`paisFK`) REFERENCES `paises` (`idPais`)
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela equipesCampeonato
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipesCampeonato` (
  `idEquipeCampeonato` INT NOT NULL AUTO_INCREMENT,
  `idCampeonatoFK` INT NOT NULL,
  `idEquipeFK` INT NOT NULL,
  `idJogador1FK` INT NULL,
  `idJogador2FK` INT NULL,
  `idJogador3FK` INT NULL,
  `idJogador4FK` INT NULL,
  `idJogador5FK` INT NULL,
  `colocacao` INT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idEquipeCampeonato`),
  FOREIGN KEY (`idEquipeFK`) REFERENCES `equipe` (`idEquipe`),
  FOREIGN KEY (`idJogador1FK`) REFERENCES `jogador` (`idJogador`),
  FOREIGN KEY (`idJogador2FK`) REFERENCES `jogador` (`idJogador`),
  FOREIGN KEY (`idJogador3FK`) REFERENCES `jogador` (`idJogador`),
  FOREIGN KEY (`idJogador4FK`) REFERENCES `jogador` (`idJogador`),
  FOREIGN KEY (`idJogador5FK`) REFERENCES `jogador` (`idJogador`),
  FOREIGN KEY (`idCampeonatoFK`) REFERENCES `campeonato` (`idCampeonato`)
);

-- -- ----------------------------------------------------------------------------------------------------------
-- -- tabela campeonatoXequipe
-- -- ----------------------------------------------------------------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `campeonatoXequipe` (
--   `idCampeonatoFK` INT NOT NULL,
--   `idEquipeCampeonatoFK` INT NOT NULL,
--   `dataCriacao` DATETIME NOT NULL,
--   `dataAlteracao` DATETIME NOT NULL,
--   PRIMARY KEY (`idCampeonatoFK`, `idEquipeCampeonatoFK`),
--   FOREIGN KEY (`idCampeonatoFK`) REFERENCES `campeonato` (`idCampeonato`),
--   FOREIGN KEY (`idEquipeCampeonatoFK`) REFERENCES `equipesCampeonato` (`idEquipeCampeonato`)
-- );

-- ----------------------------------------------------------------------------------------------------------
-- tabela distribuicaoPremiacaoCampeonato
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `distribuicaoPremiacaoCampeonato` (
  `idDistribuicao` INT NOT NULL AUTO_INCREMENT,
  `idCampeonatoFK` INT NOT NULL,
  `colocacao` INT NOT NULL,
  `premiacao` DECIMAL(10,2) NOT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idDistribuicao`),
  FOREIGN KEY (`idCampeonatoFK`) REFERENCES `campeonato` (`idCampeonato`)
);

-- -- ----------------------------------------------------------------------------------------------------------
-- -- tabela campeonatoXdistribuicaoPremiacaoCampeonato
-- -- ----------------------------------------------------------------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `campeonatoXdistribuicao`(
--   `idCampeonatoFK` INT NOT NULL,
--   `idDistribuicaoFK` INT NOT NULL,
--   `dataCriacao` DATETIME NOT NULL,
--   `dataAlteracao` DATETIME NOT NULL,
--   PRIMARY KEY (`idDistribuicaoFK`, `idCampeonatoFK`),
--   FOREIGN KEY (`idCampeonatoFK`) REFERENCES `campeonato` (`idCampeonato`),
--   FOREIGN KEY (`idDistribuicaoFK`) REFERENCES `distribuicaoPremiacaoCampeonato` (`idDistribuicao`)
-- );


-- ----------------------------------------------------------------------------------------------------------
-- tabela mapas
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapas` (
  `idMapa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idMapa`)
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela partidas
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `partidas` (
  `idPartida` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `categoria` ENUM('LAN','ONLINE') NOT NULL,
  `idCampeonatoFK` INT NULL,
  `idMapaFK` INT NOT NULL,
  `idEquipeA` INT NULL,
  `idEquipeB` INT NULL,
  `melhorDe` ENUM('1, 2, 3, 5') NOT NULL,
  `numeroPartida` INT NOT NULL,
  `prorrogacao` TINYINT(1) NULL,
  `partidaEncerrada` TINYINT(1) NOT NULL,
  `pontuacaoEquipeA` INT NULL,
  `pontuacaoEquipeB` INT NULL,
  `idEquipeVitoriaFK` INT NULL,
  `idEquipeDerrotaFK` INT NULL,
  `idPrimeiraPartidaFK` INT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idPartida`),
  FOREIGN KEY (`idCampeonatoFK`) REFERENCES `campeonato` (`idCampeonato`),
  FOREIGN KEY (`idMapaFK`) REFERENCES `mapas` (`idMapa`),
  FOREIGN KEY (`idEquipeA`) REFERENCES `equipe` (`idEquipe`),
  FOREIGN KEY (`idEquipeB`) REFERENCES `equipe` (`idEquipe`),
  FOREIGN KEY (`idEquipeVitoriaFK`) REFERENCES `equipe` (`idEquipe`),
  FOREIGN KEY (`idEquipeDerrotaFK`) REFERENCES `equipe` (`idEquipe`),
  FOREIGN KEY (`idPrimeiraPartidaFK`) REFERENCES `partidas` (`idPartida`)
);


-- ----------------------------------------------------------------------------------------------------------
-- tabela jogadorPartida
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `jogadorPartida` (
  `idJogadorPartida` CHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `idPartidaFK` INT NOT NULL,
  `idJogadorFK` INT NULL,
  `qntdVitimas` INT NULL,
  `qntdMortes` INT NULL,
  `qntdAssistencias` INT NULL,
  `porcentagemHeadshot` INT NULL,
  `mediaDanoPorRodada` INT NULL,
  `idEquipeFK` INT NOT NULL,
  `partidaResultado` TINYINT(1) NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idJogadorPartida`),
  FOREIGN KEY (`idPartidaFK`) REFERENCES `partidas` (`idPartida`),
  FOREIGN KEY (`idJogadorFK`) REFERENCES `jogador` (`idJogador`),
  FOREIGN KEY (`idEquipeFK`) REFERENCES `equipe` (`idEquipe`)
);

-- -- ----------------------------------------------------------------------------------------------------------
-- -- tabela equipePartida
-- -- ----------------------------------------------------------------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `equipePartida` (
--   `idEquipePartida` CHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
--   `idPartidaFK` INT NOT NULL,
--   `idEquipeFK` INT NULL,
--   `idJogadorPartida1FK` CHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
--   `idJogadorPartida2FK` CHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
--   `idJogadorPartida3FK` CHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
--   `idJogadorPartida4FK` CHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
--   `idJogadorPartida5FK` CHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
--   `pontuacao` INT NULL,
--   `resultado` ENUM('VITORIA', 'DERROTA'),
--   `dataCriacao` DATETIME NOT NULL,
--   `dataAlteracao` DATETIME NOT NULL,
--   PRIMARY KEY (`idEquipePartida`),
--   CONSTRAINT `partidaDeEquipePartidaFK`
--     FOREIGN KEY (`idPartidaFK`)
--     REFERENCES `partida` (`idPartida`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `equipeDeEquipePartidaFK`
--     FOREIGN KEY (`idEquipeFK`)
--     REFERENCES `equipe` (`idEquipe`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `jogador1DeEquipePartidaFK`
--     FOREIGN KEY (`idJogadorPartida1FK`)
--     REFERENCES `jogadorPartida` (`idJogadorPartida`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `jogador1DeEquipePartidaFK`
--     FOREIGN KEY (`idJogadorPartida2FK`)
--     REFERENCES `jogadorPartida` (`idJogadorPartida`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `jogador1DeEquipePartidaFK`
--     FOREIGN KEY (`idJogadorPartida3FK`)
--     REFERENCES `jogadorPartida` (`idJogadorPartida`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `jogador1DeEquipePartidaFK`
--     FOREIGN KEY (`idJogadorPartida4FK`)
--     REFERENCES `jogadorPartida` (`idJogadorPartida`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `jogador1DeEquipePartidaFK`
--     FOREIGN KEY (`idJogadorPartida5FK`)
--     REFERENCES `jogadorPartida` (`idJogadorPartida`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION  
-- );