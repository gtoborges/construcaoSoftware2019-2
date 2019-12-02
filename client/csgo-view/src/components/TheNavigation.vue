<template>
  <v-app-bar app color="blue-grey darken-3" dark>

    <v-img src="../assets/csgo-logo.png" max-height="100" max-width="130" @click="$router.push({ name: 'home'})"></v-img>

    <v-toolbar-items>
      <v-btn text :to="{ name: 'home' }">Inicio</v-btn>
      <v-btn text :to="{ name: 'home' }">Campeonatos</v-btn>
      <v-btn text :to="{ name: 'home' }">Partidas</v-btn>
      <v-btn text :to="{ name: 'equipes' }">Equipes</v-btn>
      <v-btn text :to="{ name: 'jogadores' }">Jogadores</v-btn>
    </v-toolbar-items>

  </v-app-bar>
</template>

<script>
export default {
  name: 'TheNavigation'
}
</script>