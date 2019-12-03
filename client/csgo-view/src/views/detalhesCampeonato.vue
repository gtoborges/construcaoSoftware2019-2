<template>
  <v-layout
    text-center
    wrap
  >
    <v-flex mb-4>
      <h1 class="display-2 font-weight-bold mb-3">
        Campeonato detalhes
      </h1>
      <p class="subheading font-weight-regular">
        {{ campeonato }}
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
      campeonato: []
    }
  },
  created() {
    vm = this
    vm.buscarCampeonato()
  },
  methods: {
    async buscarCampeonato() {
      let resposta = await api.campeonato.buscar(this.id)

      console.log(resposta.data)
      vm.campeonatos = resposta.data
    }
  }

}
</script>