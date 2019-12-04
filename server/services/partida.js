const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

const buscarPartida = async (idPartida) => {

  if(!idPartida) {
    throw new Error('Não foi possível buscar por um jogador!')
  }

  let opcoes = {
    where: {
      idPartida: idPartida
    },
    include: [
      {
        model: db.equipe,
        as: 'equipeA'
      },
      {
        model: db.equipe,
        as: 'equipeB'
      },
      {
        model: db.mapas,
        as: 'mapaDaPartida'
      }
    ]
  }

  let partida = await db.partidas.findOne(opcoes)
  if(!partida) {
    throw new Error('Jogador não encontrado!')
  }

  return partida
}

const listarPartidas = async () => {

  let opcoes = {
    include: [
      {
        model: db.mapas,
        as: 'mapaDaPartida'
      }
    ],
    order: [['data', 'DESC']]
  }

  return db.partidas.findAll(opcoes)
}

module.exports = {
  buscarPartida,
  listarPartidas
}