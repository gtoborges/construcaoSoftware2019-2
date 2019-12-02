const service = require('../services')

const buscarEquipe = async (req, res) => {

  let idEquipe = req.params.id

  try{
    let response = await service.equipe.buscarEquipe(idEquipe)
    res.status(200).send(response)
  } catch (err) {
    console.log(err.message)
    res.status(500).send(err.message)
  }

}

const listarEquipes = async (req, res) => {

  try{
    let response = await service.equipe.listarEquipes()
    res.status(200).send(response)
  } catch (err) {
    console.log(err.message)
    res.status(500).send(err.message)
  }

}

module.exports = {
  buscarEquipe,
  listarEquipes
}