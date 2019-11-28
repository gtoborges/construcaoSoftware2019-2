module.exports = (sequelize, DataTypes) => {
  return sequelize.define('partidas', {
    idPartida: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    data: {
      type: DataTypes.DATE,
      allouNull: false
    },
    categoria: {
      type: DataTypes.ENUM('LAN', 'ONLINE'),
      allowNull: false
    },
    idCampeonato: {
      field: idCampeonatoFK,
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'campeonato',
        key: 'idCampeonato'
      }
    },
    idMapa: {
      field: idMapaFK,
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'mapas',
        key: 'idMapa'
      }
    },
    idEquipeA: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'equipe',
        key: 'idEquipe'
      }
    },
    idEquipeB: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'equipe',
        key: 'idEquipe'
      }
    },
    melhorDe: {
      type: DataTypes.ENUM('1', '2', '3', '5'),
      allowNull: false
    },
    numeroPartida: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    prorrogacao: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    },
    partidaEncerrada: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    },
    pontuacaoEquipeA: {
      type: DataTypes.INTEGER(11),
      allowNull: true
    },
    pontuacaoEquipeB: {
      type: DataTypes.INTEGER(11),
      allowNull: true
    },
    idEquipeVitoria: {
      field: idEquipeVitoriaFK,
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'equipe',
        key: 'idEquipe'
      }
    },
    idEquipeDerrota: {
      field: idEquipeDerrotaFK,
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'equipe',
        key: 'idEquipe'
      }
    },
    idPrimeiraPartida: {
      field: idPrimeiraPartidaFK,
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'partidas',
        key: 'idPartida'
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
    tableName: 'partidas',
    timestamps: true
  })
}