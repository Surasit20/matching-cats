const User = require('../models/user.model.js');
const bcrypt = require('bcryptjs');

exports.register = async (req, res, next) => {
  console.log('Startttt');
  console.log(req.body);

  const newUser = new User({
    name: req.body.name,
    email: req.body.email,
    password: req.body.password,
  });

  const user = await newUser.save();

  res.send({
    _id: user._id,
    name: user.name,
    email: user.email,
    isAdmin: user.isAdmin,
  });
};

exports.login = async (req, res, next) => {
  res.status(401).send({ message: 'Invlid email or password' });
};

exports.test = async (req, res, next) => {
  res.status(202).send({ message: 'Invlid email or password' });
};
