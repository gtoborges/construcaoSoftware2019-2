const db = require('../app/models')

const testar = async (test) => {

  console.log(`\n Função testar sendo executada, chamada pelo ${test}`)
  
  return Promise.resolve({resposta: "Resposta do server"})
}

const testarSalvarNoBanco = async (test) => {

  console.log(test)

  let testeCriado = await db.teste.create(test)
  
  return Promise.resolve(testeCriado)
}

module.exports = {
  testar,
  testarSalvarNoBanco
}