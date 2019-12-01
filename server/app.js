const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const router = express.Router()
const cors = require('cors')

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json())
app.use(cors())

//importação dos arquivos de rotas
const teste = require('./routes/teste')

//rotas da aplicação

router.use('/teste', teste)

app.use(router)



app.listen(3000, () => {
  console.log("Server listening on port 3000")
})