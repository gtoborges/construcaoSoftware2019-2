module.exports = (sequelize, DataTypes) => {
  return sequelize.define('historicoJogador', {
    idHistoricoJogador: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    idJogador: {
      field: 'idJogadorFK',
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'jogador',
        key: 'idJogador'
      }
    },
    idEquipe: {
      field: 'idEquipeFK',
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'equipe',
        key: 'idEquipe'
      }
    },
    dataEntrada: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    dataSaida: {
      type: DataTypes.DATEONLY,
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
    tableName: 'historicoJogador',
    timestamps: true
  })
}