const service = require('../services')

const buscarJogador = async (req, res) => {

  let idJogador = req.params.id

  try{
    let response = await service.jogador.buscarJogador(idJogador)
    res.status(200).send(response)
  } catch (err) {
    console.log(err.message)
    res.status(500).send(err.message)
  }

}

module.exports = {
  buscarJogador
}