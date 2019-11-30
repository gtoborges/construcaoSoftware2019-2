module.exports = (sequelize, DataTypes) => {
  return sequelize.define('mapas', {
    idMapa: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    nome: {
      type: DataTypes.CHAR(40),
      allowNull: false,
    }
  }, {
    tableName: 'mapas',
    timestamps: false
  })
}