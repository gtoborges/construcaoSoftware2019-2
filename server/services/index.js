//ARQUIVO DE REFERENCIA PARA OS SERVICES
//SEMPRE QUE UM SERVICE FOR CRIADO, ELE DEVERÁ SER IMPORTADO E EXPORTADO AQUI COMO SEGUE O EXEMPLO DE TESTE

const teste = require('./teste')
const jogador = require('./jogador')
const equipe = require('./equipe')

module.exports = {
  teste,
  jogador,
  equipe
}