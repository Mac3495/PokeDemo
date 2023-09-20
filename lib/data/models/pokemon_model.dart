class PokemonModel {
  int id;
  String name;
  String url;
  PokemonModel({
    required this.id,
    required this.name,
    required this.url,
  });

  PokemonModel.fromMap(Map<String, dynamic> data)
    : id = data['id'], 
      name = data['name'],
      url = data['img'];
}