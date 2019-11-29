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
  }

  let a = await db.jogador.findAll(opcoes)
  console.log(a[0].dataValues)
  console.log('\n\n\n')
  console.log(a[0].equipe.dataValues)
  console.log('\n\n\n')
  console.log(a[0].get('paisDeOrigem').dataValues)
  console.log('\n\n\n')
  console.log(a.length)

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
  }

  let a = await db.equipe.findAll(opcoes)
  console.log(a[0].dataValues)
  console.log('\n\n\n')
  console.log(a[1].dataValues)
  console.log('\n\n\n')
  console.log(a.length)

  let b = await db.jogador.findAll({where: {idEquipe: a[0].idEquipe}, raw: true})
  console.log(b)

}

testeEquipe()