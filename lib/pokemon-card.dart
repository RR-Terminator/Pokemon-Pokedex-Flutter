import 'package:flutter/material.dart';
import 'pokemon-page.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.imageUrl,
    required this.pokemonName,
    required this.pokemonDesc

  });

  final String imageUrl;
  final String pokemonName;
  final String pokemonDesc;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap:(){
       Navigator.push(context, MaterialPageRoute(builder: (context) =>  PokemonPage(imageUrl: imageUrl, pokemonName:  pokemonName, pokemonDesc: pokemonDesc,)));
      },

      child: Center(
        child: Material(
          elevation: 20,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height - 450,
            child: Column(
              children: [
                Center(
                  child: Image.network(
                      imageUrl,
                ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: Text(
                  pokemonName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    background: Paint()
                      ..color = Colors.grey.withOpacity(0.5)
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 35
                      ..strokeJoin = StrokeJoin.round,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
