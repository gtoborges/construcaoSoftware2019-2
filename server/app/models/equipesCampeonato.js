module.exports = (sequelize, DataTypes) => {
  return sequelize.define('equipesCampeonato', {
    idEquipeCampeonato: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    idCampeonato: {
      field: 'idCampeonatoFK',
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'campeonato',
        key: 'idCampeonato'
      }
    },
    idEquipe: {
      field: 'equipeFK',
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'equipe',
        key: 'idEquipe'
      }
    },
    idJogador1: {
      field: 'idJogador1FK',
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'jogador',
        key: 'idJogador'
      }
    },
    idJogador2: {
      field: 'idJogador2FK',
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'jogador',
        key: 'idJogador'
      }
    },
    idJogador3: {
      field: 'idJogador3FK',
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'jogador',
        key: 'idJogador'
      }
    },
    idJogador4: {
      field: 'idJogador4FK',
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'jogador',
        key: 'idJogador'
      }
    },
    idJogador5: {
      field: 'idJogador5FK',
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'jogador',
        key: 'idJogador'
      }
    },
    colocacao: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
    },
    dataCriacao: {
      type: DataTypes.DATE,
      allowNull: false
    },
    dataAlteracao: {
      type: DataTypes.DATE,
      allowNull: false
    }
  }, {
    tableName: 'equipesCampeonato',
    timestamps: true
  })
}