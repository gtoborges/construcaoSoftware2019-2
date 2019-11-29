const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

async function executar() {

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

}

executar()