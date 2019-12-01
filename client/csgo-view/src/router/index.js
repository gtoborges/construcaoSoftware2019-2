import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/home',
    name: 'home',
    component: Home
  },
  {
    path: '/about',
    name: 'about',
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/jogadores',
    name: 'jogadores',
    component: () => import(/* webpackChunkName: "jogadores" */ '../views/jogadores.vue')
  },
  {
    path: '/teste2',
    name: 'teste2',
    component: () => import(/* webpackChunkName: "teste2" */ '../views/Teste2.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
