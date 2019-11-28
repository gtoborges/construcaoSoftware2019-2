module.exports = (sequelize, DataTypes) => {
  return sequelize.define('distribuicaoXcampeonato', {
    idCampeonato: {
      field: idCampeonatoFK,
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
        references: {
          model: 'campeonato',
          key: 'idCampeonato'
      }
    },
    idDistribuicao: {
      field: idDistribuicaoFK,
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
        references: {
          model: 'distribuicaoPremiacaoCampeonato',
          key: 'idDistribuicao'
      }
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
    tableName: 'distribuicaoXcampeonato',
    timestamps: true
  })
}