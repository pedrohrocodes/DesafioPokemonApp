import 'package:desafio_pokemon/models/pokemon/all_pokemon.dart';
import 'package:desafio_pokemon/models/pokemon/pokemon.dart';
import 'package:desafio_pokemon/settings.dart';
import 'package:dio/dio.dart';

class PokemonRepository {
  Future<AllPokemon> getAllPokemons() async {
    var dio = Dio();

    var url = '${Settings.apiUrl}/pokemon?offset=0&limit=50';

    var response = await dio.get(url,
        options: Options(
            headers: {Headers.contentTypeHeader: Headers.jsonContentType}));

    return AllPokemon.fromJson(response.data);
  }

  Future<Pokemon> getPokemon(String url) async {
    var dio = Dio();

    var response = await dio.get(url,
        options: Options(
            headers: {Headers.contentTypeHeader: Headers.jsonContentType}));

    return Pokemon.fromJson(response.data);
  }

  Future<AllPokemon> getPokemonsByType(String type) async {
    var dio = Dio();

    var url = '${Settings.apiUrl}/type/$type/';

    var response = await dio.get(url,
        options: Options(
            headers: {Headers.contentTypeHeader: Headers.jsonContentType}));

    return AllPokemon.fromJson(response.data);
  }
}
