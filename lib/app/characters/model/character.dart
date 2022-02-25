class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String imageUrl;
  final List episodes;
  final String url;
  final String created;

  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.imageUrl,
      required this.episodes,
      required this.url,
      required this.created});

  factory Character.fromJSON(Map json) {
    return Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Origin.fromJSON(json["origin"]),
        location: Location.fromJSON(json["location"]),
        imageUrl: json["image"],
        episodes: json["episode"],
        url: json["url"],
        created: json["created"]);
  }
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});

  factory Origin.fromJSON(Map json) {
    return Origin(name: json["name"], url: json["url"]);
  }
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJSON(Map json) {
    return Location(name: json["name"], url: json["url"]);
  }
}
