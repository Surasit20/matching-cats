const User = require('../models/user.model.js');
const bcrypt = require('bcryptjs');

exports.register = async (req, res, next) => {
  const newUser = new User({
    userName: req.body.userName,
    email: req.body.email,
    password: bcrypt.hashSync(req.body.password),
  });

  const user = await newUser.save();

  res.send({
    _id: user._id,
    userName: user.Username,
    email: user.email,
    isAdmin: user.isAdmin,
  });
};

exports.login = async (req, res, next) => {
  const user = await User.findOne({ email: req.body.email });
  if (user) {
    if (bcrypt.compareSync(req.body.password, user.password)) {
      res.send({
        _id: user._id,
        name: user.name,
        email: user.email,
        isAdmin: user.isAdmin,
      });
    }
    return;
  }
  res.status(401).send({ message: 'Invlid email or password' });
};

exports.test = async (req, res, next) => {
  res.status(200).send({ message: 'Invlid email or password' });
};
