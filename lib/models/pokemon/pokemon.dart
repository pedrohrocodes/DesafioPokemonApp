class Pokemon {
  List<PokemonAbilities> abilities = [];
  int baseExperience, height, id, order, weight;
  String name;
  List<PokemonTypes> types = [];
  PokemonSprites sprites;

  Pokemon.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null)
      json['abilities'].forEach((element) {
        this.abilities.add(PokemonAbilities.fromJson(element));
      });

    this.baseExperience = json['base_experience'];
    this.height = json['height'];
    this.id = json['id'];
    this.name = json['name'];
    this.order = json['order'];
    this.sprites = PokemonSprites.fromJson(json['sprites']);

    if (json['types'] != null)
      json['types'].forEach((element) {
        this.types.add(PokemonTypes.fromJson(element));
      });

    this.weight = json['weight'];
  }
}

class PokemonAbilities {
  PokemonAbility ability;
  bool isHidden;
  int slot;

  PokemonAbilities(this.ability, this.isHidden, this.slot);

  PokemonAbilities.fromJson(Map<String, dynamic> json) {
    this.ability = PokemonAbility.fromJson(json['ability']);
    this.isHidden = json['is_hidden'];
    this.slot = json['slot'];
  }
}

class PokemonAbility {
  String name, url;

  PokemonAbility(this.name, this.url);

  PokemonAbility.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }
}

class PokemonTypes {
  int slot;
  PokemonType type;

  PokemonTypes(this.slot, this.type);

  PokemonTypes.fromJson(Map<String, dynamic> json) {
    this.slot = json['slot'];
    this.type = PokemonType.fromJson(json['type']);
  }
}

class PokemonType {
  String name, url;

  PokemonType(this.name, this.url);

  PokemonType.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }
}

class PokemonSprites {
  String frontDefault;

  PokemonSprites(this.frontDefault);

  PokemonSprites.fromJson(Map<String, dynamic> json) {
    this.frontDefault = json['front_default'];
  }
}
