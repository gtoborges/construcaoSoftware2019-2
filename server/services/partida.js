const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

const buscarPartida = async (idPartida) => {

  if(!idPartida) {
    throw new Error('Não foi possível buscar por um jogador!')
  }

  let opcoes = {
    // where: {
    //   idJogador: idJogador
    // },
    // include: [
    //   {
    //     model: db.paises,
    //     as: 'paisDeOrigem'
    //   },
    //   {
    //     model: db.equipe,
    //     as: 'equipe'
    //   }
    // ]
  }

  let partida = await db.partida.findOne(opcoes)
  if(!partida) {
    throw new Error('Jogador não encontrado!')
  }

  return partida
}

const listarPartidas = async () => {

  let opcoes = {
    // attributes: ['idJogador', 'nome', 'sobrenome', 'apelido', 'dataNascimento'],
    // include: [
    //   {
    //     model: db.paises,
    //     as: 'paisDeOrigem',
    //     attributes: ['pais']
    //   },
    //   {
    //     model: db.equipe,
    //     as: 'equipe',
    //     attributes: ['nome', 'tag']
    //   }
    // ],
    // order: [['nome', 'ASC']]
  }

  return db.partida.findAll(opcoes)
}

module.exports = {
  buscarPartida,
  listarPartidas
}