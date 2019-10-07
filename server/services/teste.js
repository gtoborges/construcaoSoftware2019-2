const testar = (test) => {

  console.log(`\n Função testar sendo executada, chamada pelo ${test}`)

  
  return Promise.resolve({resposta: "Resposta do server"})
}

module.exports = {
  testar
}