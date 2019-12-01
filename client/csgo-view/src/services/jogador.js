import http from '../utils/axiosConfig'

const endpoint = '/jogador'

function buscar(id) {
  if(id) return http.get(`${endpoint}/${id}`)
  else return http.get(endpoint)
}

export default {
  buscar
}