module.exports = (sequelize, DataTypes) => {
  return sequelize.define('historicoJogador', {
    idHistoricoJogador: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    idJogador: {
      field: idJogadorFK,
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'jogador',
        key: 'idJogador'
      }
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
    dataEntrada: {
      type: DataTypes.DATEONLY,
      allouNull: false
    },
    dataNascimento: {
      type: DataTypes.DATEONLY,
      allouNull: true
    },
    dataCriacao: {
      type: DataTypes.DATE,
      allouNull: false
    },
    dataAlteracao: {
      type: DataTypes.DATE,
      allouNull: false
    }
  }, {
    tableName: 'historicoJogador',
    timestamps: true
  })
}