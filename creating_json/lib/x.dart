class data {
  String? name;
  int? age;
  int? height;
  String? gender;
  String? hair_color;
  data({
    this.name,
    this.age,
    this.height,
    this.gender,
    this.hair_color,
  });
  factory data.fromMap(Map<dynamic, dynamic> parsedJson) {
    return data(
        name: parsedJson["name"],
        age: parsedJson["age"],
        height: parsedJson["height"],
        gender: parsedJson["gender"],
        hair_color: parsedJson["hair_color"]);
  }
}
