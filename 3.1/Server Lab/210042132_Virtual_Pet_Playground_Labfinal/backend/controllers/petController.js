const Pet = require('../models/Pet');
const multer = require('multer');

// Let us set up multer storage for image uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, './uploads/');
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname); 
  }
});

const upload = multer({ storage: storage });

// 1. We create a new pet here
exports.createPet = [upload.array('images', 5), async (req, res) => {
  const { name, age, species } = req.body;
  try {
    const pet = new Pet({
      name,
      age,
      species,
      images: req.files ? req.files.map(file => file.path) : []
    });
    await pet.save();
    res.status(201).json(pet);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
}];

// 2. We can view the pet stats here
exports.viewPetStats = async (req, res) => {
  try {
    const pet = await Pet.findById(req.params.id);
    if (!pet) {
      return res.status(404).json({ error: 'Pet not found' });
    }

    // We can check pet conditions (sick or runaway)
    if (pet.energy <= 0 || pet.hunger > 50) {
      await pet.remove(); 
      return res.status(400).json({ error: 'Pet is no longer in the playground due to poor health or hunger.' });
    }

    res.status(200).json(pet);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// 3. We can feed the pets here
exports.feedPet = async (req, res) => {
  try {
    const pet = await Pet.findById(req.params.id);
    if (!pet) {
      return res.status(404).json({ error: 'Pet not found' });
    }

    pet.hunger = Math.max(0, pet.hunger - 25); 
    pet.energy = Math.min(100, pet.energy + 5);

    await pet.save();
    res.status(200).json(pet);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// 4. Now we can play with pet
exports.playWithPet = async (req, res) => {
  try {
    const pet = await Pet.findById(req.params.id);
    if (!pet) {
      return res.status(404).json({ error: 'Pet not found' });
    }

    pet.energy = Math.max(0, pet.energy - 30);  
    pet.hunger = Math.min(50, pet.hunger + 25);

    await pet.save();
    res.status(200).json(pet);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// 5. We can also release pet
exports.releasePet = async (req, res) => {
    try {
      const pet = await Pet.findByIdAndDelete(req.params.id); 
      if (!pet) {
        return res.status(404).json({ error: 'Pet not found' });
      }
  
      res.status(200).json({ message: 'Pet has been released.' });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };
  
