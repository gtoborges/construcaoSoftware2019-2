<template>
  <v-layout
    text-center
    wrap
  >
    <v-flex mb-4>
      <h1 class="display-2 font-weight-bold mb-3">
        {{jogador ? `${jogador.nome} '${jogador.apelido}' ${jogador.sobrenome}` : 'Jogador'}}
      </h1>
      <p class="subheading font-weight-regular">
        {{jogador ? jogador : ''}}
      </p>
    </v-flex>
  </v-layout>
</template>
<script>
import http from '../utils/axiosConfig'

export default {
  props: {

  },
  data() {
    return {
      idJogador: 21,
      jogador: null
    }
  },
  created() {
    console.log(this.infos)
    http.get(`/jogador/${this.idJogador}`).then(resposta => {
      this.$swal('boa carai')
      console.log(resposta)
      this.jogador = resposta.data
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
</script>