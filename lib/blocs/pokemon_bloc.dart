import 'package:desafio_pokemon/models/pokemon/all_pokemon.dart';
import 'package:desafio_pokemon/models/pokemon/pokemon.dart';
import 'package:desafio_pokemon/models/types/all_types.dart';
import 'package:desafio_pokemon/repository/pokemon_repository.dart';
import 'package:desafio_pokemon/repository/types_repository.dart';
import 'package:flutter/cupertino.dart';

import '../settings.dart';

class PokemonBloc extends ChangeNotifier {
  PokemonRepository _pokemonRepository = PokemonRepository();
  TypesRepository _typesRepository = TypesRepository();

  List<AllPokemonResult> pokemons = [];
  List<AllTypes> allTypes = [
    AllTypes('Todos', '${Settings.apiUrl}/pokemon?offset=0&limit=50')
  ];

  Pokemon pokemon;

  getAllPokemons() async {
    try {
      pokemons = [];

      var response = await _pokemonRepository.getAllPokemons();

      // _pokemonRepository.getAllPokemons().then((value) {
      //   value.results.forEach((element) {
      //     _pokemonRepository.getPokemon(element.url).then((value) {
      //       pokemons.add(value);
      //       pokemons.sort((a, b) => a.id.compareTo(b.id));
      //     });
      //   });
      // });

      if (response != null) pokemons = response.results;

      //
      //
      //
    } catch (e) {
      print('Error');
    }
  }

  getAllPokemonsByType(String type) async {
    try {
      pokemons = [];

      var response = await _pokemonRepository.getPokemonsByType(type);

      if (response != null) pokemons = response.results;

      // _pokemonRepository.getPokemonsByType(type).then((value) {
      //   value.pokemons.forEach((element) {
      //     _pokemonRepository.getPokemon(element.url).then((value) {
      //       pokemons.add(value);
      //       pokemons.sort((a, b) => a.id.compareTo(b.id));
      //     });
      //   });
      // });
    } catch (e) {}
  }

  getPokemon(String url) async {
    try {
      var response = await _pokemonRepository.getPokemon(url);

      if (response != null) pokemon = response;
    } catch (e) {}
  }

  getAllTypes() async {
    try {
      AllTypesResult response = await _typesRepository.getAllTypes();

      if (response != null) allTypes += response.allTypes;
    } catch (e) {}
  }
}
