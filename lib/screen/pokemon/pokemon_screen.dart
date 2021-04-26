import 'package:desafio_pokemon/blocs/pokemon_bloc.dart';
import 'package:desafio_pokemon/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class PokemonScreen extends StatefulWidget {
  final String url;

  const PokemonScreen({Key key, this.url}) : super(key: key);

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  bool _isFirstLoad = true;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    final PokemonBloc pokemonBloc = Provider.of<PokemonBloc>(context);

    if (_isFirstLoad) firstLoad(pokemonBloc);

    return !_isLoading
        ? Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.share,
                    ),
                    onPressed: () {
                      String habilidades = '';

                      pokemonBloc.pokemon.abilities.forEach((element) {
                        habilidades += element.ability.name + ',';
                      });

                      if (pokemonBloc.pokemon.types.length > 1)
                        Share.share(
                            'Dados do Pokemon ${pokemonBloc.pokemon.name.toUpperCase()}:\nTipo: ${pokemonBloc.pokemon.types[0].type.name} e ${pokemonBloc.pokemon.types[1].type.name}\nAltura: ${pokemonBloc.pokemon.height}\nPeso: ${pokemonBloc.pokemon.weight}\nHabilidades: $habilidades');
                      else
                        Share.share(
                            'Dados do Pokemon ${pokemonBloc.pokemon.name.toUpperCase()}:\nTipo: ${pokemonBloc.pokemon.types[0].type.name}\nAltura: ${pokemonBloc.pokemon.height}\nPeso: ${pokemonBloc.pokemon.weight}\nHabilidades: $habilidades');
                    })
              ],
              elevation: 0,
              backgroundColor:
                  backgroundColorByType(pokemonBloc.pokemon.types[0].type.name),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                        color: backgroundColorByType(
                            pokemonBloc.pokemon.types[0].type.name),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100))),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#${pokemonBloc.pokemon.id}',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            Text('${pokemonBloc.pokemon.name.toUpperCase()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: colorByType(pokemonBloc
                                            .pokemon.types[0].type.name)),
                                    child: iconByType(
                                        pokemonBloc.pokemon.types[0].type.name,
                                        Colors.white,
                                        14)),
                                SizedBox(
                                  width: 3,
                                ),
                                if (pokemonBloc.pokemon.types.length > 1)
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colorByType(pokemonBloc
                                              .pokemon.types[1].type.name)),
                                      child: iconByType(
                                          pokemonBloc
                                              .pokemon.types[1].type.name,
                                          Colors.white,
                                          14)),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                pokemonBloc.pokemon.sprites.frontDefault),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informações'.toUpperCase(),
                          style: TextStyle(
                              color: backgroundColorByType(
                                  pokemonBloc.pokemon.types[0].type.name),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                              height: 80,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Altura'.toUpperCase(),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        pokemonBloc.pokemon.height
                                            .toString()
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: backgroundColorByType(
                                                pokemonBloc.pokemon.types[0]
                                                    .type.name),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        'Peso  '.toUpperCase(),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        pokemonBloc.pokemon.weight
                                            .toString()
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: backgroundColorByType(
                                                pokemonBloc.pokemon.types[0]
                                                    .type.name),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text('habilidades'.toUpperCase()),
                                Container(
                                  width: 100,
                                  height: 80,
                                  alignment: Alignment.center,
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          pokemonBloc.pokemon.abilities.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            alignment: Alignment.center,
                                            height: 20,
                                            child: Text(
                                              pokemonBloc.pokemon
                                                  .abilities[index].ability.name
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: backgroundColorByType(
                                                      pokemonBloc.pokemon
                                                          .types[0].type.name)),
                                            ),
                                          )),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
        : Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ));
  }

  firstLoad(PokemonBloc pokemonBloc) async {
    await pokemonBloc.getPokemon(widget.url);
    _isFirstLoad = false;
    setState(() {
      _isLoading = false;
    });
  }
}
