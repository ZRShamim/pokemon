import 'dart:convert';

PokemonsModel pokemonsModelFromJson(String str) =>
    PokemonsModel.fromJson(json.decode(str));

String pokemonsModelToJson(PokemonsModel data) => json.encode(data.toJson());

class PokemonsModel {
  PokemonsModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String next;
  final dynamic previous;
  final List<Result> results;

  factory PokemonsModel.fromJson(Map<String, dynamic> json) => PokemonsModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
