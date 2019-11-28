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
      allouNull: false
    },
    dataFinal: {
      type: DataTypes.DATEONLY,
      allouNull: false
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
      field: paisDeOrigemFK,
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'paises',
        key: 'idPais'
      }
    },
    local: {
      type: DataTypes.CHAR(50),
      allouNull: true
    },
    descricao: {
      type: DataTypes.CHAR(100),
      allouNull: true
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
    tableName: 'campeonato',
    timestamps: true
  })
}