import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify';
import VueSweetalert2 from 'vue-sweetalert2';


const options = {
  confirmButtonColor: '#41b882',
  cancelButtonColor: '#ff7674',
}
Vue.use(VueSweetalert2, options)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
