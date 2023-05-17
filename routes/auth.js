const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");
const isAdmin = require("../middleware/isAdmin");
const verifyToken = require("../middleware/verifyToken");

/* GET users listing. */

//registar usuario
router.post("/register", authController.register);

//registrar odontologo
router.post(
  "/register/odontologo",
  verifyToken,
  isAdmin,
  authController.registerOdontologo
);
//login de usuario para obtener token
router.post("/login", authController.login);

module.exports = router;
