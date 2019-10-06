const express = require('express')
const router = express.Router();

const controllers = require('../controllers')

router
  .get('/', controllers.teste.testarGet)
  .post('/', controllers.teste.testarPost)
  .put('/', controllers.teste.testarPut)
  .delete('/', controllers.teste.testarDelete)

module.exports = router