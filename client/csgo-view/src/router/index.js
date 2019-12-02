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
    path: '/jogador/:id/:apelido',
    name: 'jogador/:id/:apelido',
    props: true,
    component: () => import(/* webpackChunkName: "perfilDoJogador" */ '../views/perfilDoJogador.vue')
  },
  {
    path: '/equipes',
    name: 'equipes',
    component: () => import(/* webpackChunkName: "equipes" */ '../views/equipes.vue')
  },
  {
    path: '/equipe/:id/:tag',
    name: 'equipe/:id/:tag',
    props: true,
    component: () => import(/* webpackChunkName: "perfilDoJogador" */ '../views/perfilDaEquipe.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
