<template>
  <v-layout
    text-center
    wrap
  >
    <v-flex mb-4>
      <h1 class="display-2 font-weight-bold mb-3">
        lalala
      </h1>
      <p class="subheading font-weight-regular">
        {{jogador ? jogador : ''}}
      </p>
    </v-flex>
  </v-layout>
</template>
<script>
// import http from '../utils/axiosConfig'
import api from '../services/api'

let vm
export default {

  data() {

    return {
      jogador: []
    }

  },
  created() {
    vm = this
    vm.buscarJogadores()
  },
  methods:{

    buscarJogadores(){
      api.jogador.buscar().then(resposta => {
        vm.jogador = resposta.data
      }).catch(err => {
        console.log(err)
        this.$swal({
          type: 'error',
          title: 'Erro inesperado!',
          text: 'Jogador não encontrado!'
        })
      })
    }

  }

}
</script>