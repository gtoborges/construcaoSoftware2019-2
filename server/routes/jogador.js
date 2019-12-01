const express = require('express')
const router = express.Router();

const controllers = require('../controllers')

router
  .get('/', controllers.jogador.listarJogadores)
  .get('/:id', controllers.jogador.buscarJogador)
  // .post('/', controllers.jogador.criarJogador)
  // .put('/', controllers.jogador.editarJogador)
  // .delete('/', controllers.jogador.deletarJogador)

module.exports = router