const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const router = express.Router()
const cors = require('cors')

// app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json())
app.use(cors())

//importação dos arquivos de rotas
const teste = require('./routes/teste')
const jogador = require('./routes/jogador')
const equipe = require('./routes/equipe')
const campeonato = require('./routes/campeonato')
const partida = require('./routes/partida')

//rotas da aplicação

router.use('/teste', teste)
router.use('/jogador', jogador)
router.use('/equipe', equipe)
router.use('/campeonato', campeonato)
router.use('/partida', partida)

app.use(router)

app.listen(3000, () => {
  console.log("Server listening on port 3000")
})