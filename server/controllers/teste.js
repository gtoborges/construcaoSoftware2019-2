const service = require('../services')

const testarGet = async (req, res) => {

  let test = 'Método Get'

  // Maneira de responder o servidor com promise.then

  /*service.teste.testar(test).then(response => {
    console.log('Response arrived')
    res.status(200).send(response)
  }).catch( err => {
    console.log('Error on the service')
    res.status(500).send(err)
  })*/

  // Ṃaneira de responder o servidor com async/await (preferível - adotar como padrão)
  try {
    console.log('Request received')
    let response = await service.teste.testar(test)
    res.status(200).send(response)
  } catch (err) {
    res.status(500).send(err)
  }

}

const testarPost = async (req, res) => {
  
  let test = 'Método Post'

  // service.teste.testar(test).then(response => {
  //   console.log('Response arrived')
  //   res.status(200).send(response)
  // }).catch( err => {
  //   console.log('Error on the service')
  //   res.status(500).send(err)
  // })

  try {
    console.log('Request received')
    let response = await service.teste.testar(test)
    res.status(200).send(response)
  } catch (err) {
    res.status(500).send(err)
  }

}

const testarPut = async (req, res) => {

  let test = 'Método Put'

  // service.teste.testar(test).then(response => {
  //   console.log('Response arrived')
  //   res.status(200).send(response)
  // }).catch( err => {
  //   console.log('Error on the service')
  //   res.status(500).send(err)
  // })

  try {
    console.log('Request received')
    let response = await service.teste.testar(test)
    res.status(200).send(response)
  } catch (err) {
    res.status(500).send(err)
  }

}

const testarDelete = async (req, res) => {

  let test = 'Método Delete'

  // service.teste.testar(test).then(response => {
  //   console.log('Response arrived')
  //   res.status(200).send(response)
  // }).catch( err => {
  //   console.log('Error on the service')
  //   res.status(500).send(err)
  // })

  try {
    console.log('Request received')
    let response = await service.teste.testar(test)
    res.status(200).send(response)
  } catch (err) {
    res.status(500).send(err)
  }

}

module.exports = {
  testarGet,
  testarPost,
  testarPut,
  testarDelete
}