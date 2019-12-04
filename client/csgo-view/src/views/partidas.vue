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
        {{ partidas }}
      </p>
      <div v-for="partida in partidas" :key="partida.idPartida">
        <v-btn dark style="margin-top: 20px" @click="direcionarParaPaginaDaPartida(partida)">{{ partida.idPartida }} - {{$moment(partida.data).format("DD/MM/YYYY HH:mm:ss")}}</v-btn>
      </div>
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
      partidas: {}
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
      vm.partidas = resposta.data
    },
    async direcionarParaPaginaDaPartida(partida){
      let resultado = await this.$swal({
        type: 'info', 
        text: `Deseja ver os detalhes de ${partida.idPartida}?`,
        showCloseButton: true,
        showCancelButton: true,
      })

      if(resultado.value) {
        vm.$router.push({ path: `/partida/${partida.idPartida}`, params: {id: partida.idPartida} })
      }
    }
  }

}
</script>