const mongoose = require('mongoose');

const petSchema = new mongoose.Schema({
  name: { type: String, required: true },
  age: { type: Number, required: true },
  species: { type: String, required: true },
  hunger: { type: Number, default: 30 },
  energy: { type: Number, default: 50 },
  health: { type: Number, default: 100 },
  images: [{ type: String }],
});

module.exports = mongoose.model('Pet', petSchema);
