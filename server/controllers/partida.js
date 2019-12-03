const service = require('../services')

const buscarPartida = async (req, res) => {

  let idPartida = req.params.id

  try{
    let response = await service.partida.buscarPartida(idPartida)
    res.status(200).send(response)
  } catch (err) {
    console.log(err.message)
    res.status(500).send(err.message)
  }

}

const listarPartidas = async (req, res) => {

  try{
    let response = await service.partida.listarPartidas()
    res.status(200).send(response)
  } catch (err) {
    console.log(err.message)
    res.status(500).send(err.message)
  }

}

module.exports = {
  buscarPartida,
  listarPartidas
}