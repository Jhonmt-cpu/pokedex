class EvolutionChain {
  Chain chain;
  int id;

  EvolutionChain({this.chain, this.id});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    chain = json['chain'] != null ? new Chain.fromJson(json['chain']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chain != null) {
      data['chain'] = this.chain.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Chain {
  List<EvolvesTo> evolvesTo;
  NameUrlObject species;

  Chain({this.evolvesTo, this.species});

  Chain.fromJson(Map<String, dynamic> json) {
    if (json['evolves_to'] != null) {
      evolvesTo = new List<EvolvesTo>();
      json['evolves_to'].forEach((v) {
        evolvesTo.add(new EvolvesTo.fromJson(v));
      });
    }
    species = json['species'] != null
        ? new NameUrlObject.fromJson(json['species'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.evolvesTo != null) {
      data['evolves_to'] = this.evolvesTo.map((v) => v.toJson()).toList();
    }
    if (this.species != null) {
      data['species'] = this.species.toJson();
    }
    return data;
  }
}

class EvolvesTo {
  List<EvolvesTo> evolvesTo;

  NameUrlObject species;

  EvolvesTo({this.evolvesTo, this.species});

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolves_to'] != null) {
      evolvesTo = new List<EvolvesTo>();
      json['evolves_to'].forEach((v) {
        evolvesTo.add(new EvolvesTo.fromJson(v));
      });
    }

    species = json['species'] != null
        ? new NameUrlObject.fromJson(json['species'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.evolvesTo != null) {
      data['evolves_to'] = this.evolvesTo.map((v) => v.toJson()).toList();
    }

    if (this.species != null) {
      data['species'] = this.species.toJson();
    }
    return data;
  }
}

class NameUrlObject {
  String name;
  String url;

  NameUrlObject({this.name, this.url});

  NameUrlObject.fromJson(Map<String, dynamic> json) {
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
