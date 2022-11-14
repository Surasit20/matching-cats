class Cat {
  String id;
  String name;
  String owner;
  String breed;
  String color;
  String sex;
  String age;
  String vaccine;
  String matching;
  String isMatching;
  String congenitalDisease;
  String natureOfParenting;
  final request;

  Cat(
      {required this.id,
      required this.name,
      required this.owner,
      required this.breed,
      required this.color,
      required this.sex,
      required this.age,
      required this.vaccine,
      required this.matching,
      required this.isMatching,
      required this.congenitalDisease,
      required this.natureOfParenting,
      required this.request});

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json[""],
        name: json[""],
        owner: json[""],
        breed: json[""],
        color: json[""],
        sex: json[""],
        age: json[""],
        vaccine: json[""],
        matching: json[""],
        isMatching: json[""],
        congenitalDisease: json[""],
        natureOfParenting: json[""],
        request: json[""],
      );
}
