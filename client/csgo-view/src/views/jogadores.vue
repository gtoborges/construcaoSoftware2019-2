<template>
  <v-layout text-center wrap>

    <v-card class="mx-auto" max-width="800">
      
      <v-img class="white--text align-end" height="150px" src="../assets/dust2-background.jpg">
        <v-card-title class="tituloCard">Jogadores</v-card-title>
      </v-img>

      <template>
        <v-card>
          <v-card-title>
            <v-text-field v-model="search" label="Pesquisar" single-line hide-details></v-text-field>
          </v-card-title>
          
          <v-data-table :headers="headers" :items="jogadores" :search="search">
            <template v-slot:body="{ items }">
              <tbody>
                <tr v-for="item in items" :key="item.idJogador" @click="direcionarParaPaginaDoJogador(item)">
                  <td>{{ item.equipe.tag }}</td>
                  <td>{{ item.apelido }}</td>
                  <td>{{ item.nomeCompleto }}</td>
                  <td>{{ item.idade }}</td>
                  <td>{{ item.paisDeOrigem.pais }}</td>
                </tr>
              </tbody>
            </template>
          </v-data-table>
        </v-card>
      </template>


    </v-card>

    

  </v-layout>
</template>
<script>
import api from '../services/api'

let vm
export default {

  data() {

    return {
      search: '',
      headers: [
        {
          text: 'Equipe',
          align: 'center',
          sortable: true,
          value: 'equipe.tag',
        },
        {
          text: 'Apelido',
          align: 'center',
          sortable: true,
          value: 'apelido',
        },
        {
          text: 'Nome',
          align: 'center',
          sortable: true,
          value: 'nomeCompleto',
        },
        {
          text: 'Idade',
          align: 'center',
          sortable: true,
          value: 'idade',
        },
        {
          text: 'País',
          align: 'center',
          sortable: true,
          value: 'paisDeOrigem.pais',
        }
      ],
      jogadores: []
    }

  },
  created() {
    vm = this
    vm.buscarJogadores()
  },
  methods:{

    async buscarJogadores(){
      try {
        let resposta = await api.jogador.buscar()
        resposta.data.forEach(jogador => {
          jogador.nomeCompleto = jogador.nome + ' ' + jogador.sobrenome
          jogador.idade = this.$moment().diff(jogador.dataNascimento, 'years');
        })
        vm.jogadores = resposta.data
      } catch(err) {
        this.$swal({type: 'error', title: 'Erro inesperado!', text: 'Jogadores não encontrados!'})
      }
    },

    async direcionarParaPaginaDoJogador(jogador) {
      let resultado = await this.$swal({
        type: 'info', 
        text: `Deseja ver o perfil do ${jogador.apelido}?`,
        showCloseButton: true,
        showCancelButton: true,
      })

      if(resultado.value) {
        vm.$router.push({ path: `/jogador/${jogador.idJogador}/${jogador.apelido}`, params: {id: jogador.idJogador, apelido: jogador.apelido} })
      }
    }

  }

}
</script>

<style scoped>
.tituloCard {
  justify-content: center;
  text-shadow: 0px 0px 5px black;
}
</style>

<!-- <v-simple-table fixed-header height="400px">
  <template v-slot:default>
    <thead>
      <tr>
        <th class="text-center">Apelido</th>
        <th class="text-center">Name</th>
        <th class="text-center">Idade</th>
        <th class="text-center">Pais</th>
        <th class="text-center">Equipe</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="jogador in jogadores" :key="jogador.name">
        <td>{{ jogador.apelido }}</td>
        <td>{{ jogador.nome + ' ' + jogador.sobrenome }}</td>
        <td>{{ calcularIdade(jogador.dataNascimento) }}</td>
        <td>{{ jogador.paisDeOrigem.pais }}</td>
        <td>{{ jogador.equipe.tag }}</td>
      </tr>
    </tbody>
  </template>
</v-simple-table> -->