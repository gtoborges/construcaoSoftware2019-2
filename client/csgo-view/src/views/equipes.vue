<template>
  <v-layout text-center wrap>

    <v-card class="mx-auto" max-width="800">
      
      <v-img class="white--text align-end" height="150px" src="../assets/background_cts_crop.jpg">
        <v-card-title class="tituloCard">Equipes</v-card-title>
      </v-img>

      <template>
        <v-card>
          <v-card-title>
            <v-text-field v-model="search" label="Pesquisar" single-line hide-details></v-text-field>
          </v-card-title>
          
          <v-data-table :headers="headers" :items="equipes" :search="search">
            <template v-slot:body="{ items }">
              <tbody>
                <tr v-for="item in items" :key="item.idEquipe" @click="direcionarParaPaginaDaEquipe(item)">
                  <td>{{ item.tag }}</td>
                  <td>{{ item.nome }}</td>
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
          text: 'Tag',
          align: 'center',
          sortable: true,
          value: 'equipe.tag',
        },
        {
          text: 'Nome',
          align: 'center',
          sortable: true,
          value: 'equipe.nome',
        },
        {
          text: 'País',
          align: 'center',
          sortable: true,
          value: 'equipe.paisDeOrigem.pais',
        },
      ],
      equipes: []
    }

  },
  created() {
    vm = this
    vm.buscarEquipes()
  },
  methods:{

    async buscarEquipes(){
      try {
        let resposta = await api.equipe.buscar()
        vm.equipes = resposta.data
      } catch(err) {
        this.$swal({type: 'error', title: 'Erro inesperado!', text: 'Equipes não encontradas!'})
      }
    },

    async direcionarParaPaginaDaEquipe(equipe) {
      let resultado = await this.$swal({
        type: 'info', 
        text: `Deseja ver o perfil da equipe ${equipe.nome}?`,
        showCloseButton: true,
        showCancelButton: true,
      })

      if(resultado.value) {
        vm.$router.push({ path: `/equipe/${equipe.idEquipe}/${equipe.tag}`, params: {id: equipe.idEquipe, tag: equipe.tag} })
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