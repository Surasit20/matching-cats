mongoose = require('mongoose');

const userSchema = new mongoose.Schema(
  {
    userName: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    isAdmin: { type: String, required: true, default: false },
    cat: { type: Array, required: false },
    profile: {
      name: { type: String, required: true },
      nickName: { type: String, required: true },
      age: { type: String, required: true },
      address: { type: String, required: true },
      profileImg: { type: String, required: true },
      tel: { type: Number, required: true },
    },
  },
  {
    timestamps: true,
  }
);

const User = mongoose.model('User', userSchema);

module.exports = User;
