module.exports = (sequelize, DataTypes) => {
  return sequelize.define('equipe', {
    idEquipe: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    nome: {
      type: DataTypes.CHAR(50),
      allowNull: false,
    },
    tag: {
      type: DataTypes.CHAR(10),
      allowNull: false,
    },
    idPais: {
      field: paisDeOrigemFK,
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'paises',
        key: 'idPais'
      }
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
    tableName: 'equipe',
    timestamps: true
  })
}