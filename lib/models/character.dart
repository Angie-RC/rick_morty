class Character {
  final int id;
  final String name;
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.image,
  });

  Character.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  Character.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        id = map['id'],
        image = map['image'];
}