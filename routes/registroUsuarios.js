const express = require("express");
const router = express.Router();
const usuarioController = require("../controllers/registerControllers");

// end-points

/* obtener todos los usuarios */
router.get("/", usuarioController.getAll);

/* obtener usuario por id */
router.get("/:id", usuarioController.getById);

/* obtener usuario por nombre */
router.get("/nombre/:name", usuarioController.getByName);

/* crear usuarios */
router.post("/", usuarioController.create);

/* borrar usuario por id */
router.delete("/:id", usuarioController.deleteOne);

/* modificar usuarios por id */
router.put("/:id", usuarioController.update);

module.exports = router;
