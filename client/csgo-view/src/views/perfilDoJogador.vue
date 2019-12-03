<template>
  <v-layout
    text-center
    wrap
  >
    <v-flex mb-4>
      <h1 class="display-2 font-weight-bold mb-3">
        Jogador
      </h1>
      <p class="subheading font-weight-regular">
        {{ jogador }}
      </p>
    </v-flex>
  </v-layout>
</template>

<script>
import api from '../services/api'

let vm
export default {
  props: ['id', 'apelido'],
  data() {
    return {
      jogador: {}
    }
  },
  created() {
    vm = this
    vm.buscarJogador()
  },
  methods: {
    async buscarJogador() {
      let resposta = await api.jogador.buscar(this.id)

      console.log(resposta.data)
      vm.jogador = resposta.data
    }
  }

}
</script>