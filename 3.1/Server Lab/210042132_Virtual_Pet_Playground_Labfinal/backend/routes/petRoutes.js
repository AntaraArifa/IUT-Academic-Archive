const express = require('express');
const petController = require('../controllers/petController');
const router = express.Router();

// 1. We create a new pet with post request
router.post('/', petController.createPet);

// 2. Then we view pet stats by using the get request
router.get('/:id', petController.viewPetStats);

// 3. We can feed pet using the put request
router.put('/:id/feed', petController.feedPet);

// 4. We can also play with pet also using put request
router.put('/:id/play', petController.playWithPet);

// 5. Finally we can release or it can be automatically released using the delete request
router.delete('/:id', petController.releasePet);

module.exports = router;
