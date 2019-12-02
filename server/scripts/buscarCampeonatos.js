const db = require('../app/models')
const sequelize = db.sequelize
const Sequelize = require('sequelize')
const Op = Sequelize.Op

async function testeJogador() {

  let opcoes = {
    include: [
      {
        model: db.paises,
        as: 'paisDeOrigem'
      },
      {
        model: db.equipe,
        as: 'equipe'
      }
    ],
    raw: true,
  }

  let jogadores = await db.jogador.findAll(opcoes)
  for(jogador of jogadores){
    console.log('\n\n')
    console.log(jogador)
  }

}
// testeJogador()

async function buscarCampeonatos() {

  let opcoes = {
    include: [
      {
        model: db.paises,
        as: 'paisDeOrigem',
        attributes: ['pais']
      },
      {
        model: db.distribuicaoPremiacaoCampeonato,
        as: 'distribuicao',
        attributes: ['idCampeonato', 'colocacao', 'premiacao'],
        order: [['colocacao', 'ASC']]
      },
      {
        model: db.equipesCampeonato,
        as: 'equipesParticipantes',
        attributes: ['idEquipeCampeonato', 'colocacao',],
        include: [
          {
            model: db.equipe,
            as: 'equipe'
          },
          {
            model: db.jogador,
            as: 'jogador1'
          },
          {
            model: db.jogador,
            as: 'jogador2'
          },
          {
            model: db.jogador,
            as: 'jogador3'
          },
          {
            model: db.jogador,
            as: 'jogador4'
          },
          {
            model: db.jogador,
            as: 'jogador5'
          }
        ],
      }
    ],
  }

  let campeonatos = await db.campeonato.findAll(opcoes)
  for(c of campeonatos){
    console.log('\n\n', c.nome, ' - Equipes e Jogadores\n')
    c.distribuicao.forEach(d => {
      console.log(d.colocacao, ' --- ', d.premiacao)
    })
    c.equipesParticipantes.forEach( (e, i) => {
      console.log(e.equipe.nome)
      console.log('\n')
      console.log(e.jogador1.apelido)
      console.log(e.jogador2.apelido)
      console.log(e.jogador3.apelido)
      console.log(e.jogador4.apelido)
      console.log(e.jogador5.apelido)
      console.log('\n')
    })
  }

}
buscarCampeonatos()
