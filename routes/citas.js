const express = require("express");
const citaController = require('../controllers/citaController')
const router = express.Router();
const verifyToken = require("../middleware/verifyToken");

/* GET users listing. */

//crear citas
router.post("/createcita", verifyToken, citaController.createCita);
//Eliminar citas
router.delete('/deletecita/:id', verifyToken, citaController.deleteCita);
// modificar citas
router.put('/updatecita/:id', verifyToken, citaController.updateCita);
//ver citas como cliente
router.get('/cita', verifyToken, citaController.getCitas);
//ver citas como odontologo
router.get('/cita/odontologo', verifyToken, citaController.getCitasOdontologo);

module.exports = router;