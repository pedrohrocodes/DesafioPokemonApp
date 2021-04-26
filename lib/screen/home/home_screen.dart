import 'package:desafio_pokemon/blocs/pokemon_bloc.dart';
import 'package:desafio_pokemon/constants.dart';
import 'package:desafio_pokemon/screen/pokemon/pokemon_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isLoading = true;
  bool _isLoadingFilter = false;
  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PokemonBloc pokemonBloc = Provider.of<PokemonBloc>(context);

    if (_isFirstLoad) firstLoad(pokemonBloc);

    return Scaffold(
      body: !_isLoading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Pokédex',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 30,
                    width: double.infinity,
                    // padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pokemonBloc.allTypes.length,
                      itemBuilder: (context, index) =>
                          buildCardsType(index, pokemonBloc),
                    )),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: !_isLoadingFilter
                        ? ListView.builder(
                            itemCount: pokemonBloc.pokemons.length,
                            itemBuilder: (context, index) =>
                                buildPokemonCard(index, pokemonBloc))
                        : Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  new AlwaysStoppedAnimation<Color>(Colors.red),
                            ),
                          )),
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
    );
  }

  firstLoad(PokemonBloc pokemonBloc) async {
    await pokemonBloc.getAllTypes();
    await pokemonBloc.getAllPokemons();
    _isFirstLoad = false;
    setState(() {
      _isLoading = false;
    });
  }

  buildPokemonCard(int index, PokemonBloc bloc) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonScreen(
                url: bloc.pokemons[index].url,
              ),
            ));
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        // padding: const EdgeInsets.all(10),
        height: 60,
        decoration: BoxDecoration(
            color: kFightingBackgroundColor,
            // backgroundColorByType(bloc.pokemons[index].types[0].type.name),
            borderRadius: BorderRadius.circular(13)),
        child: Text(
          bloc.pokemons[index].name.toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),

        // child: Row(
        //   children: [
        //     Image(
        //         image: NetworkImage(bloc.pokemons[index].sprites.frontDefault)),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           bloc.pokemons[index].name.toUpperCase(),
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //               fontSize: 17),
        //         ),
        //         Row(
        //           children: [
        //             Container(
        //               padding: const EdgeInsets.all(3),
        //               decoration: BoxDecoration(
        //                   color: colorByType(
        //                       bloc.pokemons[index].types[0].type.name),
        //                   shape: BoxShape.circle),
        //               child: iconByType(bloc.pokemons[index].types[0].type.name,
        //                   Colors.white, 9),
        //             ),
        //             SizedBox(width: 3),
        //             if (bloc.pokemons[index].types.length > 1)
        //               Container(
        //                 padding: const EdgeInsets.all(3),
        //                 decoration: BoxDecoration(
        //                     color: colorByType(
        //                         bloc.pokemons[index].types[1].type.name),
        //                     shape: BoxShape.circle),
        //                 child: iconByType(
        //                     bloc.pokemons[index].types[1].type.name,
        //                     Colors.white,
        //                     9),
        //               ),
        //           ],
        //         )
        //       ],
        //     ),
        //     Spacer(),
        //     Align(
        //       alignment: Alignment.bottomRight,
        //       child: Text(
        //         '#${bloc.pokemons[index].id}',
        //         style: TextStyle(color: Colors.white38, fontSize: 30),
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }

  buildCardsType(int index, PokemonBloc pokemonBloc) {
    return InkWell(
      onTap: () async {
        setState(() {
          _isLoadingFilter = true;
        });

        _currentIndex = index;

        if (_currentIndex == 0)
          await pokemonBloc.getAllPokemons();
        else
          await pokemonBloc
              .getAllPokemonsByType(pokemonBloc.allTypes[_currentIndex].name);

        setState(() {
          _isLoadingFilter = false;
        });
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          width: 90, // Opcional, porem deixa a largura igual
          decoration: BoxDecoration(
              color: _currentIndex == index
                  ? colorByType(pokemonBloc.allTypes[index].name)
                  : Color(0xFFe9eaeb),
              border: Border.all(
                  color: colorByType(pokemonBloc.allTypes[index].name)),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Spacer(),
              colorByType(pokemonBloc.allTypes[index].name) != Colors.grey
                  ? iconByType(
                      pokemonBloc.allTypes[index].name,
                      _currentIndex != index
                          ? colorByType(pokemonBloc.allTypes[index].name)
                          : Colors.white,
                      16)
                  : Icon(
                      Icons.filter_list,
                      size: 16,
                      color:
                          _currentIndex == index ? Colors.white : Colors.grey,
                    ),
              Spacer(),
              Text(
                pokemonBloc.allTypes[index].name.toUpperCase(),
                style: TextStyle(
                    color:
                        _currentIndex == index ? Colors.white : Colors.black),
              ),
              Spacer(),
            ],
          )),
    );
  }
}
