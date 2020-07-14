import 'dart:convert';

List<Feriados> feriadosFromJson(String str) =>
    List<Feriados>.from(json.decode(str).map((x) => Feriados.fromJson(x)));

String feriadosToJson(List<Feriados> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Feriados {
  Feriados({
    this.date,
    this.title,
    this.description,
    this.legislation,
    this.type,
    this.startTime,
    this.endTime,
    this.variableDates,
  });

  String date;
  String title;
  String description;
  String legislation;
  String type;
  String startTime;
  String endTime;
  Map<String, String> variableDates;

  factory Feriados.fromJson(Map<String, dynamic> json) => Feriados(
        date: json["date"],
        title: json["title"],
        description: json["description"],
        legislation: json["legislation"],
        type: json["type"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        variableDates: Map.from(json["variableDates"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "title": title,
        "description": description,
        "legislation": legislation,
        "type": type,
        "startTime": startTime,
        "endTime": endTime,
        "variableDates": Map.from(variableDates)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
