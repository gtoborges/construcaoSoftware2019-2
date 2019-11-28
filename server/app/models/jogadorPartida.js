module.exports = (sequelize, DataTypes) => {
  return sequelize.define('jogadorPartida', {
    idJogadorPartida: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      allowNull: false,
      primaryKey: true,
    },
    idPartida: {
      field: idPartidaFK,
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'partidas',
        key: 'idPartida'
      }
    },
    idJogador: {
      field: idJogadorFK,
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'jogador',
        key: 'idJogador'
      }
    },
    qntdVitimas: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    qntdMortes: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    qntdAssistencias: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    procentagemHeadshot: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    mediaDanoPorRodada: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    idEquipe: {
      field: equipeFK,
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'equipe',
        key: 'idEquipe'
      }
    },
    partidaResultado: { // TRUE = VITÓRIA, FALSE = DERROTA
      type: DataTypes.BOOLEAN,
      allowNull: true
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
    tableName: 'jogadorPartida',
    timestamps: true
  })
}