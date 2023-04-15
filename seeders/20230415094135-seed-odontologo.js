"use strict";
const { Op } = require("sequelize");

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert(
      "Odontologo",
      [
        {
          id_usuario:1,
          matriculaOdontologo: 1234564568,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          id_usuario:2,
          matriculaOdontologo: 1234564568,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          id_usuario:3,
          matriculaOdontologo: 1234564568,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      ],
      {}
    );
  },

  async down(queryInterface, Sequelize) {},
};
