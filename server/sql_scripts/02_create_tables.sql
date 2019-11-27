-- ----------------------------------------------------------------------------------------------------------
-- tabela nacionalidade
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `paises` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `pais` VARCHAR(50) NOT NULL,
  `nacionalidade` VARCHAR(50) NOT NULL,
  `sigla` VARCHAR(3) NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
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
  CONSTRAINT `EquipeNacionalidadeFK`
    FOREIGN KEY (`paisDeOrigemFK`)
    REFERENCES `paises` (`idPais`)  
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
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
  CONSTRAINT `JogadorNacionalidadeFK`
    FOREIGN KEY (`paisDeOrigemFK`)
    REFERENCES `paises` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `JogadorEquipeFK`
    FOREIGN KEY (`equipeFK`)
    REFERENCES `equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela historicoJogador
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `historicoJogador` (
  `idJogador` INT NOT NULL,
  `idEquipe` INT NOT NULL,
  `dataEntrada` DATE NOT NULL,
  `dataSaida` DATE NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idJogador`),
  CONSTRAINT `JogadorHistoricoJogadorFK`
    FOREIGN KEY (`idJogador`)
    REFERENCES `jogador` (`idJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EquipeHistoricoJogadorFK`
    FOREIGN KEY (`idEquipe`)
    REFERENCES `equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela campeonato
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonato` (
  `idCampeonato` INT NOT NULL,
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
  CONSTRAINT `campeonatoPaisFK`
    FOREIGN KEY (`paisFK`)
    REFERENCES `paises` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela equipesCampeonato
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipesCampeonato` (
  `idEquipeCampeonato` INT NOT NULL,
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
  CONSTRAINT `equipesCampeonatoEquipesFK`
    FOREIGN KEY (`idEquipeFK`)
    REFERENCES `equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipesCampeonatoJogador1FK`
    FOREIGN KEY (`idJogador1FK`)
    REFERENCES `jogador` (`idJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipesCampeonatoJogador2FK`
    FOREIGN KEY (`idJogador2FK`)
    REFERENCES `jogador` (`idJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipesCampeonatoJogador3FK`
    FOREIGN KEY (`idJogador3FK`)
    REFERENCES `jogador` (`idJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipesCampeonatoJogador4FK`
    FOREIGN KEY (`idJogador4FK`)
    REFERENCES `jogador` (`idJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipesCampeonatoJogador5FK`
    FOREIGN KEY (`idJogador5FK`)
    REFERENCES `jogador` (`idJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela campeonatoXequipe
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonatoXequipe` (
  `idCampeonatoFK` INT NOT NULL,
  `idEquipeCampeonatoFK` INT NOT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idCampeonatoFK`, `idEquipeCampeonatoFK`),
  CONSTRAINT `campeonatoXequipeFK`
    FOREIGN KEY (`idCampeonatoFK`)
    REFERENCES `campeonato` (`idCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipeXcampeonatoFK`
    FOREIGN KEY (`idEquipeCampeonatoFK`)
    REFERENCES `equipesCampeonato` (`idEquipeCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela distribuicaoPremiacaoCampeonato
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `distribuicaoPremiacaoCampeonato` (
  `idDistribuicao` INT NOT NULL,
  `colocacao` INT NOT NULL,
  `premiacao` DECIMAL(10,2) NOT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idDistribuicao`)
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela campeonatoXdistribuicaoPremiacaoCampeonato
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `campeonatoXdistribuicao`(
  `idCampeonatoFK` INT NOT NULL,
  `idDistribuicaoFK` INT NOT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idDistribuicaoFK`, `idCampeonatoFK`),
  CONSTRAINT `campeonatoXdistribuicaoFK`
    FOREIGN KEY (`idCampeonatoFK`)
    REFERENCES `campeonato` (`idCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `distribuicaoXcampeonatoFK`
    FOREIGN KEY (`idDistribuicaoFK`)
    REFERENCES `distribuicaoPremiacaoCampeonato` (`idDistribuicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- ----------------------------------------------------------------------------------------------------------
-- tabela mapas
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mapas` (
  `idMapa` INT NOT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idMapa`)
);

-- ----------------------------------------------------------------------------------------------------------
-- tabela partidas
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `partidas` (
  `idPartida` INT NOT NULL,
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
  CONSTRAINT `partidaDeCampeonatoFK`
    FOREIGN KEY (`idCampeonatoFK`)
    REFERENCES `campeonato` (`idCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mapaDaPartidaFK`
    FOREIGN KEY (`idMapaFK`)
    REFERENCES `mapas` (`idMapa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipeAPartidaFK`
    FOREIGN KEY (`idEquipeA`)
    REFERENCES `equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipeBPartidaFK`
    FOREIGN KEY (`idEquipeB`)
    REFERENCES `equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipeVitoriaPartidaFK`
    FOREIGN KEY (`idEquipeVitoriaFK`)
    REFERENCES `equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipeDerrotaPartidaFK`
    FOREIGN KEY (`idEquipeDerrotaFK`)
    REFERENCES `equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `primeiraPartidaFK`
    FOREIGN KEY (`idPrimeiraPartidaFK`)
    REFERENCES `partidas` (`idPartida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
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
  `qntdAssistencia` INT NULL,
  `porcentagemHeadshot` INT NULL,
  `mediaDanoPorRodada` INT NULL,
  `idEquipeFK` INT NOT NULL,
  `partidaResultado` TINYINT(1) NULL,
  `dataCriacao` DATETIME NOT NULL,
  `dataAlteracao` DATETIME NOT NULL,
  PRIMARY KEY (`idJogadorPartida`),
  CONSTRAINT `partidaDeJogadorPartidaFK`
    FOREIGN KEY (`idPartidaFK`)
    REFERENCES `partidas` (`idPartida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `jogadorDeJogadorPartidaFK`
    FOREIGN KEY (`idJogadorFK`)
    REFERENCES `jogador` (`idJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipeDeJogadorPartidaFK`
    FOREIGN KEY (`idEquipeFK`)
    REFERENCES `equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
