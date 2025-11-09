import 'package:flutter/material.dart';
import '../models/pokemon.dart';

//detalle de un Pokemon
//informacion específica del Pokemon seleccionado
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Recuperamos el Pokemon
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name.toUpperCase())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen del Pokemon
            Image.network(pokemon.imageUrl, height: 150),

            const SizedBox(height: 20),

            // Nombre del Pokemon en mayúsculas
            Text(
              pokemon.name.toUpperCase(),
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              '¡Un Pokémon muy poderoso!',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
