const express = require('express')
const router = express.Router();

const controllers = require('../controllers')

router
  .get('/:id', controllers.jogador.buscarJogador)
  // .post('/', controllers.jogador.criarJogador)
  // .put('/', controllers.jogador.editarJogador)
  // .delete('/', controllers.jogador.deletarJogador)

module.exports = router