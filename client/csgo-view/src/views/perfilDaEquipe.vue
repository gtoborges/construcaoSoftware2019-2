<template>
  <v-layout
    text-center
    wrap
  >
    <v-flex mb-4>
      <h1 class="display-2 font-weight-bold mb-3">
        Equipe
      </h1>
      <p class="subheading font-weight-regular">
        {{equipe}}
      </p>
    </v-flex>
  </v-layout>
</template>

<script>
import api from '../services/api'

let vm
export default {
  props: ['id', 'tag'],
  data() {
    return {
      equipe: {}
    }
  },
  created() {
    vm = this
    vm.buscarEquipe()
  },
  methods: {
    async buscarEquipe() {
      let resposta = await api.equipe.buscar(this.id)

      console.log(resposta.data)
      vm.equipe = resposta.data
    }
  }

}
</script>