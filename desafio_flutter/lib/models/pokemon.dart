// Clase Pokemon
class Pokemon {
  // Nombre del Pokemon
  final String name;
  
  // URL de la imagen
  final String imageUrl;

  // Constructor de la clase que requiere nombre e imagen
  Pokemon({required this.name, required this.imageUrl});

  // Factory constructor para crear un objeto Pokemon a partir de un JSON
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],

      // Asignamos la URL de la imagen del Pokemon
      imageUrl: json['sprites']['front_default'] ??
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png',
    );
  }
}
