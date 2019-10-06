const service = require('../services')

const testarGet = (req, res) => {

  let test = 'Método Get'

  service.teste.testar(test).then(response => {
    console.log('Response arrived')
    res.status(200).send(response)
  }).catch( err => {
    console.log('Error on the service')
    res.status(500).send(err)
  })

}

const testarPost = (req, res) => {
  
  let test = 'Método Post'

  service.teste.testar(test).then(response => {
    console.log('Response arrived')
    res.status(200).send(response)
  }).catch( err => {
    console.log('Error on the service')
    res.status(500).send(err)
  })

}

const testarPut = (req, res) => {

  let test = 'Método Put'

  service.teste.testar(test).then(response => {
    console.log('Response arrived')
    res.status(200).send(response)
  }).catch( err => {
    console.log('Error on the service')
    res.status(500).send(err)
  })

}

const testarDelete = (req, res) => {

  let test = 'Método Delete'

  service.teste.testar(test).then(response => {
    console.log('Response arrived')
    res.status(200).send(response)
  }).catch( err => {
    console.log('Error on the service')
    res.status(500).send(err)
  })

}

module.exports = {
  testarGet,
  testarPost,
  testarPut,
  testarDelete
}