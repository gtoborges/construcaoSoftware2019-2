<template>
  <v-app>
    <TheNavigation />

    <v-content>
      <router-view :key="$route.path" />
    </v-content>
  </v-app>
</template>

<script>
import TheNavigation from './components/TheNavigation';
// import HelloWorld from './components/HelloWorld';

export default {
  name: 'App',

  components: {
    // HelloWorld,
    TheNavigation
  },

  data: () => ({
    //
  }),
};
</script>
