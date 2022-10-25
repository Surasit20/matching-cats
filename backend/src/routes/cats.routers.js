const express = require('express');
const catController = require('../controllers/cats.controller.js');
const router = express.Router();

//Add Cat
//router.post('/add/cat', catController.register);

//match
router.post('/match', catController.match);
router.get('/', catController.getCats);
router.get('/:id', catController.getCat);
module.exports = router;
