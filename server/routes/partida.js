const express = require('express')
const router = express.Router();

const controllers = require('../controllers')

router
  .get('/', controllers.partida.listarPartidas)
  .get('/:id', controllers.partida.buscarPartida)

module.exports = router