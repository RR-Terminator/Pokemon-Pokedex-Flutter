import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pokemon-card.dart';

void main(){
  runApp(MaterialApp(
    title: "Pokedex",
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ),);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List pokemons = [];

  Future<void> fetchData() async{
     final String response = await rootBundle.loadString("./lib/JSON/pokemon-data.json");
     final data = await jsonDecode(response);
     setState(() {
       pokemons = data["pokemons"];
     });



  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Pokedex")) ,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          runSpacing: 20,
          children: [
           ...pokemons.map((e) => PokemonCard(imageUrl: e["imageUrl"], pokemonName: e["name"], pokemonDesc:e["description"]),)
          ],
        ),
      ),

    );
  }
}
