const fs = require('fs');
const path = require('path');
const Sequelize = require('sequelize');
const env = process.env.NODE_ENV || 'development';
const config = require('../../config/config.json')[env];

const db = {};
const sequelize = new Sequelize(config);

fs
  .readdirSync(__dirname)
  .filter(file => (file.indexOf('.') !== 0) && (file !== path.basename(__filename)) && (file.slice(-3) === '.js'))
  .forEach((file) => {
    const model = sequelize.import(path.join(__dirname, file));
    db[model.name] = model;
  });

Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

// Relacionamentos entre as tabelas

db.jogador.hasOne(db.paises, {foreignKey: 'idPais', targetKey: 'idJogador', sourceKey: 'idPais', as: 'paisDeOrigem'})
db.jogador.hasOne(db.equipe, {foreignKey: 'idEquipe', targetKey: 'idJogador', sourceKey: 'idEquipe', as: 'equipe'})

db.equipe.hasOne(db.paises, {foreignKey: 'idPais', targetKey: 'idEquipe', sourceKey: 'idPais', as: 'paisDeOrigem'})
db.equipe.hasMany(db.jogador, {foreignKey: 'idEquipe', targetKey: 'idJogador', sourceKey: 'idEquipe', as: 'jogadores'})

db.campeonato.hasOne(db.paises, {foreignKey: 'idPais', targetKey: 'idCampeonato', sourceKey: 'idPais', as: 'paisDeOrigem'})
db.campeonato.hasMany(db.distribuicaoPremiacaoCampeonato, {foreignKey: 'idCampeonato', targetKey: 'idCampeonato', sourceKey: 'idCampeonato', as: 'distribuicao'})
db.campeonato.hasMany(db.equipesCampeonato, {foreignKey: 'idCampeonato', targetKey: 'idCampeonato', sourceKey: 'idCampeonato', as: 'equipesParticipantes'})
db.campeonato.hasMany(db.partidas, {foreignKey: 'idCampeonato', targetKey: 'idCampeonato', sourceKey: 'idCampeonato', as: 'partidasDoCampeonato'})

db.equipesCampeonato.hasOne(db.equipe, {foreignKey: 'idEquipe', targetKey: 'idEquipe', sourceKey: 'idEquipe', as: 'equipe'})
db.equipesCampeonato.hasOne(db.jogador, {foreignKey: 'idJogador', targetKey: 'idJogador1', sourceKey: 'idJogador1', as: 'jogador1'})
db.equipesCampeonato.hasOne(db.jogador, {foreignKey: 'idJogador', targetKey: 'idJogador2', sourceKey: 'idJogador2', as: 'jogador2'})
db.equipesCampeonato.hasOne(db.jogador, {foreignKey: 'idJogador', targetKey: 'idJogador3', sourceKey: 'idJogador3', as: 'jogador3'})
db.equipesCampeonato.hasOne(db.jogador, {foreignKey: 'idJogador', targetKey: 'idJogador4', sourceKey: 'idJogador4', as: 'jogador4'})
db.equipesCampeonato.hasOne(db.jogador, {foreignKey: 'idJogador', targetKey: 'idJogador5', sourceKey: 'idJogador5', as: 'jogador5'})

db.partidas.hasOne(db.equipe, {foreignKey: 'idEquipe', targetKey: 'idEquipe', sourceKey: 'idEquipeA', as: 'equipeA'})
db.partidas.hasOne(db.equipe, {foreignKey: 'idEquipe', targetKey: 'idEquipe', sourceKey: 'idEquipeB', as: 'equipeB'})
db.partidas.hasOne(db.mapas, {foreignKey: 'idMapa', targetKey: 'idMapa', sourceKey: 'idMapa', as: 'mapaDaPartida'})




db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;