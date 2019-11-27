module.exports = (sequelize, DataTypes) => {
  return sequelize.define('teste', {
    idTeste: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    descricaoTeste: {
      type: DataTypes.CHAR(100),
      allowNull: false,
    },
    dataTeste: {
      type: DataTypes.DATE,
      allowNull: false
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
    tableName: 'teste',
    timestamps: true
  })
}