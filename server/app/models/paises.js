module.exports = (sequelize, DataTypes) => {
  return sequelize.define('paises', {
    idPais: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    pais: {
      type: DataTypes.CHAR(50),
      allowNull: false,
    },
    nacionalidade: {
      type: DataTypes.CHAR(50),
      allowNull: false,
    },
    sigla: {
      type: DataTypes.CHAR(3),
      allowNull: true
    }
  }, {
    tableName: 'paises',
    timestamps: false
  })
}