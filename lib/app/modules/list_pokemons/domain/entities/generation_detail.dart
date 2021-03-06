class GenerationDetail {
  List<NameUrl> abilities;
  int id;
  NameUrl mainRegion;
  List<NameUrl> moves;
  String name;
  List<NameUrl> names;
  List<NameUrl> pokemonSpecies;
  List<NameUrl> types;
  List<NameUrl> versionGroups;

  GenerationDetail(
      {this.abilities,
      this.id,
      this.mainRegion,
      this.moves,
      this.name,
      this.names,
      this.pokemonSpecies,
      this.types,
      this.versionGroups});

  GenerationDetail.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = new List<NameUrl>();
      json['abilities'].forEach((v) {
        abilities.add(new NameUrl.fromJson(v));
      });
    }
    id = json['id'];
    mainRegion = json['main_region'] != null
        ? new NameUrl.fromJson(json['main_region'])
        : null;
    if (json['moves'] != null) {
      moves = new List<NameUrl>();
      json['moves'].forEach((v) {
        moves.add(new NameUrl.fromJson(v));
      });
    }
    name = json['name'];
    if (json['names'] != null) {
      names = new List<NameUrl>();
      json['names'].forEach((v) {
        names.add(new NameUrl.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = new List<NameUrl>();
      json['pokemon_species'].forEach((v) {
        pokemonSpecies.add(new NameUrl.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = new List<NameUrl>();
      json['types'].forEach((v) {
        types.add(new NameUrl.fromJson(v));
      });
    }
    if (json['version_groups'] != null) {
      versionGroups = new List<NameUrl>();
      json['version_groups'].forEach((v) {
        versionGroups.add(new NameUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilities.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    if (this.mainRegion != null) {
      data['main_region'] = this.mainRegion.toJson();
    }
    if (this.moves != null) {
      data['moves'] = this.moves.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.pokemonSpecies != null) {
      data['pokemon_species'] =
          this.pokemonSpecies.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    if (this.versionGroups != null) {
      data['version_groups'] =
          this.versionGroups.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NameUrl {
  String name;
  String url;

  NameUrl({this.name, this.url});

  NameUrl.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Names {
  NameUrl language;
  String name;

  Names({this.language, this.name});

  Names.fromJson(Map<String, dynamic> json) {
    language = json['language'] != null
        ? new NameUrl.fromJson(json['language'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}
