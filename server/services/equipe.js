const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

const buscarEquipe = async (idEquipe) => {

  if(!idEquipe) {
    throw new Error('Não foi possível buscar por um jogador!')
  }

  let opcoes = {
    where: {
      idEquipe: idEquipe
    },
    include: [
      {
        model: db.paises,
        as: 'paisDeOrigem'
      },
      {
        model: db.jogador,
        as: 'jogadores'
      }
    ]
  }

  let equipe = await db.equipe.findOne(opcoes)
  
  if(!equipe) {
    throw new Error('Jogador não encontrado!')
  }

  return equipe
}

const listarEquipes = async () => {

  let opcoes = {
    attributes: ['idEquipe', 'nome', 'tag'],
    include: [
      {
        model: db.paises,
        as: 'paisDeOrigem',
        attributes: ['pais']
      },
      {
        model: db.jogador,
        as: 'jogadores',
        attributes: ['idJogador', 'nome', 'sobrenome', 'apelido']
      }
    ],
    order: [['nome', 'ASC']]
  }

  return db.equipe.findAll(opcoes)
}

module.exports = {
  buscarEquipe,
  listarEquipes
}