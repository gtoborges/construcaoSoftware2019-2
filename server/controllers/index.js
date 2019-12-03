//ARQUIVO DE REFERENCIA PARA OS CONTROLLERS
//SEMPRE QUE UM CONTROLLER FOR CRIADO, ELE DEVERÁ SER IMPORTADO E EXPORTADO AQUI COMO SEGUE O EXEMPLO DE TESTE

const teste = require('./teste')
const jogador = require('./jogador')
const equipe = require('./equipe')
const campeonato = require('./campeonato')
const partida = require('./partida')

module.exports = {
  teste,
  jogador,
  equipe,
  campeonato,
  partida
}