const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

async function criarEquipesEJogadores(){

  const equipes = require("./equipesSeed.js").equipes
  const jogadores = require("./jogadoresSeed.js").jogadores

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

criarEquipesEJogadores()