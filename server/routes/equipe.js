const express = require('express')
const router = express.Router();

const controllers = require('../controllers')

router
  .get('/', controllers.equipe.listarEquipes)
  .get('/:id', controllers.equipe.buscarEquipe)

module.exports = router