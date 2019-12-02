const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

async function criarCameonatos(){

  const campeonatos = require("./campeonatosSeed.js").campeonatos

  try {
    let transacao = await db.sequelize.transaction({ isolationLevel: db.Sequelize.Transaction.ISOLATION_LEVELS.READ_UNCOMMITTED })
    
    for(c of campeonatos) {

      await db.campeonato.create(c.campeonato, { transaction: transacao })
      for(dpc of c.distrubuicaoPremiacaoCampeonato){
        await db.distribuicaoPremiacaoCampeonato.create(dpc, { transaction: transacao })
      }
      for(ec of c.equipesCampeonato){
        await db.equipesCampeonato.create(ec, { transaction: transacao })
      }
  
    }

    await transacao.commit();
    // await transacao.rollback();
  } catch (e) {
    console.error(e)
    await transacao.rollback();
    throw e
  }
  
}

criarCameonatos()