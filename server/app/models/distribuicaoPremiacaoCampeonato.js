module.exports = (sequelize, DataTypes) => {
  return sequelize.define('distribuicaoPremiacaoCampeonato', {
    idDistribuicao: {
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
    colocacao: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    premiacao: {
      type: DataTypes.DECIMAL,
      allowNull: false,
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
    tableName: 'distribuicaoPremiacaoCampeonato',
    timestamps: true
  })
}