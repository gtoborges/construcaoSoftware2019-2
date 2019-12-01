const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

const buscarJogador = async (idJogador) => {

  if(!idJogador) {
    console.log('lalala')
    throw new Error('Não foi possível buscar por um jogador!')
  }

  let opcoes = {
    where: {
      idJogador: idJogador
    },
    include: [
      {
        model: db.paises,
        as: 'paisDeOrigem'
      },
      {
        model: db.equipe,
        as: 'equipe'
      }
    ]
  }

  let jogador = await db.jogador.findOne(opcoes)
  if(!jogador) {
    throw new Error('Jogador não encontrado!')
  }

  return jogador
}

module.exports = {
  buscarJogador
}