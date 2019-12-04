const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

async function criarPartidas(){

  const partidas = require("./partidasSeed.js").partidas

  try {
    let transacao = await db.sequelize.transaction({ isolationLevel: db.Sequelize.Transaction.ISOLATION_LEVELS.READ_UNCOMMITTED })
    
    for(p of partidas) {
      await db.partidas.create(p, { transaction: transacao })
    }

    await transacao.commit();
    // await transacao.rollback();
  } catch (e) {
    console.error(e)
    await transacao.rollback();
    throw e
  }
  
}

criarPartidas()