<template>
  <v-app-bar app color="blue-grey darken-3" dark>

    <v-img src="../assets/csgo-logo.png" max-height="100" max-width="130" @click="$router.push({ name: 'home'})"></v-img>

    <v-toolbar-items>
      <v-btn text :to="{ name: 'home' }">Home</v-btn>
      <v-btn text :to="{ name: 'teste1' }">Teste 1</v-btn>
      <v-btn text :to="{ name: 'teste2' }">Teste 2</v-btn>
    </v-toolbar-items>

  </v-app-bar>
</template>

<script>
export default {
  name: 'TheNavigation'
}
</script>