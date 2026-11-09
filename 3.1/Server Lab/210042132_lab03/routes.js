const express = require('express');
const router = express.Router();
const { getLogin, postLogin, getRegister, postRegister } = require('./controller');

router.get('/login', getLogin);
router.post('/login', postLogin);
router.get('/register', getRegister);
router.post('/register', postRegister);

module.exports = router;
