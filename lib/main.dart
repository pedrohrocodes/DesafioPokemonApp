import 'package:desafio_pokemon/blocs/pokemon_bloc.dart';
import 'package:desafio_pokemon/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(CustomProvider());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light()
          .copyWith(scaffoldBackgroundColor: Color(0xFFf9fafa)),
      home: HomeScreen(),
    );
  }
}

class CustomProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonBloc>.value(value: PokemonBloc()),
      ],
      child: MyApp(),
    );
  }
}
