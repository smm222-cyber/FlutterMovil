import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class PokemonService {
  static Future<List<Pokemon>> fetchPokemons() async {
    const url = 'https://pokeapi.co/api/v2/pokemon?limit=20';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List results = data['results'];

      //para cada Pokemon obtenemos su detalle
      List<Pokemon> pokemons = [];
      for (var item in results) {
        final detailResponse = await http.get(Uri.parse(item['url']));
        if (detailResponse.statusCode == 200) {
          final detailData = jsonDecode(detailResponse.body);
          pokemons.add(Pokemon.fromJson(detailData));
        }
      }
      return pokemons;
    } else {
      throw Exception('Error al obtener Pokémon');
    }
  }
}
