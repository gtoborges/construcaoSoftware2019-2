const express = require('express')
const router = express.Router();

const controllers = require('../controllers')

router
  .get('/', controllers.campeonato.listarCampeonatos)
  .get('/:id', controllers.campeonato.buscarCampeonato)



module.exports = router