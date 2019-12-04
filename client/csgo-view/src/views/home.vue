<template>

  <v-container>
    <v-container flex-direction: row>
      <template>
        <v-card
          dark
          class="mx-auto"
          max-width="400px"
          max-height="250px"
        >
          <v-img
            class="white--text align-end"
            height="200px"
            src="../assets/csgo-background.png"
          >
          </v-img>

          <v-card-actions>
            <router-link :to="{ name: 'campeonatos' }">
              <v-btn color="white" text>Ver campeonatos</v-btn>
            </router-link>
          </v-card-actions>
        </v-card>
      </template>

      <template>
        <v-card
          dark
          class="mx-auto"
          max-width="400px"
          max-height="250px"
        >
          <v-img
            class="white--text align-end"
            height="200px"
            src="../assets/background_aztec.jpg"
          >
          </v-img>

          <v-card-actions>
            <router-link :to="{ name: 'partidas' }">
              <v-btn color="white" text>Ver partidas</v-btn>
            </router-link>
          </v-card-actions>
        </v-card>
      </template>
    </v-container>

    <v-container flex-direction: row>
      <template>
        <v-card
          dark
          class="mx-auto"
          max-width="400px"
          max-height="250px"
        >
          <v-img
            class="white--text align-end"
            height="200px"
            src="../assets/background_cts.jpg"
          >
          </v-img>

          <v-card-actions>
            <router-link :to="{ name: 'equipes' }">
              <v-btn color="white" text>Ver equipes</v-btn>
            </router-link>
          </v-card-actions>
        </v-card>
      </template>

      <template>
        <v-card
          dark
          class="mx-auto"
          max-width="400px"
          max-height="250px"
        >
          <v-img
            class="white--text align-end"
            height="200px"
            src="../assets/dust2-background.jpg"
          >
          </v-img>

          <v-card-actions>
            <router-link :to="{ name: 'jogadores' }">
              <v-btn color="white" text>Ver jogadores</v-btn>
            </router-link>
          </v-card-actions>
        </v-card>
      </template>
    </v-container>
  </v-container>

</template>

<script>
export default {


}
</script>
