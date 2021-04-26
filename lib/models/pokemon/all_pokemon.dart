class AllPokemon {
  int count;
  String next, previous;
  List<AllPokemonResult> results = [];

  AllPokemon(this.count, this.next, this.previous, this.results);

  AllPokemon.fromJson(Map<String, dynamic> json) {
    this.count = json['count'];
    this.next = json['next'];
    this.previous = json['previous'];

    if (json['results'] != null)
      json['results'].forEach((element) {
        this.results.add(AllPokemonResult.fromJson(element));
      });

    if (json['pokemon'] != null)
      json['pokemon'].forEach((element) {
        this.results.add(AllPokemonResult.fromJson(element['pokemon']));
      });
  }
}

class AllPokemonResult {
  String name, url;

  AllPokemonResult(this.name, this.url);

  AllPokemonResult.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }
}
