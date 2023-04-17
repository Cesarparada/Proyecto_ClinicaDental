const {} = require("../models");
const { Op } = require("sequelize");
const { getPagesFromCountLimit, normalizePage } = require("../_util/util");
const {
  sendSuccsessResponse,
  sendErrorResponse,
} = require("../_util/sendResponse");

const usuarioController = {};
const LIMIT = 3;

usuarioController.getAll = async (req, res) => {
  let { page } = req.query;
  try {
    const count = await Usuario.count();
    const pages = getPagesFromCountLimit(count, LIMIT);
    page = normalizePage(page, pages);

    const usuarios = await Usuario.findAll({
      limit: LIMIT,
      offset: (page - 1) * LIMIT,
      attributes: {
        exclude: [
         "nombre",
         "apellidos",
         "email",
         "fecha_de_nacimiento",
         "telefono",
        ],
      },

      include: [
     
      ],
    });

    sendSuccsessResponse(res, 200, {
      info: {
        total_results: count,
        limit_results: usuarios.length,
        page: page,
        total_pages: pages,
      },
      results: usuarios,
    });
  } catch (error) {
    sendErrorResponse(res, 500, "Error retreinving users", error);
    res.json(error);
  }
};

usuarioController.getById = async (req, res) => {
  const { id } = req.params;

  try {
    const usuario = await Usuario.findByPk(id, {
      attributes: {
        exclude: [
      
        ],
      },

      include: [
   
      ],
    });

    if (usuario) sendSuccsessResponse(res, 200, usuario);
    else sendErrorResponse(res, 404, `User '${id}' not found`);
  } catch (error) {
    sendErrorResponse(res, 500, "Error retreinving users", error);
  }
};

usuarioController.getByName = async (req, res) => {
  const { name } = req.params;

  try {
    const usuarios = await Usuario.findAll({
      where: {
        nombre: {
          [Op.like]: `%${name}%`,
        },
      },
      attributes: {
        exclude: ["createdAt", "updatedAt"],
      },
    });

    if (usuarios.length > 0) sendSuccsessResponse(res, 200, usuarios);
    else sendErrorResponse(res, 404, `User '${name}' not found`);
  } catch (error) {
    sendErrorResponse(res, 500, `Error retreiving users`, error);
  }
};

usuarioController.create = async (req, res) => {
  // const {
  //    nombre,
  //    apellidos,
  //    edad,
  //    fecha_nacimiento,
  //    activo,
  //    id_nacionalidad,
  //    id_direccion,
  // } = req.body;

  // verificar que id_nacionalidad es valido
  // verificar que id_direccion es valido

  const newUsuario = {
    ...req.body,
    createdAt: new Date(),
    updatedAt: new Date(),
  };

  try {
    await Usuario.create(newUsuario);
    sendSuccsessResponse(res, 201, "User created succsessfully");
  } catch (error) {
    let code = error.name == "SequelizeValidationError" ? 400 : 500;
    sendErrorResponse(res, code, "Error creating user", error);
  }
};

usuarioController.deleteOne = async (req, res) => {
  const { id } = req.params;

  try {
    const num = await Usuario.destroy({
      where: { id: id },
    });

    if (num == 1) sendSuccsessResponse(res, 202, "User deleted succsessfully");
    else
      sendErrorResponse(
        res,
        400,
        `Can not delete user '${id}'. User not found`
      );
  } catch (error) {
    sendErrorResponse(res, 500, "Error deleting user", error);
  }
};

usuarioController.update = async (req, res) => {
  const { id } = req.params;

  const usuario = {
    ...req.body,
    updatedAt: new Date(),
  };

  try {
    const num = await usuario.update(usuario, {
      where: { id: id },
    });

    if (num == 1) sendSuccsessResponse(res, 201, "User updated succsessfully");
    else
      sendErrorResponse(
        res,
        400,
        `Can not update user '${id}'. User not found`
      );
  } catch (error) {
    let code = error.name == "SequelizeValidationError" ? 400 : 500;
    sendErrorResponse(res, code, "Error updating student", error);
  }
};

module.exports = usuarioController;
