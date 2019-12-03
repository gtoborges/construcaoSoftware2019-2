const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

const buscarCampeonato = async (idCampeonato) => {

  if(!idCampeonato) {
    throw new Error('Não foi possível buscar por um jogador!')
  }

  let opcoes = {
    where: {
      idCampeonato: idCampeonato
    },
    // include: [
    //   {
    //     model: db.paises,
    //     as: 'paisDeOrigem'
    //   },
    //   {
    //     model: db.jogador,
    //     as: 'jogadores'
    //   }
    // ]
  }

  let campeonato = await db.campeonato.findOne(opcoes)
  
  if(!campeonato) {
    throw new Error('Jogador não encontrado!')
  }

  return campeonato
}

const listarCampeonatos = async () => {

  let opcoes = {
    // attributes: ['idEquipe', 'nome', 'tag'],
    // include: [
    //   {
    //     model: db.paises,
    //     as: 'paisDeOrigem',
    //     attributes: ['pais']
    //   },
    //   {
    //     model: db.jogador,
    //     as: 'jogadores',
    //     attributes: ['idJogador', 'nome', 'sobrenome', 'apelido']
    //   }
    // ],
    // order: [['nome', 'ASC']]
  }

  return db.campeonato.findAll(opcoes)
}

module.exports = {
  buscarCampeonato,
  listarCampeonatos
}