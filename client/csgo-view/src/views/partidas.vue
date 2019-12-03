<template>
  <v-layout
    text-center
    wrap
  >
    <v-flex mb-4>
      <h1 class="display-2 font-weight-bold mb-3">
        Partidas
      </h1>
      <p class="subheading font-weight-regular">
        Partidas que estão rolando:
      </p>
    </v-flex>
  </v-layout>
</template>

<script>
import api from '../services/api'

let vm
export default {
  props: ['id'],
  data() {
    return {
      partida: {}
    }
  },
  created() {
    vm = this
    vm.buscarPartida()
  },
  methods: {
    async buscarPartida() {
      let resposta = await api.partida.buscar(this.id)

      console.log(resposta.data)
      vm.partida = resposta.data
    }
  }

}
</script>