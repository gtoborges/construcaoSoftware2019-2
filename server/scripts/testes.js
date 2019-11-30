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
      // {
      //   model: db.equipe,
      //   as: 'equipe'
      // }
    ],
  }

  let jogadores = await db.jogador.findAll(opcoes)
  console.log(jogadores[3].dataValues)
  // for(jogador of jogadores){
  //   console.log('\n\n')
  //   console.log(jogador.dataValues)
  // }

}
testeJogador()

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
// testeEquipe()

async function criarEquipesEJogadores(){

  const equipes = require("./equipes.js").equipes
  const jogadores = require("./jogadores.js").jogadores

  try {
    let transacao = await db.sequelize.transaction({ isolationLevel: db.Sequelize.Transaction.ISOLATION_LEVELS.READ_UNCOMMITTED })
    
    for(equipe of equipes) {
      await db.equipe.create(equipe, { transaction: transacao })
    }

    for(jogador of jogadores) {
      await db.jogador.create(jogador, { transaction: transacao })
    }

    await transacao.commit();
    // await transacao.rollback();
  } catch (e) {
    console.error(e)
    await transacao.rollback();
    throw e
  }
  
}
// criarEquipesEJogadores()