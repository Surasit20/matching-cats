const express = require('express');
const catController = require('../controllers/cats.controller.js');
const router = express.Router();

//Add Cat
//router.post('/add/cat', catController.register);

router.post('/match', catController.match);
router.post('/add', catController.addCat);
router.get('/', catController.getCats);
router.get('/:id', catController.getCat);
router.get('/owner/:id', catController.getCatOwner);
module.exports = router;
