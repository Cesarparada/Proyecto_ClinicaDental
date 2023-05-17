const express = require("express");
const citaController = require("../controllers/citaController");
const router = express.Router();
const verifyToken = require("../middleware/verifyToken");
const isPatient = require("../middleware/isPatient");
const isDoctor = require("../middleware/isDoctor");
/* GET users listing. */

//crear citas
router.post("/createcita", verifyToken, isPatient, citaController.createCita);
//Eliminar citas
router.delete(
  "/deletecita/:id",
  verifyToken,
  isPatient,
  citaController.deleteCita
);

// modificar citas
router.put("/updatecita/:id", verifyToken, isPatient, citaController.updateCita);

//ver citas como cliente
router.get("/cita", verifyToken, isPatient, citaController.getCitas);

//ver citas como odontologo
router.get(
  "/cita/odontologo",
  verifyToken, isDoctor,
  citaController.getCitasOdontologo
);

module.exports = router;
