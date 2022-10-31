mongoose = require('mongoose');

const userSchema = new mongoose.Schema(
  {
    userName: { type: String, required: true, unique: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    isAdmin: { type: String, required: true, default: false },
    cat: { type: Array, required: false },

    profile: {
      name: { type: String, required: false },
      nickName: { type: String, required: false },
      age: { type: String, required: false },
      address: { type: String, required: false },
      profileImg: { type: String, required: false },
      tel: { type: Number, required: false },
      require: false,
    },
  },
  {
    timestamps: true,
  }
);

const User = mongoose.model('User', userSchema);

module.exports = User;
