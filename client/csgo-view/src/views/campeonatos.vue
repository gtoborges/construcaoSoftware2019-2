<template>
  <v-layout
    text-center
    wrap
  >
    <v-flex mb-4>
      <h1 class="display-2 font-weight-bold mb-3">
        Campeonatos
      </h1>
      <p class="subheading font-weight-regular">
        Campeonatos que estão rolando:
        {{ campeonatos }}
      </p>
    </v-flex>
  </v-layout>
</template>

<script>
import api from '../services/api'

let vm
export default {
  data() {
    return {
      campeonatos: []
    }
  },
  created() {
    vm = this
    vm.buscarCampeonatos()
  },
  methods: {
    async buscarCampeonatos() {
      let resposta = await api.campeonato.buscar()

      console.log(resposta.data)
      vm.campeonatos = resposta.data
    }
  }

}
</script>