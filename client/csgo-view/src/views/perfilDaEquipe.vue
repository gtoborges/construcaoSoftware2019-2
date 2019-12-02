<template>
  <v-layout
    text-center
    wrap
  >
    <v-flex mb-4>
      <h1 class="display-2 font-weight-bold mb-3">
        Teste 2
      </h1>
      <p class="subheading font-weight-regular">
        teste de componente
      </p>
    </v-flex>
  </v-layout>
</template>

<script>
import api from '../services/api'

let vm
export default {
  props: ['id', 'tag'],

  created() {
    vm = this
    vm.buscarJogador()
  },
  methods: {
    async buscarJogador() {
      let resposta = await api.equipe.buscar(this.id)

      console.log(resposta.data)
    }
  }

}
</script>