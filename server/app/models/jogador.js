module.exports = (sequelize, DataTypes) => {
  return sequelize.define('jogador', {
    idEquipe: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    nome: {
      type: DataTypes.CHAR(30),
      allowNull: false,
    },
    sobrenome: {
      type: DataTypes.CHAR(100),
      allowNull: true,
    },
    apelido: {
      type: DataTypes.CHAR(30),
      allowNull: false,
    },
    dataNascimento: {
      type: DataTypes.DATEONLY,
      allowNull: false
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
    idEquipe: {
      field: equipeFK,
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'equipe',
        key: 'idEquipe'
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
    tableName: 'jogador',
    timestamps: true
  })
}