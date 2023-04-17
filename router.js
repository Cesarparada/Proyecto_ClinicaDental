const express = require("express");
const router = express.Router();
const indexRouter = require("./routes/index");
const usersRouter = require("./routes/registroUsuarios");
/* home page */
router.use("/", indexRouter);
router.use("/usuarios", usersRouter);

module.exports = router;
