import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)

const routes = [
  {
    path: '/home',
    name: 'home',
    component: () => import(/* webpackChuckName: "home" */ '../views/home.vue')
  },
  {
    path: '/campeonatos',
    name: 'campeonatos',
    component: () => import(/* webpackChunkName: "campeonatos" */ '../views/campeonatos.vue')
  },
  {
    path: '/campeonatos/:id',
    name: 'campeonatos/:id',
    component: () => import(/* webpackChunkName: "detalhesCampeonatos" */ '../views/detalhesCampeonato.vue')
  },
  {
    path: '/partidas',
    name: 'partidas',
    component: () => import(/* webpackChunkName: "partidas" */ '../views/partidas.vue')
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
