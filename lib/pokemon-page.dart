import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage(
      {super.key,
      required this.imageUrl,
      required this.pokemonName,
      required this.pokemonDesc});

  final String imageUrl;
  final String pokemonName;
  final String pokemonDesc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(pokemonName)),
      ),
      body: Column(
        children: [
          AspectRatio(aspectRatio: 1/1,
          child: Image.network(imageUrl,

          fit : BoxFit.cover),),
          Text(
              pokemonName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 54,
          ),),
          const SizedBox(
            height:  20,
          ),
          
          Padding(padding: const EdgeInsets.all(20.0),
          child: Text(
            pokemonDesc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),

          ),)

        ],
      )
    );
  }
}
