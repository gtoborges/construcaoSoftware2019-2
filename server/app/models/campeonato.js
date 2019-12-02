module.exports = (sequelize, DataTypes) => {
  return sequelize.define('campeonato', {
    idCampeonato: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    nome: {
      type: DataTypes.CHAR(50),
      allowNull: false,
    },
    dataInicial: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    dataFinal: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    qntdTimesParticipantes: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
    },
    premiacaoTotal: {
      type: DataTypes.DECIMAL,
      allowNull: true,
    },
    idPais: {
      field: 'paisFK',
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'paises',
        key: 'idPais'
      }
    },
    local: {
      type: DataTypes.CHAR(50),
      allowNull: true
    },
    descricao: {
      type: DataTypes.CHAR(100),
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
    tableName: 'campeonato',
    timestamps: true
  })
}