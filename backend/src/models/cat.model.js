mongoose = require('mongoose');
const catSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    owner: { type: String, required: true },
    breed: { type: String, required: true },
    color: { type: String, required: true },
    sex: { type: String, required: true },
    age: { type: Number, required: true },
    vaccine: { type: Array, required: false },
    matching: { type: Array, required: false },
    isMatching: { type: Boolean, required: false, default: false },
    congenitalDisease: { type: String, required: true },
    natureOfParenting: { type: String, required: true },
    location: { type: String, required: true },
  },
  {
    timestamps: true,
  }
);
const Cat = mongoose.model('Cat', catSchema);
module.exports = Cat;