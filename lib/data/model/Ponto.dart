import 'dart:convert';

Ponto PontoFromJson(String str) => Ponto.fromJson(json.decode(str));

String PontoToJson(Ponto data) => json.encode(data.toJson());

class Ponto {
  int id;
  int id_funcionario;
  String entrada;
  String saida;
  String intervalo;
  String visita;
  bool isVisita;
  bool fim;

  Ponto(
      {this.id,
      this.id_funcionario,
      this.entrada,
      this.saida,
      this.intervalo,
      this.visita,
      this.isVisita,
      this.fim});

  factory Ponto.fromJson(Map<String, dynamic> json) => new Ponto(
        id: json["_id"] == null ? null : json["_id"],
        id_funcionario:
            json["id_funcionario"] == null ? null : json["id_funcionario"],
        entrada: json["entrada"] == null ? null : json["entrada"],
        saida: json["saida"] == null ? null : json["saida"],
        intervalo: json["intervalo"] == null ? null : json["intervalo"],
        visita: json["visita"] == null ? null : json["visita"],
        isVisita: json["isVisita"] == 1 ? true : false,
        fim: json["fim"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "id_funcionario": id_funcionario == null ? null : id_funcionario,
        "entrada": entrada == null ? null : entrada,
        "saida": saida == null ? null : saida,
        "intervalo": intervalo == null ? null : intervalo,
        "visita": visita == null ? null : visita,
        "isVisita": isVisita ? 1 : 0,
        "fim": fim ? 1 : 0,
      };
}
