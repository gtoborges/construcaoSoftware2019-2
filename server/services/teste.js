const testar = (test) => {

  console.log(`\n Função testar sendo executada, chamada pelo ${test}`)

  
  return Promise.resolve(true)
}

module.exports = {
  testar
}