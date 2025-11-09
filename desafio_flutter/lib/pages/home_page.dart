import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/pokemon_service.dart';

//Pagina principal que muestra la lista de Pokemon
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con el título de la app
      appBar: AppBar(title: const Text('PokéDex Flutter')),

      body: FutureBuilder<List<Pokemon>>(
        future: PokemonService.fetchPokemons(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());

          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));

          } else if (snapshot.hasData) {
            final pokemons = snapshot.data!;

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: pokemons.length,

              //tarjeta de Pokemon
              itemBuilder: (context, index) {
                final p = pokemons[index];

                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/detail', arguments: p),

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Imagen del Pokemon
                        Image.network(p.imageUrl, height: 80),
                        const SizedBox(height: 10),

                        // Nombre del Pokemon
                        Text(
                          p.name.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );

          //cuando no hay datos
          } else {
            return const Center(child: Text('Sin datos'));
          }
        },
      ),
    );
  }
}
