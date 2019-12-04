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
      <div v-for="campeonato in campeonatos" :key="campeonato.idCampeonato">
        <v-btn dark style="margin-top: 20px" @click="direcionarParaPaginaDoCampeonato(campeonato)">{{ campeonato.nome }}</v-btn>
      </div>
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
    },
    async direcionarParaPaginaDoCampeonato(campeonato){
      let resultado = await this.$swal({
        type: 'info', 
        text: `Deseja ver os detalhes de ${campeonato.nome}?`,
        showCloseButton: true,
        showCancelButton: true,
      })

      if(resultado.value) {
        vm.$router.push({ path: `/campeonato/${campeonato.idCampeonato}`, params: {id: campeonato.idCampeonato} })
      }

    }
  }

}
</script>