const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

async function testeJogador() {

  let opcoes = {
    include: [
      {
        model: db.paises,
        as: 'paisDeOrigem'
      },
      {
        model: db.equipe,
        as: 'equipe'
      }
    ],
    raw: true,
  }

  let jogadores = await db.jogador.findAll(opcoes)
  for(jogador of jogadores){
    console.log('\n\n')
    console.log(jogador)
  }

}
// testeJogador()

async function testeEquipe() {

  let opcoes = {
    include: [
      {
        model: db.paises,
        as: 'paisDeOrigem'
      },
    ],
    raw: true
  }

  let equipes = await db.equipe.findAll(opcoes)
  for(equipe of equipes){
    console.log('\n\n')
    console.log(equipe)
  }

}
// testeEquipe()

async function jogadoresDaEquipe() {

  let opcoes = {
    include: [
      {
        model: db.paises,
        as: 'paisDeOrigem'
      },
      {
        model: db.jogador,
        as: 'jogadores',
        include: [
          {
            model: db.paises,
            as: 'paisDeOrigem'
          }
        ]
      },
    ],
  }

  let equipes = await db.equipe.findAll(opcoes)
  // console.log(equipes[0].dataValues)
  // console.log(equipes[0].jogadores)
  // console.log(equipes[0].jogadores[0].paisDeOrigem.dataValues)
  for(equipe of equipes){
    console.log('\n\n')
    console.log(equipe.dataValues)
    for(jogador of equipe.jogadores){
      console.log('\n')
      console.log(jogador.dataValues)
    }
  }

}
// jogadoresDaEquipe()