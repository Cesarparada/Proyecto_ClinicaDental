'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Usuario extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Usuario.init({
    nombre: DataTypes.STRING,
    apellidos: DataTypes.STRING,
    fecha_nacimiento: DataTypes.DATE,
    email: DataTypes.STRING,
    telefono: DataTypes.INTEGER,
    password: DataTypes.STRING,
    id_role: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Usuario',
  });
  return Usuario;
};