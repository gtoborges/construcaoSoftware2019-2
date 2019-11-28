module.exports = (sequelize, DataTypes) => {
  return sequelize.define('campeonatoXequipe', {
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
    idEquipeCampeonato: {
      field: idEquipeCampeonatoFK,
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
        references: {
          model: 'equipesCampeonato',
          key: 'idEquipeCampeonato'
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
    tableName: 'campeonatoXequipe',
    timestamps: true
  })
}