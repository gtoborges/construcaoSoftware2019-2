import axios from 'axios'

const http = () => {

  const defaultOptions = {
    baseURL: 'http://localhost:3000',
    responseType: 'json',
    crossdomain: true,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
    
  }
  
  let http = axios.create(defaultOptions)
  
  const TESTE = 'TESTING HEADER CONFIGURATION'
  
  http.defaults.headers['access-token'] = TESTE

  return http
}

export default http()