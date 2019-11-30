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

db.campeonato.hasOne(db.paises, {foreignKey: 'idPais', as: 'paisDeOrigem'})

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;