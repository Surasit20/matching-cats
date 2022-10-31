const Cat = require('../models/cat.model.js');

exports.addCat = async (req, res, next) => {
  const newCat = new Cat({
    name: req.body.name,
    owner: req.body.owner,
    breed: req.body.breed,
    color: req.body.color,
    sex: req.body.sex,
    age: req.body.age,
    vaccine: req.body.vaccine,
    congenitalDisease: req.body.congenitalDisease,
    natureOfParenting: req.body.natureOfParenting,
  });

  const cat = await newCat.save();

  res.send({
    _id: cat._id,
    name: cat.name,
    owner: cat.owner,
    breed: cat.breed,
    color: cat.color,
    sex: cat.sex,
    age: cat.age,
    vaccine: cat.vaccine,
    congenitalDisease: cat.congenitalDisease,
    natureOfParenting: cat.natureOfParenting,
  });
};

exports.deleteCat = async (req, res, next) => {
  try {
    const deleteCat = await Cat.findByIdAndDelete(req.params.id);
    res.status(200).json(deleteCat);
  } catch (error) {
    res.status(404).json(error);
  }
};

exports.match = async (req, res, next) => {
  const { catOwnerId, catTargetId } = req.body;
  const isMatch = checkMatch(catOwnerId, catTargetId);
  if (!isMatch) {
    //fine id cat target
    Cat.findById(catTargetId)
      .then((doc) => {
        console.log(doc.matching);
        const newMatch = [...doc.matching, catOwnerId];
        console.log(newMatch);

        //update new match

        /*
      Cat.findByIdAndUpdate(
        catTargetId,
        { matching: newMatch },
        (err, docs) => {
          if (err) {
            console.log(err);
          } else {
            //console.log('Updated Match : ', docs);
            console.log('Updated Match : ');
          }
        }
      );
      */
      })
      .catch((err) => {
        console.log(err);
      });
  } else {
  }
};

const checkMatch = async (catOwnerId, catTargetId) => {
  let catTargetMatchArr;
  await Cat.findById(catTargetId)
    .then((doc) => {
      catTargetMatchArr = doc.matching;
    })
    .catch((err) => {
      console.log(err);
    });

  //check
  for (let i = 0; i < catTargetMatchArr.length; i++) {
    if (catTargetMatchArr[i] === catOwnerId) {
      return true;
    }
  }

  return false;
};

exports.getCats = async (req, res, next) => {
  //return cat is don't match
  const query = { isMatching: false };
  const cats = await Cat.find(query);
  res.send(cats);
};

exports.getCats = async (req, res, next) => {
  //return cat of people
  const query = { isMatching: false };
  const cats = await Cat.find(query);
  res.send(cats);
};

exports.getCat = async (req, res, next) => {
  //return cat of owner
  const idCat = req.params.id;
  const query = { _id: idCat };
  const cats = await Cat.find(query);
  res.send(cats);
};

exports.getCatOwner = async (req, res, next) => {
  //return cat of owner
  const idCat = req.params.id;
  const query = { owner: idCat };
  const cats = await Cat.find(query);
  res.send(cats);
};
