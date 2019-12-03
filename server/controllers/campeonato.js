const service = require('../services')

const buscarCampeonato = async (req, res) => {

  let idCampeonato = req.params.id

  try{
    let response = await service.campeonato.buscarCampeonato(idCampeonato)
    res.status(200).send(response)
  } catch (err) {
    console.log(err.message)
    res.status(500).send(err.message)
  }

}

const listarCampeonatos = async (req, res) => {

  try{
    let response = await service.campeonato.listarCampeonatos()
    res.status(200).send(response)
  } catch (err) {
    console.log(err.message)
    res.status(500).send(err.message)
  }

}

module.exports = {
  buscarCampeonato,
  listarCampeonatos
}