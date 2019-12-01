const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

const buscarJogador = async (idJogador) => {

  if(!idJogador) {
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

const listarJogadores = async () => {

  let opcoes = {
    attributes: ['nome', 'sobrenome', 'apelido', 'dataNascimento'],
    include: [
      {
        model: db.paises,
        as: 'paisDeOrigem',
        attributes: ['pais']
      },
      {
        model: db.equipe,
        as: 'equipe',
        attributes: ['nome', 'tag']
      }
    ],
    order: [['nome', 'ASC']]
  }

  return db.jogador.findAll(opcoes)
}

module.exports = {
  buscarJogador,
  listarJogadores
}